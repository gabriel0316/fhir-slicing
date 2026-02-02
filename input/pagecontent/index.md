<div class="dragon" markdown="1">
The following applies to elements other than `code` (in this case we focused on `Composition.section.code`) as long as they are of type CodeableConcept e.g. `Composition.type`
</div>

### tl;dr - IF YOU DO NOT WANT TO READ THE WHOLE PAGE

**`exactly` grundsätzlich nicht verwenden!** `exactly` führt zu beträchtlichen Einschränkungen (siehe unten TODO: Link einfügen)
</br>
Wenn im Slice **zumindest 1 Coding** mit den angegeben Werten vorkommen soll:
- `discriminator.path = "code"` (=CodeableConcept-Ebene)
</br>
Wenn im Slice **genau 1 Coding** mit den angegeben Werten vorkommen soll und kein anderes Coding:
- `discriminator.path = "code.coding"` oder `discriminator.path = "code.coding.code"` (=Coding- oder Code-Ebene)
- Zwischen den beiden gibt es keinen Unterschied, wenn `exactly` nicht verwendet wird.

### Grundregeln

#### Zusammenhang zwischen discriminator.path und Slice-Ebene

**`discriminator.path` und die Ebene auf der die einzelenen Slices angegeben werden, müssen übereinstimmen!** Siehe folgendes Beispiel.

<style>
.my-table {
  width: 100%;
  table-layout: fixed;
}

.my-table .img-cell {
  max-width: 100%;
  height: auto;
  display: block;
}

.my-table, .my-table th, .my-table td {
  border: 1px solid black;
}

.correct pre {
  background-color: #90EE90;
}
.correct .highlight {
  background-color: #4E9A4E;
}

.wrong pre {
  background-color: #FFB6B6;
}
.wrong .highlight {
  background-color: #B84A4A;
}
</style>

<table class="my-table">
  <tr>
    <th>Richtig</th>
    <th>Falsch</th>
  </tr>
  <tr>
    <td>Verwendung von <code>code</code> in <code>discriminator.path</code> und Festlegung des Codes auf <code>section.code</code>.</td>
    <td>Verwendung von <code>code.coding.code</code> in <code>discriminator.path</code> und Festlegung des Codes auf <code>section.code</code>.</td>
  </tr>
  <tr>
    <td class="correct"><pre>
* section.code from ExampleCompositionSectionsVS
* section ^slicing.discriminator[+].type = #value
* section ^slicing.discriminator[=].path = <span class="highlight">"code"</span>
* section ^slicing.rules = #open
* section contains Section1 1..
* section[Section1].<span class="highlight">code</span> = ExampleCompositionSectionsCS#Section1
* section contains Section2 1..
* section[Section2].<span class="highlight">code</span> = ExampleCompositionSectionsCS#Section2
* section contains Section3 1..
* section[Section3].<span class="highlight">code</span> = ExampleCompositionSectionsCS#Section3
    </pre></td>
    <td class="wrong"><pre>
* section.code from ExampleCompositionSectionsVS
* section ^slicing.discriminator[+].type = #value
* section ^slicing.discriminator[=].path = <span class="highlight">"code.coding.code"</span>
* section ^slicing.rules = #open
* section contains Section1 1..
* section[Section1].<span class="highlight">code</span> = ExampleCompositionSectionsCS#Section1
* section contains Section2 1..
* section[Section2].<span class="highlight">code</span> = ExampleCompositionSectionsCS#Section2
* section contains Section3 1..
* section[Section3].<span class="highlight">code</span> = ExampleCompositionSectionsCS#Section3
    </pre></td>
  </tr>
</table>

#### Einheitliche Slice-Ebene

**Alle Slices müssen die selbe Slice-Ebene verwenden!** Siehe folgendes Beispiel:

<table class="my-table">
  <tr>
    <th>Richtig</th>
    <th>Falsch</th>
  </tr>
  <tr>
    <td>Verwendung von <code>code</code> in <code>discriminator.path</code> und Festlegung des Codes auf <code>section.code</code>.</td>
    <td>Verwendung von <code>code</code> in <code>discriminator.path</code> und Festlegung des Codes auf <code>section.code.coding</code> für <code>Section2</code></td>
  </tr>
  <tr>
    <td class="correct"><pre>
* section.code from ExampleCompositionSectionsVS
* section ^slicing.discriminator[+].type = #value
* section ^slicing.discriminator[=].path = <span class="highlight">"code"</span>
* section ^slicing.rules = #open
* section contains Section1 1..
* section[Section1].<span class="highlight">code</span> = ExampleCompositionSectionsCS#Section1
* section contains Section2 1..
* section[Section2].<span class="highlight">code</span> = ExampleCompositionSectionsCS#Section2
* section contains Section3 1..
* section[Section3].<span class="highlight">code</span> = ExampleCompositionSectionsCS#Section3
    </pre></td>
    <td class="wrong"><pre>
* section.code from ExampleCompositionSectionsVS
* section ^slicing.discriminator[+].type = #value
* section ^slicing.discriminator[=].path = <span class="highlight">"code"</span>
* section ^slicing.rules = #open
* section contains Section1 1..
* section[Section1].<span class="highlight">code</span> = ExampleCompositionSectionsCS#Section1
* section contains Section2 1..
* section[Section2].<span class="highlight">code.coding</span> = ExampleCompositionSectionsCS#Section2
    </pre></td>
  </tr>
</table>

### Auswirkungen unterschiedlicher discriminator.path-Angaben (OHNE exactly)

#### discriminator.path = "code" (CodeableConcept-Ebene) (OHNE exactly)

<table class="my-table">
  <tr>
    <th>FSH</th>
    <th>IG</th>
  </tr>
  <tr>
    <td colspan="2"><a href="StructureDefinition-ExampleComposition4.html">ExampleComposition4</a></td>
  </tr>
  <tr>
    <td><pre>
* section.code from ExampleCompositionSectionsVS
* section ^slicing.discriminator[+].type = #value
* section ^slicing.discriminator[=].path = "code"
* section ^slicing.rules = #open
* section contains Section2 1..
* section[Section2].code = ExampleCompositionSectionsCS#Section2
    </pre></td>
    <td><img src="CodeableConcept-level-slicing.png" class="img-cell"></td>
  </tr>
</table>

#### discriminator.path = "code.coding" (Coding-Ebene) (OHNE exactly)

<table class="my-table">
  <tr>
    <th>FSH</th>
    <th>IG</th>
  </tr>
  <tr>
    <td colspan="2"><a href="StructureDefinition-ExampleComposition5.html">ExampleComposition5</a></td>
  </tr>
  <tr>
    <td><pre>
* section.code from ExampleCompositionSectionsVS
* section ^slicing.discriminator[+].type = #value
* section ^slicing.discriminator[=].path = "code.coding"
* section ^slicing.rules = #open
* section contains Section2 1..
* section[Section2].code.coding = ExampleCompositionSectionsCS#Section2
    </pre></td>
    <td><img src="Coding-level-slicing.png" class="img-cell"></td>
  </tr>
</table>

#### discriminator.path = "code.coding.code" (Code-Ebene) (OHNE exactly)

<table class="my-table">
  <tr>
    <th>FSH</th>
    <th>IG</th>
  </tr>
  <tr>
    <td colspan="2"><a href="StructureDefinition-ExampleComposition6.html">ExampleComposition6</a></td>
  </tr>
  <tr>
    <td><pre>
* section.code from ExampleCompositionSectionsVS
* section ^slicing.discriminator[+].type = #value
* section ^slicing.discriminator[=].path = "code.coding.code"
* section ^slicing.rules = #open
* section contains Section2 1..
* section[Section2].code.coding.system = Canonical(ExampleCompositionSectionsCS)
* section[Section2].code.coding.code = #Section2
    </pre></td>
    <td><img src="Code-level-slicing.png" class="img-cell"></td>
  </tr>
</table>

### Auswirkungen unterschiedlicher discriminator.path-Angaben (MIT exactly)

#### discriminator.path = "code" (CodeableConcept-Ebene) (MIT exactly)

<table class="my-table">
  <tr>
    <th>FSH</th>
    <th>IG</th>
  </tr>
  <tr>
    <td colspan="2"><a href="StructureDefinition-ExampleComposition4.html">ExampleComposition4</a></td>
  </tr>
  <tr>
    <td><pre>
* section.code from ExampleCompositionSectionsVS
* section ^slicing.discriminator[+].type = #value
* section ^slicing.discriminator[=].path = "code"
* section ^slicing.rules = #open
* section contains Section1 1..
* section[Section1].code = ExampleCompositionSectionsCS#Section1 (exactly)
    </pre></td>
    <td><img src="CodeableConcept-level-slicing_exactly.png" class="img-cell"></td>
  </tr>
</table>

#### discriminator.path = "code.coding" (Coding-Ebene) (MIT exactly)

<table class="my-table">
  <tr>
    <th>FSH</th>
    <th>IG</th>
  </tr>
  <tr>
    <td colspan="2"><a href="StructureDefinition-ExampleComposition5.html">ExampleComposition5</a></td>
  </tr>
  <tr>
    <td><pre>
* section.code from ExampleCompositionSectionsVS
* section ^slicing.discriminator[+].type = #value
* section ^slicing.discriminator[=].path = "code.coding"
* section ^slicing.rules = #open
* section contains Section1 1..
* section[Section1].code.coding = ExampleCompositionSectionsCS#Section1 (exactly)
    </pre></td>
    <td><img src="Coding-level-slicing_exactly.png" class="img-cell"></td>
  </tr>
</table>

#### discriminator.path = "code.coding.code" (Code-Ebene) (MIT exactly)

<table class="my-table">
  <tr>
    <th>FSH</th>
    <th>IG</th>
  </tr>
  <tr>
    <td colspan="2"><a href="StructureDefinition-ExampleComposition6.html">ExampleComposition6</a></td>
  </tr>
  <tr>
    <td><pre>
* section.code from ExampleCompositionSectionsVS
* section ^slicing.discriminator[+].type = #value
* section ^slicing.discriminator[=].path = "code.coding.code"
* section ^slicing.rules = #open
* section contains Section1 1..
* section[Section1].code.coding.system = Canonical(ExampleCompositionSectionsCS)
* section[Section1].code.coding.code = #Section1 (exactly)
    </pre></td>
    <td><img src="Code-level-slicing_exactly.png" class="img-cell"></td>
  </tr>
</table>

### Required Pattern vs. Fixed Value

#### Rendering im IG vs. StructureDefinition

Der IG Publisher passt das Rendering an die Hierachie an (siehe [Auswirkungen unterschiedlicher discriminator.path-Angaben (OHNE exactly)](#auswirkungen-unterschiedlicher-discriminatorpath-angaben-ohne-exactly)). Ausschlaggebend für die Beurteilung eines Slices ist immer die höchste Hierarchieebene. Das bedeutet, wird als `discriminator.path = "code"` angegeben, ist die relevante Information, ob es sich um ein Pattern ([ElementDefinition pattern\[x\]](https://build.fhir.org/elementdefinition-definitions.html#ElementDefinition.pattern_x_)) oder einen Fixed Value ([ElementDefinition fixed\[x\]](https://build.fhir.org/elementdefinition-definitions.html#ElementDefinition.fixed_x_)) handelt auf CodeableConcept-Ebene zu finden. In den darunter liegenden Hierarchien gibt der IG Publisher trotzdem "Fixed value" an, selbst wenn es vielleicht nur ein Pattern im Sinne der StructureDefinition ist.

#### Fixed Values im FSH setzen

Nur die Angabe von `exactly` im FSH führt in der StructureDefinition zu einem Fixed Value. Alles Andere führt zu Pattern in der StructureDefinition.

<table class="my-table">
  <tr>
    <th></th>
    <th>OHNE <code>exactly></th>
    <th>MIT <code>exactly></th>
  </tr>
  <tr>
    <td><strong>CodeableConcept-Ebene</strong></td>
    <td>Ist auf der CodeableConcept Ebene ein Pattern gesetzt, dann werden weitere Codings erlaubt.</td>
    <td>Ist auf der CodeableConcept Ebene ein Fixed Value gesetzt, dann werden keine weiteren Codings erlaubt. Darüberhinaus ist das Befüllen anderer Elemente als die Slice definierten verboten.</td>
  </tr>
  <tr>
    <td><strong>Coding-Ebene</strong></td>
    <td>Wenn auf Coding-Ebene ein Pattern gesetzt wird, können zusätzlich zum vorgegebenen Code auch displays, extensions etc. verwendet werden.</td>
    <td>Wenn auf coding ebene ein Fixed Value gesetzt wird, dann dürfen darunter nur die angegebenen Elmente mit den Fixed Values vorkommen und keine anderen Elemente, z.B. wenn system, code und display fixiert sind, dann müssen diese vorhanden sein und den vorgegebenen Werten entsprechen und z.B. eine version oder extension ist nicht erlaubt.</td>
  </tr>
  <tr>
    <td><strong>Code-Ebene</strong></td>
    <td colspan="2">Pattern und Fixed Value bedeuten für primitive Datentypen (system -> uri, code -> code) das gleiche - dh. eine exakte Übereinstimmung ist erforderlich.</td>
  </tr>
</table>

### Empfehlungen

#### Zusätzliche Codings erlauben

Wenn zusätzliche Code+System-Kombinationen erlaubt sein sollen, dann muss im `discriminator.path = "code"` (CodeableConcept-Ebene) verwendet werden.
Ob zusätzliche Felder im vom Slice definierten Coding erlaubt sind (display, extension, ...) hängt davon ab, ob `exactly` auf `code` (CodeableConcept-Ebene) verwendet wird oder nicht. Bei der Verwendung von `exactly` auf `code` (CodeableConcept-Ebene) sind keine anderen Elemente erlaubt.

#### Nur genau eine Kombination aus Code + System erlaubt und keine andere

Wenn keine zusätzlichen Code+System-Kombinationen erlaubt sein sollen, dann muss im  `discriminator.path = "code.coding"` oder `discriminator.path = "code.coding.code"` verwendet werden.
Ob zusätzliche Felder im vom Slice definierten Coding erlaubt sind (display, extension,...) hängt davon ab, ob `exactly` auf `code.coding` verwendet wird oder nicht. Bei der Verwendung von `exactly` auf `code.coding` (Coding-Ebene) sind keine anderen Elemente erlaubt.

