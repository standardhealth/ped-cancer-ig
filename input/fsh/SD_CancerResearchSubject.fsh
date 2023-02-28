//Although ResearchSubject does not have a statusReason, the build version does - http://build.fhir.org/valueset-state-change-reason.html

//Profiles

Profile: CancerResearchSubject
Parent: ResearchSubject
Description: "A patient participating or who has participated in a clinical study for osteosarcoma."
* extension contains ReasonOffStudy named reasonOffStudy 0..1 MS
* extension contains RandomizationStatus named randomizationStatus 0..1 MS

//Extensions
Extension: ReasonOffStudy
Id: os-reason-off-study
Title:  "Reason Off Therapy or Study"
Description: "This variable indicates the reason a patient left a clinical study."
* ^url = "http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C173519"
* value[x] only CodeableConcept
* value[x] from ReasonOffStudyVS (required)
* value[x] 1..1

Extension: RandomizationStatus
Id: os-randomization-status
Title:  "RandomizationStatus"
Description: "This variable indicates the whether or not a patient was randomized in a clinical study."
//* . ^code = NCIT#C25196
// Above generates IGPub error: Rule sdf-9: 'In any snapshot or differential, no label, code or requirements on an element without a "." in the path (e.g. the first element)' Failed
* value[x] only CodeableConcept
* value[x] from RandomizationStatusVS (required)
* value[x] 1..1


//Valuesets
ValueSet: ReasonOffStudyVS
Id: os-reason-off-study-vs
Title: "Reason Off Study Value Set"
Description: "Value set for reasons a patient leaves a clinical study."
* insert SNOMEDCopyrightForVS
* ^experimental = true
* include codes from valueset TreatmentTerminationReasonVS 
* SCT#7058009 "Noncompliance with treatment (finding)" //currently not in TerminationReason

//PCDC codes that are covered by the terminationReason codes above, but don't exactly match
//* NCIT#C48250 "Physician Decision"
//* NCIT#C4968 "Secondary Malignant Neoplasm"
//* NCIT#C168934 "Subject/Guardian Refused Further Treatment"

ValueSet: RandomizationStatusVS
Id: os-randomization-status-vs
Title: "Randomization Status Value Set"
Description: "Value set for whether or not a patient was randomized in a clinical study."
* ^experimental = true
* NCIT#C114209 "Subject is Randomized"
* NCIT#C93043 "Nonrandomized Clinical Trial" //this is for a clinical trial, but I can't find a code that's for a patient