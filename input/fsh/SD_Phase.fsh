Profile: Phase
Parent: Basic
Id: pedcan-phase
Description: "A period of time marked by the application of a certain therapeutic approch, disease phase, or other distinguishable health or treatment status. The code element (Basic.code) represents the category of phase (e.g., a treatment phase or a disease phase), while the Phase represents the specific type of the phase (e.g., acute phase of a disease)."
* ^abstract = true
* extension contains PhaseName named phaseName 0..1 MS
* extension contains PhaseNumber named phaseNumber 1..1 MS
* extension contains PhaseStartDate named startDate 0..1 MS
* extension contains PhaseEndDate named endDate 0..1 MS
* extension contains Description named description 0..1 MS

Profile: DiseasePhase
Parent: Phase
Id: pedcan-disease-phase
Description: "The phase of the cancer treatment process during which relevant observations were recorded. This profile is used across domains to frame the timing of these longitudinal observations and reduce the number of redundant variables needed to report similar concepts."
* subject only Reference(Patient or ResearchSubject)  // which?
* code = SCT#278174000 "Disease phase (attribute)"
* extension[phaseName].value[x] from DiseasePhaseValueVS

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


// Extensions

Extension: PhaseName
Id: pedcan-phase-name
Title:  "Phase"
Description: "The name of the phase during which relevant observations were recorded. While 'code' refers the general category of the phase (e.g., a condition phase), the phase name is more specific (e.g., acute phase)"
* value[x] only CodeableConcept
* value[x] 1..1

Extension: PhaseNumber
Id: pedcan-phase-number
Title:  "Phase Number"
Description: "This variable indicates the ordinal numbering of the Phase within its various subgroups (e.g., Induction 1, Induction 2, Induction 3, etc.). The observations across domains can therefore be organized longitudinally without the need for specific dates."
* value[x] only unsignedInt   // start at 0 or 1?
* value[x] 1..1

Extension: PhaseStartDate
Id: pedcan-phase-start-date
Title:  "Phase Start Date"
Description: "The date when an ordinally numbered phase was started."
* value[x] only date
* value[x] 1..1

Extension: PhaseEndDate
Id: pedcan-phase-end-date
Title:  "End Date"
Description: "The date when an ordinally numbered phase was ended."
* value[x] only date
* value[x] 1..1

Extension: Description
Id: pedcan-description
Title:  "Description"
Description: "Text description of the resource."
* value[x] only string
* value[x] 1..1



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