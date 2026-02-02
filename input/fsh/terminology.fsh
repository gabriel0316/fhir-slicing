CodeSystem: ExampleCompositionSectionsCS
Title: "Composition Sections"
Description: "Composition Sections"
* ^status = #draft
* ^experimental = true
* ^caseSensitive = true
* #Section1 "Section 1"
* #Section1 ^designation[0].language = #en-US
* #Section1 ^designation[0].value = "Test"
* #Section2 "Section 2"
* #Section3 "Section 3"
 
ValueSet: ExampleCompositionSectionsVS
Title: "Composition Sections"
Description: "Composition Sections"
* ^experimental = true
* include codes from system ExampleCompositionSectionsCS