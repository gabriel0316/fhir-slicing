Profile: ExampleComposition3
Parent: Composition
Description: "Example Composition"
Title: "Example Composition"
 
* section.code from ExampleCompositionSectionsVS
* section ^slicing.discriminator[+].type = #value
* section ^slicing.discriminator[=].path = "code"
* section ^slicing.rules = #open
//code -> required pattern
//code.coding -> fixed value
//code.coding.system-> fixed value
//code.coding.code -> fixed value
* section contains Section1 1..
* section[Section1].code = ExampleCompositionSectionsCS#Section1
//code -> nichts
//code.coding -> nichts 
//code.coding.system-> required pattern
//code.coding.code -> required pattern
* section contains Section2 1..
* section[Section2].code.coding.system = Canonical(ExampleCompositionSectionsCS)
* section[Section2].code.coding.code = #Section2
//code -> nichts
//code.coding -> required pattern
//code.coding.system-> fixed value
//code.coding.code -> fixed value
* section contains Section3 1..
* section[Section3].code.coding = ExampleCompositionSectionsCS#Section3 


Instance: TestCodeOptionCode
InstanceOf: ExampleComposition3
* status = #final
* type = http://loinc.org#60591-5
* date = "2025-09-09"
* author.reference = "Patient/PatientExample"
* title = "Test"
* section[Section1][+].code = ExampleCompositionSectionsCS#Section1
* section[Section1][=].text.status = #generated
* section[Section1][=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">test</div>"
 
* section[Section2][+].code = ExampleCompositionSectionsCS#Section2
* section[Section2][=].text.status = #generated
* section[Section2][=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">test</div>"
 
* section[Section3][+].code = ExampleCompositionSectionsCS#Section3
* section[Section3][=].text.status = #generated
* section[Section3][=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">test</div>"
 
 
 
Instance: TestCodeOptionCodeCoding
InstanceOf: ExampleComposition3
* status = #final
* type = http://loinc.org#60591-5
* date = "2025-09-09"
* author.reference = "Patient/PatientExample"
* title = "Test"
* section[Section1][+].code.coding = ExampleCompositionSectionsCS#Section1
* section[Section1][=].text.status = #generated
* section[Section1][=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">test</div>"
 
* section[Section2][+].code.coding = ExampleCompositionSectionsCS#Section2
* section[Section2][=].text.status = #generated
* section[Section2][=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">test</div>"
 
* section[Section3][+].code.coding = ExampleCompositionSectionsCS#Section3
* section[Section3][=].text.status = #generated
* section[Section3][=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">test</div>"
 
 
 
 
Instance: TestCodeOptionCodeCodingCode
InstanceOf: ExampleComposition3
* status = #final
* type = http://loinc.org#60591-5
* date = "2025-09-09"
* author.reference = "Patient/PatientExample"
* title = "Test"
* section[Section1][+].code.coding.system = Canonical(ExampleCompositionSectionsCS)
* section[Section1][=].code.coding.code = #Section1
* section[Section1][=].text.status = #generated
* section[Section1][=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">test</div>"
 
* section[Section2][+].code.coding.system = Canonical(ExampleCompositionSectionsCS)
* section[Section2][=].code.coding.code = #Section2
* section[Section2][=].text.status = #generated
* section[Section2][=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">test</div>"
 
* section[Section3][+].code.coding.system = Canonical(ExampleCompositionSectionsCS)
* section[Section3][=].code.coding.code = #Section3
* section[Section3][=].text.status = #generated
* section[Section3][=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">test</div>"