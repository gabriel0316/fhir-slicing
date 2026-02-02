# Slicing

> [!IMPORTANT]
> The following applies to elements other than code as well as long as they are of type CodeableConcept
> e.g. type.coding.code

## tl;dr - IF YOU DO NOT WANT TO READ ALL THIS:

- Exactly nicht verwenden -> führt zu beträchtlichen Einschränkungen (siehe Unten TODO: Link einfügen)

Wenn im Slice zumindest 1 coding mit den angegeben Werten vorkommen soll:
- discriminator path = "code" (CodeableConcept-Ebene)

Wenn im Slice genau 1 coding mit den angegeben Werten vorkommen soll und kein anderes:
- discriminator path = "code.coding" oder path = "code.coding.code" (Coding oder Code Ebene)
- Kein Unterschied zwischen den beiden, wenn exactly nicht verwendet wird


## Grundregeln:

### Discriminator Path + Slice Ebene
Slicing discriminator.path Ebene und die verwendete Ebene im fsh in den einzelenen Slices müssen übereinstimmen

Beispiel:

Richtig:
```
* section.code from ExampleCompositionSectionsVS
* section ^slicing.discriminator[+].type = #value
* section ^slicing.discriminator[=].path = "code"
* section ^slicing.rules = #open
* section contains Section1 1..
* section[Section1].code = ExampleCompositionSectionsCS#Section1
* section contains Section2 1..
* section[Section2].code = ExampleCompositionSectionsCS#Section2
* section contains Section3 1..
* section[Section3].code = ExampleCompositionSectionsCS#Section3
```

Falsch:
```
* section.code from ExampleCompositionSectionsVS
* section ^slicing.discriminator[+].type = #value
* section ^slicing.discriminator[=].path = "code.coding.code"
* section ^slicing.rules = #open
* section contains Section1 1..
* section[Section1].code = ExampleCompositionSectionsCS#Section1
* section contains Section2 1..
* section[Section2].code = ExampleCompositionSectionsCS#Section2
* section contains Section3 1..
* section[Section3].code = ExampleCompositionSectionsCS#Section3
```

### Einheitliche Slice Ebene
Alle Slices müssen die selbe Ebene verwenden

Beispiel:

Richtig:
```
* section.code from ExampleCompositionSectionsVS
* section ^slicing.discriminator[+].type = #value
* section ^slicing.discriminator[=].path = "code"
* section ^slicing.rules = #open
* section contains Section1 1..
* section[Section1].code = ExampleCompositionSectionsCS#Section1
* section contains Section2 1..
* section[Section2].code = ExampleCompositionSectionsCS#Section2
* section contains Section3 1..
* section[Section3].code = ExampleCompositionSectionsCS#Section3
```

Falsch:

```
* section.code from ExampleCompositionSectionsVS
* section ^slicing.discriminator[+].type = #value
* section ^slicing.discriminator[=].path = "code"
* section ^slicing.rules = #open
* section contains Section1 1..
* section[Section1].code = ExampleCompositionSectionsCS#Section1
* section contains Section2 1..
* section[Section2].code.coding = ExampleCompositionSectionsCS#Section2
```

## Auswirkungen unterschiedlicher discriminator paths:

> [!CAUTION]
> Unter der Bedingung, dass exactly nicht verwendet wird

### Path = "code" (CodeableConcept Ebene)
Führt zu:
```
//code -> required pattern
//code.coding -> fixed value
//code.coding.system-> fixed value
//code.coding.code -> fixed value
```
### Path = "code.coding" (Coding Ebene)
Führt zu:
```
//code -> nichts
//code.coding -> required pattern
//code.coding.system -> fixed value
//code.coding.code -> fixed value
```
### Path = "code.coding.code" (Code+System Ebene)
```
Führt zu:
//code -> nichts
//code.coding -> nichts 
//code.coding.system-> required pattern
//code.coding.code -> required pattern
```

# Fixed Value vs. Required Pattern


### Rendering im IG vs. StructureDefinition
Der IG Publisher passt das Rendering an die Hierachie an. Ausschlaggebend vom constraint der obersten Ebene werden (fixed vs. required) der darunterliegenden angepasst. Es kann daher sein, dass in der StructureDefinition zwar requiredPattern angegeben ist - im Rendering aber ein "Fixed Value" angezeigt wird. 

TODO -> Fixed Value (Complex), Fixed Value at least one of the following,...


### Fixed Values im FSH setzen
Nur die Angabe von exactly im fsh führt in der StructureDefinition zu fixed value -> alles Andere führt zu required patterns in der structureDefinition. Das rendering und die Bedeutung im IG hängt allerdings von der Ebene ab auf der das ganze constrained ist (siehe [Fixed Value auf CodeableConcept Ebene](#fixed-value-auf-codeableconcept-ebene)& [Required Pattern auf CodeableConcept Ebene](#required-pattern-auf-codeableconcept-ebene))


### Required Pattern vs. Fixed Value bei primitives
required pattern und fixed value bedeuten für primitive types (system -> uri, code -> code) das gleiche (exact match notwendig)

[ElementDefinition pattern\[x\]](https://build.fhir.org/elementdefinition-definitions.html#ElementDefinition.pattern_x_)

[ElementDefinition fixed\[x\]](https://build.fhir.org/elementdefinition-definitions.html#ElementDefinition.fixed_x_)


### Fixed Value auf CodeableConcept Ebene
Ist auf der CodeableConcept Ebene ein constraint (fixed value) dann wird die Kardinalität vom Coding 1..1 und wird zum fixed value im rendering vom IG

### Required Pattern auf CodeableConcept Ebene
Ist auf der CodeableConcept Ebene ein constraint (required pattern) dann wird die Kardinalität zu 1..* und erlaubt weitere codings. Das Coding rendert dann aber als fixed value inklusive fixed code + system

### Fixed Value auf Coding Ebene
Wenn auf coding ebene ein fixed value (fsh: exactly) ist dann dürfen darunter nur die angegebenen elmente mit den fixed values vorkommen und keine anderen -> z.b. wenn system, code und display fixed sind dann müssen diese vorhanden sein und den values entsprechen und z.b. eine version oder extension ist nicht erlaubt

### Required Pattern auf Coding Ebene
Wenn auf Coding-Ebene ein required pattern (kein exactly) ist dann können zusätzlich zum fixed code+system auch displays, extensions etc. verwendet.

# Empfehlungen

# Nur genau eine Kombination aus Code+System erlaubt und keine andere
Wenn keine zusätzlichen Code+system Kombinationen erlaubt sein sollen dann muss im discriminator path "code.coding" oder "code.coding.code" verwendet werden.
Ob zusätzliche Felder im vom Slice definierten Coding erlaubt sind (display, extension,...) hängt davon ab, ob exactly auf code.coding verwendet wird oder nicht. Bei der Verwendung von exactly auf code.coding (Coding-Ebene) sind keine anderen Elemente erlaubt.

# Zusätzliche Codings erlauben
Wenn zusätzliche Code+System Kombinationen erlaubt sein sollen dann muss im discriminator path "code" (CodeableConcept-Ebene) verwendet werden.
Ob zusätzliche Felder im vom Slice definierten Coding erlaubt sind (display, extension,...) hängt davon ab, ob exactly auf code (CodeableConcept-Ebene) verwendet wird oder nicht. Bei der Verwendung von exactly auf code (CodeableConcept-Ebene) sind keine anderen Elemente erlaubt.


