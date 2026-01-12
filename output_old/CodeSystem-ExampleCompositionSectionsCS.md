# Composition Sections - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Composition Sections**

## CodeSystem: Composition Sections (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:http://example.org/CodeSystem/ExampleCompositionSectionsCS | *Version*:0.1.0 |
| Draft as of 2025-12-15 | *Computable Name*:ExampleCompositionSectionsCS |

 
Composition Sections 

 This Code system is referenced in the content logical definition of the following value sets: 

* [ExampleCompositionSectionsVS](ValueSet-ExampleCompositionSectionsVS.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "ExampleCompositionSectionsCS",
  "url" : "http://example.org/CodeSystem/ExampleCompositionSectionsCS",
  "version" : "0.1.0",
  "name" : "ExampleCompositionSectionsCS",
  "title" : "Composition Sections",
  "status" : "draft",
  "experimental" : true,
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
  "description" : "Composition Sections",
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 3,
  "concept" : [
    {
      "code" : "Section1",
      "display" : "Section 1"
    },
    {
      "code" : "Section2",
      "display" : "Section 2"
    },
    {
      "code" : "Section3",
      "display" : "Section 3"
    }
  ]
}

```
