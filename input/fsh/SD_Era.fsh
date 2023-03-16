Profile: Era
Parent: Basic
Id: pedcan-era
Description: "A period of time marked by the application of a certain therapeutic approch, disease phase, or other distinguishable health or treatment status. The code element (Basic.code) represents the general type of era (e.g., a treatment era or a disease era), while the EraPhase represents the specific type of the Era (e.g., acute phase of a disease era)."
* extension contains EraPhase named phase 0..1 MS
* extension contains EraNumber named number 1..1 MS
* extension contains EraStartDate named startDate 0..1 MS
* extension contains EraEndDate named endDate 0..1 MS
* extension contains Description named description 0..1 MS

// Extensions

Extension: EraPhase
Id: pedcan-era-phase
Title:  "Era Phase"
Description: "The code refers to the phase of era during which relevant observations were recorded. While 'code' refers the general type of era (e.g., a condition era), the phase is more specific (e.g., acute phase of a condition era)"
* value[x] only CodeableConcept
* value[x] 1..1

Extension: EraNumber
Id: pedcan-era-number
Title:  "Era Number"
Description: "This variable indicates the ordinal numbering of the Era within its various subgroups (e.g., Induction 1, Induction 2, Induction 3, etc.). The observations across domains can therefore be organized longitudinally without the need for specific dates."
* value[x] only unsignedInt   // start at 0 or 1?
* value[x] 1..1

Extension: EraStartDate
Id: pedcan-era-start-date
Title:  "Era Start Date"
Description: "The date when this ordinally numbered era was started."
* value[x] only date
* value[x] 1..1

Extension: EraEndDate
Id: pedcan-era-end-date
Title:  "End Date"
Description: "The date when this ordinally numbered era was ended."
* value[x] only date
* value[x] 1..1

Extension: Description
Id: pedcan-description
Title:  "Description"
Description: "Text description of the resource."
* value[x] only string
* value[x] 1..1

// Specific types of Era

Profile: CourseEra
Parent: Era
Id: pedcan-course-era
Description: "The protocol treatment 'course' during which relevant observations were recorded. This variable is used across domains to frame the timing of these longitudinal observations and reduce the number of redundant variables needed to report similar concepts."
* subject only Reference(Patient or ResearchSubject)  // which?
* code = NCIT#C168807  //  Protocol Treatment Course
* extension[phase].value[x] from CoursePhaseVS

Profile: DiseaseEra
Parent: Era
Id: pedcan-disease-era
Description: "The phase of the cancer treatment process during which relevant observations were recorded. This variable is used across domains to frame the timing of these longitudinal observations and reduce the number of redundant variables needed to report similar concepts."
* subject only Reference(Patient or ResearchSubject)  // which?
* code = NCIT#C168878  // or SCT#278174000 "Disease phase (attribute)"
* extension[phase].value[x] from DiseasePhaseVS

ValueSet: CoursePhaseVS
Id: pedcan-course-phase-vs
Title: "Course Phase Value Set"
Description: "The phase of the treatment associated with the protocol 'course'."
* insert SNOMEDCopyrightForVS
* SCT#1259201000 "Adjuvant drug therapy (procedure)"
* SCT#367336001 "Chemotherapy (procedure)"
* SCT#400001000004103 "Neoadjuvant antineoplastic therapy (procedure)"
* SCT#314122007 "Maintenance therapy (procedure)"

ValueSet: DiseasePhaseVS
Id: pedcan-disease-phase-vs
Title: "Disease Phase Value Set"
Description: "Value set for phases of disease."
* insert SNOMEDCopyrightForVS
* SCT#255251009 "Acute phase (qualifier value)"  // substitute for "initial" ?
* SCT#263855007 "Relapse phase (qualifier value)"
* include codes from system SCT where concept is-a SCT#277022003 "Remission phase (qualifier value)"
// missing initial and progressing. Do we also need stable?


// EXAMPLE
Instance: FirstCourse
InstanceOf: CourseEra
Description: "Example of Course Era resource"
* subject = Reference(cancer-patient-john-anyperson)
* extension[phase].valueCodeableConcept = SCT#314122007 "Maintenance therapy (procedure)"
* extension[startDate].valueDate = 2015-02-07
* extension[endDate].valueDate = 2017-08-16
* extension[number].valueUnsignedInt = 3

Instance: cancer-patient-john-anyperson
InstanceOf: CancerPatient
Description: "Example of Patient"
* identifier.use = #usual
* identifier.type = IDTYPE#MR "Medical Record Number"
* identifier.system = "http://hospital.example.org"
* identifier.value = "m123"
* name.family = "Anyperson"
* name.given[0] = "John"
* name.given[1] = "B."
* contact.telecom[0].system = #phone
* contact.telecom[0].value = "555-555-5555"
* contact.telecom[0].use = #home
* contact.telecom[1].system = #email
* contact.telecom[1].value = "john.anyperson@example.com"
* gender = #male
* birthDate = "1951-01-20"
* address.line = "123 Main St"
* address.city = "Anytown"
* address.postalCode = "12345"
* address.country = "US"
* communication.language = urn:ietf:bcp:47#en-US "English (Region=United States)"
* communication.language.text = "English"