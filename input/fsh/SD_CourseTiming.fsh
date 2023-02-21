Profile: CourseTiming
Parent: Basic
Id: os-course-timing
Description: "The protocol treatment 'course' during which relevant observations were recorded. This variable is used across domains to frame the timing of these longitudinal observations and reduce the number of redundant variables needed to report similar concepts."
* subject only Reference(Patient or ResearchSubject)  // which?
* code = NCIT#C168807
* extension contains CourseType named courseType 0..1 MS
* extension contains CourseNumber named courseNumber 1..1 MS
* extension contains CourseStartDate named courseStartDate 0..1 MS
* extension contains CourseEndDate named courseEndDate 0..1 MS
* extension contains CourseDescription named courseDescription 0..1 MS

Extension: CourseType
Id: os-course-type
Title:  "Course Type"
Description: "The protocol treatment 'course' during which relevant observations were recorded."
* value[x] only CodeableConcept
* value[x] from CourseTypeVS
* value[x] 1..1

Extension: CourseNumber
Id: os-course-number
Title:  "Course Number"
Description: "This variable indicates the ordinal numbering of the Course variable within its various subgroups (e.g., Induction 1, Induction 2, Induction 3, etc.). The observations across domains can therefore be organized longitudinally without the need for specific dates."
* value[x] only unsignedInt
* value[x] 1..1

Extension: CourseStartDate
Id: os-course-start-date
Title:  "Course Start Date"
Description: "The date when this ordinally numbered course was started."
* value[x] only date
* value[x] 1..1

Extension: CourseEndDate
Id: os-course-end-date
Title:  "End Date"
Description: "The date when this ordinally numbered course was ended."
* value[x] only date
* value[x] 1..1

Extension: CourseDescription
Id: os-course-description
Title:  "Course Description"
Description: "Text description of the protocol treatment course."
* value[x] only string
* value[x] 1..1

ValueSet: CourseTypeVS
Id: os-course-type-value-set
Title: "Course Type Value Set"
Description: "The type of the treatment associated with the protocol 'course'."
* insert SNOMEDCopyrightForVS
* SCT#1259201000 "Adjuvant drug therapy (procedure)"
* SCT#367336001 "Chemotherapy (procedure)"
* SCT#400001000004103 "Neoadjuvant antineoplastic therapy (procedure)"
* SCT#314122007 "Maintenance therapy (procedure)"


// EXAMPLE
Instance: FirstCourse
InstanceOf: CourseTiming
Description: "Example of Course Timing resource"
* subject = Reference(cancer-patient-john-anyperson)
* extension[courseType].valueCodeableConcept = SCT#314122007 "Maintenance therapy (procedure)"
* extension[courseStartDate].valueDate = 2015-02-07
* extension[courseEndDate].valueDate = 2017-08-16
* extension[courseNumber].valueUnsignedInt = 3

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