Profile: DiseasePhase
Parent: TreatmentPhase
Id: pedcan-disease-phase
Description: "The phase of the cancer treatment process during which relevant observations were recorded. This profile is used across domains to frame the timing of these longitudinal observations and reduce the number of redundant variables needed to report similar concepts."
//* subject only Reference(Patient or ResearchSubject)  // which? //I'm not sure why but I'm getting an error, commenting out
//* code = SCT#278174000 "Disease phase (attribute)"
// * extension[phaseName].value[x] from DiseasePhaseValueVS //I'm not sure why but I'm getting an error, commenting out

ValueSet: DiseasePhaseValueVS
Id: pedcan-disease-phase-value-vs
Title: "Disease Phase Value Set"
Description: "Value set for phases of disease."
* insert SNOMEDCopyrightForVS
* SCT#263855007 "Relapse phase (qualifier value)"
* SCT#246455001 "Recurrence (qualifier value)"
* SCT#723506003 "Resolved (qualifier value)"
* SCT#20646008 "Intractable (qualifier value)"
* include codes from system SCT where concept is-a SCT#277022003 "Remission phase (qualifier value)"
* NCIT#C15903 "No Prior Cancer Therapy"
* NCIT#C16124 "Prior Therapy"
* NCIT#C19987 "Cancer Progression"
* NCIT#C156813 "Initial Diagnosis"
//* SCT#255251009 "Acute phase (qualifier value)"  // substitute for "initial" ? I don't really think this makes sense?






/* Not high priority


Profile: CoursePhase
Parent: Phase
Id: pedcan-course-phase
Description: "The protocol treatment 'course' during which relevant observations were recorded. This profile is used across domains to frame the timing of these longitudinal observations and reduce the number of redundant variables needed to report similar concepts."
* subject only Reference(Patient or ResearchSubject)  // which?
* code = NCIT#C168807  //  Protocol Treatment Course
* extension[phaseName].value[x] from CoursePhaseValueVS

ValueSet: CoursePhaseValueVS
Id: pedcan-course-phase-value-vs
Title: "Course Phase Value Set"
Description: "The phase of the treatment associated with the protocol 'course'."
* insert SNOMEDCopyrightForVS
* SCT#1259201000 "Adjuvant drug therapy (procedure)"
* SCT#367336001 "Chemotherapy (procedure)"
* SCT#400001000004103 "Neoadjuvant antineoplastic therapy (procedure)"
* SCT#314122007 "Maintenance therapy (procedure)"

// Specific types of Phase




// EXAMPLE
Instance: FirstCourse
InstanceOf: CoursePhase
Description: "Example of Course Phase resource"
* subject = Reference(cancer-patient-john-anyperson)
* extension[phaseName].valueCodeableConcept = SCT#314122007 "Maintenance therapy (procedure)"
* extension[startDate].valueDate = 2015-02-07
* extension[endDate].valueDate = 2017-08-16
* extension[phaseNumber].valueUnsignedInt = 3

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




*/