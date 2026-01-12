# Composition Sections - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Composition Sections**

## ValueSet: Composition Sections (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:http://example.org/ValueSet/ExampleCompositionSectionsVS | *Version*:0.1.0 |
| Draft as of 2025-12-15 | *Computable Name*:ExampleCompositionSectionsVS |

 
Composition Sections 

 **References** 

* [Example Composition](StructureDefinition-ExampleComposition.md)

### Logical Definition (CLD)

* Include all codes defined in [`http://example.org/CodeSystem/ExampleCompositionSectionsCS`](CodeSystem-ExampleCompositionSectionsCS.md)version 📦0.1.0

 

### Expansion

-------

 Explanation of the columns that may appear on this page: 

| | |
| :--- | :--- |
| Level | A few code lists that FHIR defines are hierarchical - each code is assigned a level. In this scheme, some codes are under other codes, and imply that the code they are under also applies |
| System | The source of the definition of the code (when the value set draws in codes defined elsewhere) |
| Code | The code (used as the code in the resource instance) |
| Display | The display (used in the*display*element of a[Coding](http://hl7.org/fhir/R4/datatypes.html#Coding)). If there is no display, implementers should not simply display the code, but map the concept into their application |
| Definition | An explanation of the meaning of the concept |
| Comments | Additional notes about how to use the code |



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "ExampleCompositionSectionsVS",
  "url" : "http://example.org/ValueSet/ExampleCompositionSectionsVS",
  "version" : "0.1.0",
  "name" : "ExampleCompositionSectionsVS",
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
  "compose" : {
    "include" : [
      {
        "system" : "http://example.org/CodeSystem/ExampleCompositionSectionsCS"
      }
    ]
  }
}

```
