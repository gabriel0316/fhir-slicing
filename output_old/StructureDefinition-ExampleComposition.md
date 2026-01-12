# Example Composition - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example Composition**

## Resource Profile: Example Composition 

| | |
| :--- | :--- |
| *Official URL*:http://example.org/StructureDefinition/ExampleComposition | *Version*:0.1.0 |
| Draft as of 2025-12-15 | *Computable Name*:ExampleComposition |

 
Example Composition 

**Usages:**

* Examples for this Profile: [Composition/ExampleComposition1](Composition-ExampleComposition1.md), [Composition/ExampleComposition2](Composition-ExampleComposition2.md) and [Composition/ExampleComposition3](Composition-ExampleComposition3.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/fhir.example|current/StructureDefinition/ExampleComposition)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ExampleComposition.csv), [Excel](StructureDefinition-ExampleComposition.xlsx), [Schematron](StructureDefinition-ExampleComposition.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ExampleComposition",
  "url" : "http://example.org/StructureDefinition/ExampleComposition",
  "version" : "0.1.0",
  "name" : "ExampleComposition",
  "title" : "Example Composition",
  "status" : "draft",
  "date" : "2025-12-15T11:10:46+01:00",
  "publisher" : "Example Publisher",
  "contact" : [
    {
      "name" : "Example Publisher",
      "telecom" : [
        {
          "system" : "url",
          "value" : "http://example.org/example-publisher"
        }
      ]
    }
  ],
  "description" : "Example Composition",
  "fhirVersion" : "4.0.1",
  "mapping" : [
    {
      "identity" : "workflow",
      "uri" : "http://hl7.org/fhir/workflow",
      "name" : "Workflow Pattern"
    },
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    },
    {
      "identity" : "cda",
      "uri" : "http://hl7.org/v3/cda",
      "name" : "CDA (R2)"
    },
    {
      "identity" : "fhirdocumentreference",
      "uri" : "http://hl7.org/fhir/documentreference",
      "name" : "FHIR DocumentReference"
    },
    {
      "identity" : "w5",
      "uri" : "http://hl7.org/fhir/fivews",
      "name" : "FiveWs Pattern Mapping"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Composition",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Composition",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Composition",
        "path" : "Composition"
      },
      {
        "id" : "Composition.section",
        "path" : "Composition.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code.coding"
            }
          ],
          "rules" : "open"
        },
        "min" : 3
      },
      {
        "id" : "Composition.section.code",
        "path" : "Composition.section.code",
        "binding" : {
          "strength" : "required",
          "valueSet" : "http://example.org/ValueSet/ExampleCompositionSectionsVS"
        }
      },
      {
        "id" : "Composition.section:Section1",
        "path" : "Composition.section",
        "sliceName" : "Section1",
        "min" : 1,
        "max" : "*"
      },
      {
        "id" : "Composition.section:Section1.code",
        "path" : "Composition.section.code",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://example.org/CodeSystem/ExampleCompositionSectionsCS",
              "code" : "Section1"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:Section2",
        "path" : "Composition.section",
        "sliceName" : "Section2",
        "min" : 1,
        "max" : "*"
      },
      {
        "id" : "Composition.section:Section2.code.coding.system",
        "path" : "Composition.section.code.coding.system",
        "patternUri" : "http://example.org/CodeSystem/ExampleCompositionSectionsCS"
      },
      {
        "id" : "Composition.section:Section2.code.coding.code",
        "path" : "Composition.section.code.coding.code",
        "patternCode" : "Section2"
      },
      {
        "id" : "Composition.section:Section3",
        "path" : "Composition.section",
        "sliceName" : "Section3",
        "min" : 1,
        "max" : "*"
      },
      {
        "id" : "Composition.section:Section3.code.coding",
        "path" : "Composition.section.code.coding",
        "min" : 1,
        "patternCoding" : {
          "system" : "http://example.org/CodeSystem/ExampleCompositionSectionsCS",
          "code" : "Section3"
        }
      }
    ]
  }
}

```
