# Test - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Test**

## Example Composition: Test

Profile: [Example Composition](StructureDefinition-ExampleComposition.md)

**status**: Final

**type**: Patient summary Document

**date**: 2025-09-09

**author**: [James Pond (no stated gender), DoB Unknown](Patient-PatientExample.md)

**title**: Test



## Resource Content

```json
{
  "resourceType" : "Composition",
  "id" : "ExampleComposition3",
  "meta" : {
    "profile" : ["http://example.org/StructureDefinition/ExampleComposition"]
  },
  "status" : "final",
  "type" : {
    "coding" : [
      {
        "system" : "http://loinc.org",
        "code" : "60591-5"
      }
    ]
  },
  "date" : "2025-09-09",
  "author" : [
    {
      "reference" : "Patient/PatientExample"
    }
  ],
  "title" : "Test",
  "section" : [
    {
      "code" : {
        "coding" : [
          {
            "system" : "http://example.org/CodeSystem/ExampleCompositionSectionsCS",
            "code" : "Section1"
          }
        ]
      },
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\">test</div>"
      }
    },
    {
      "code" : {
        "coding" : [
          {
            "system" : "http://example.org/CodeSystem/ExampleCompositionSectionsCS",
            "code" : "Section2"
          }
        ]
      },
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\">test</div>"
      }
    },
    {
      "code" : {
        "coding" : [
          {
            "system" : "http://example.org/CodeSystem/ExampleCompositionSectionsCS",
            "code" : "Section3"
          }
        ]
      },
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\">test</div>"
      }
    }
  ]
}

```
