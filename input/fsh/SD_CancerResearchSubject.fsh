//Profiles

Profile: CancerResearchSubject
Parent: ResearchSubject
Description: "A patient participating or who has participated in a clinical study for cancer."
* extension contains ReasonOffStudy named reasonOffStudy 0..1 MS
//* extension contains RandomizationStatus named randomizationStatus 0..1 MS

//Extensions
Extension: ReasonOffStudy
Id: pedcan-reason-off-study
Title:  "Reason Off Therapy or Study"
Description: "This variable indicates the reason a patient left a clinical study."
* value[x] only CodeableConcept
* value[x] from ReasonOffStudyVS (required)
* value[x] 1..1


//Valuesets
ValueSet: ReasonOffStudyVS
Id: pedcan-reason-off-study-vs
Title: "Reason Off Study Value Set"
Description: "Value set for reasons a patient leaves a clinical study."
* insert SNOMEDCopyrightForVS
* ^experimental = true
* include codes from valueset TreatmentTerminationReasonVS 
* NCIT#C178071 "Follow-Up Completed"
* NCIT#C48250 "Physician Decision"
* NCIT#C40412 "Ineligible"
* NCIT#C48271 "Withdrawal of Consent"
* SCT#271299001 "Patient's condition worsened (finding)"
* SCT#263855007 "Relapse phase (qualifier value)"
* SCT#281647001 "Adverse reaction (disorder)"
* SCT#399409002 "Distant metastasis present (finding)"
* NCIT#C142444 "Study Discontinuation"
* NCIT#C178072 "Failure to Attain Remission"
* SCT#261665006 "Unknown (qualifier value)"

/*PCDC list
-Death -- in TreatmentTerminationReasonVS
-Lost to follow up -- in TreatmentTerminationReasonVS
-Completion of follow up -- added as NCIT code
-Completion of planned therapy -- in TreatmentTerminationReasonVS (as completion of clinical trial)
-Physicion decision -- added as NCIT code
-Ineligible -- added as NCIT code
-Withdrawal of consent -- added as NCIT code
-Subject/guardian refused further treatment  -- in TreatmentTerminationReasonVS (as subject refused treatment....should we change to subject/guardian?)
-Subject non-compliance -- in TreatmentTerminationReasonVS 
-Disease progression -- added the SCT values we use in CancerDiseaseStatus
-Relapse -- added an SCT code
-Adverse event -- added an SCT code
-Secondary malignancy -- added the SCT values we use in CancerDiseaseStatus
-Study discontinuation -- added as NCIT code
-Failure to attain remission -- added as NCIT code
-Other -- didn't include, becuase we can make this extensible?
-Unknown -- added as SCT code
-Not reported -- not a FHIR thing




/*
//PCDC codes that are covered by the terminationReason codes above, but don't exactly match
//* NCIT#C48250 "Physician Decision"
//* NCIT#C4968 "Secondary Malignant Neoplasm"
//* NCIT#C168934 "Subject/Guardian Refused Further Treatment"


/* Not high priority

Extension: RandomizationStatus
Id: pedcan-randomization-status
Title:  "RandomizationStatus"
Description: "This variable indicates the whether or not a patient was randomized in a clinical study."
//* . ^code = NCIT#C25196
// Above generates IGPub error: Rule sdf-9: 'In any snapshot or differential, no label, code or requirements on an element without a "." in the path (e.g. the first element)' Failed
* value[x] only CodeableConcept
* value[x] from RandomizationStatusVS (required)
* value[x] 1..1

ValueSet: RandomizationStatusVS
Id: pedcan-randomization-status-vs
Title: "Randomization Status Value Set"
Description: "Value set for whether or not a patient was randomized in a clinical study."
* ^experimental = true
* NCIT#C114209 "Subject is Randomized"
* NCIT#C93043 "Nonrandomized Clinical Trial" //this is for a clinical trial, but I can't find a code that's for a patient


*/