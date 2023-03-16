Profile: OsteosarcomaPatient // this is an overly restrictive name
Parent: CancerPatient
Id: pedcan-osteosarcoma-patient
Title: "Osteosarcoma Patient"
Description: "A patient being treated for osteosarcoma"
* extension contains RankedCauseOfDeath named rankedCauseOfDeath 0..* MS

Extension: RankedCauseOfDeath
Id: pedcan-causes-of-death
Title: "Ranked causes of death"
Description: "The circumstances or conditions that resulted in the death of a living being, with ranking."
* insert ExtensionContext(Patient)
* extension contains
    causeOfDeath 1..1 MS and
    rank 1..1 MS
* extension[causeOfDeath].value[x] only CodeableConcept
* extension[causeOfDeath].value[x] from CauseOfDeathVS
* extension[rank].value[x] only positiveInt

// as defined by https://build.fhir.org/ig/HL7/vrdr/ValueSet-vrdr-icd10-causes-of-death-vs.html
ValueSet: CauseOfDeathVS
Id: pedcan-cause-of-death-vs
Title: "Cause of Death Value Set"
Description: "ICD-10 codes for cause of death."
* ^experimental = true
* include codes from system ICD10


 
// The following is not needed. If Patient.deceased is present, then patient is dead. Otherwise, the LKSS is alive (i.e., subject is assumed alive unless known dead)
/*
Extension: LastKnownSurvivalStatus
Id: pedcan-lkss
Title: "Last Known Survival Status"
Description: "The last known survival status of a patient"
* insert ExtensionContext(Patient)
* value[x] only CodeableConcept
* value[x] from LastKnownSurvivalStatusVS

ValueSet: LastKnownSurvivalStatusVS
Id: pedcan-lkss-vs
Title: "Last Known Survival Status Value Set"
Description: "Value set for survival status."
* insert SNOMEDCopyrightForVS
* SCT#438949009 "Alive (finding)"
* SCT#419099009 "Dead (finding)"
*/

