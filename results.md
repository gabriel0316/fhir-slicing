# Slicing

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



# Fixed Value vs. Required Pattern




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

