CodeSystem: ExampleCompositionSectionsCS
Title: "Composition Sections"
Description: "Composition Sections"
* ^status = #draft
* ^experimental = true
* ^caseSensitive = true
* #Section1 "Section 1"
* #Section2 "Section 2"
* #Section3 "Section 3"
 
ValueSet: ExampleCompositionSectionsVS
Title: "Composition Sections"
Description: "Composition Sections"
* ^experimental = true
* include codes from system ExampleCompositionSectionsCS
 
Profile: ExampleComposition
Parent: Composition
Description: "Example Composition"
Title: "Example Composition"
 
* section.code from ExampleCompositionSectionsVS
* section ^slicing.discriminator[+].type = #value
* section ^slicing.discriminator[=].path = "code"
* section ^slicing.rules = #open
* section contains Section1 1..
* section[Section1].code = ExampleCompositionSectionsCS#Section1
* section contains Section3 1..
* section[Section3].code.coding = ExampleCompositionSectionsCS#Section3
* section contains Section2 1..
* section[Section2].code.coding.system = Canonical(ExampleCompositionSectionsCS)
* section[Section2].code.coding.code = #Section2
 
 
Instance: ExampleComposition1
InstanceOf: ExampleComposition
* status = #final
* type = http://loinc.org#60591-5
* date = "2025-09-09"
* author.reference = "Patient/PatientExample"
* title = "Test"
* section[Section1][+].code = ExampleCompositionSectionsCS#Section1
 
* section[Section2][+].code = ExampleCompositionSectionsCS#Section2
 
* section[Section3][+].code = ExampleCompositionSectionsCS#Section3
 
 
 
Instance: ExampleComposition2
InstanceOf: ExampleComposition
* status = #final
* type = http://loinc.org#60591-5
* date = "2025-09-09"
* author.reference = "Patient/PatientExample"
* title = "Test"
* section[Section1][+].code.coding = ExampleCompositionSectionsCS#Section1
 
* section[Section2][+].code.coding = ExampleCompositionSectionsCS#Section2
 
* section[Section3][+].code.coding = ExampleCompositionSectionsCS#Section3
 
 
 
 
Instance: ExampleComposition3
InstanceOf: ExampleComposition
* status = #final
* type = http://loinc.org#60591-5
* date = "2025-09-09"
* author.reference = "Patient/PatientExample"
* title = "Test"
* section[Section1][+].code.coding.system = Canonical(ExampleCompositionSectionsCS)
* section[Section1][=].code.coding.code = #Section1
 
* section[Section2][+].code.coding.system = Canonical(ExampleCompositionSectionsCS)
* section[Section2][=].code.coding.code = #Section2
 
* section[Section3][+].code.coding.system = Canonical(ExampleCompositionSectionsCS)
* section[Section3][=].code.coding.code = #Section3