Profile: ExampleComposition5
Parent: Composition
Description: "Example Composition 5"
Title: "Example Composition 5"
 
* section.code from ExampleCompositionSectionsVS
* section ^slicing.discriminator[+].type = #value
* section ^slicing.discriminator[=].path = "code.coding"
* section ^slicing.rules = #open

//code -> nichts
//code.coding -> required pattern
//code.coding.system -> fixed value
//code.coding.code -> fixed value
* section contains Section1 1..
* section[Section1].code.coding = ExampleCompositionSectionsCS#Section1 (exactly)
* section contains Section2 1..
* section[Section2].code.coding = ExampleCompositionSectionsCS#Section2 
* section contains Section3 1..
* section[Section3].code.coding = ExampleCompositionSectionsCS#Section3 

Instance: TestCodeCodingOptionCode5
InstanceOf: ExampleComposition5
* status = #final
* type = http://loinc.org#60591-5
* date = "2025-09-09"
* author.reference = "Patient/PatientExample"
* title = "Test"
* section[Section1][+].code = ExampleCompositionSectionsCS#Section1
* section[Section1][=].code.coding.display = "Test"
* section[Section1][=].text.status = #generated
* section[Section1][=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">test</div>"
 
* section[Section2][+].code = ExampleCompositionSectionsCS#Section2
* section[Section2][=].text.status = #generated
* section[Section2][=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">test</div>"
 
* section[Section3][+].code = ExampleCompositionSectionsCS#Section3
* section[Section3][=].text.status = #generated
* section[Section3][=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">test</div>"
 
 
 
Instance: TestCodeCodingOptionCodeCoding5
InstanceOf: ExampleComposition5
* status = #final
* type = http://loinc.org#60591-5
* date = "2025-09-09"
* author.reference = "Patient/PatientExample"
* title = "Test"
* section[Section1].code.coding[0] = ExampleCompositionSectionsCS#Section1
* section[Section1].code.coding[=].display = "Test"
* section[Section1].code.coding[+] = ExampleCompositionSectionsCS#Section1
* section[Section1].text.status = #generated
* section[Section1].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">test</div>"
 
* section[Section2].code.coding = ExampleCompositionSectionsCS#Section2
* section[Section2].text.status = #generated
* section[Section2].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">test</div>"
 
* section[Section3].code.coding[0] = ExampleCompositionSectionsCS#Section3
* section[Section3].code.coding[+] = ExampleCompositionSectionsCS#Section3
* section[Section3].code.coding[=].version = "1.3.4"
* section[Section3].text.status = #generated
* section[Section3].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">test</div>"
 
 
 
 
Instance: TestCodeCodingOptionCodeCodingCode5
InstanceOf: ExampleComposition5
* status = #final
* type = http://loinc.org#60591-5
* date = "2025-09-09"
* author.reference = "Patient/PatientExample"
* title = "Test"
* section[Section1][+].code.coding.system = Canonical(ExampleCompositionSectionsCS)
* section[Section1][=].code.coding.code = #Section1
* section[Section1][=].code.coding.display = "Test"
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