//Although ResearchSubject does not have a statusReason, the build version does - http://build.fhir.org/valueset-state-change-reason.html


Profile: CancerResearchSubject
Parent: ResearchSubject
Description: "Details on when and why a patient left a clinical study."
* extension contains ReasonOffStudy named reasonOffStudy 0..1 MS

Extension: ReasonOffStudy
Id: os-reason-off-study
Title:  "Reason Off Therapy or Study"
Description: "This variable indicates the reason a patient left a clinical study."
//* . ^code = NCIT#C173519
//// Above generates IGPub error: Rule sdf-9: 'In any snapshot or differential, no label, code or requirements on an element without a "." in the path (e.g. the first element)' Failed
* value[x] only CodeableConcept
* value[x] from ReasonOffStudyVS (required)
* value[x] 1..1

ValueSet: ReasonOffStudyVS
Id: os-reason-off-study-vs
Title: "Reason Off Study Value Set"
Description: "Value set for reasons a patient leaves a clinical study."
* insert SNOMEDCopyrightForVS
* ^experimental = true
* SCT#407563006 "Treatment not tolerated (situation)"
* SCT#182992009 "Treatment completed (situation)"
* SCT#419620001 "Death (event)"
* SCT#266721009 "No response to treatment (situation)"
* SCT#160932005 "Financial problem (finding)"
* SCT#105480006 "Refusal of treatment by patient (situation)"
* SCT#184081006 "Patient has moved away (finding)"
* SCT#309846006 "Treatment not available (situation)"
* SCT#399307001 "Lost to follow-up (finding)"
* SCT#7058009 "Noncompliance with treatment (finding)" //currently not in TerminationReason

//PCDC codes that are covered by the terminationReason codes above, but don't exactly match
//* NCIT#C48250 "Physician Decision"
//* NCIT#C4968 "Secondary Malignant Neoplasm"
//* NCIT#C168934 "Subject/Guardian Refused Further Treatment"

