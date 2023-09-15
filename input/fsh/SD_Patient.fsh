Profile: LanskyPerformanceStatus
Parent:  USCoreClinicalTest
Id: pedcan-lansky-performance-status
Title:  "Lansky Performance Status Profile"
Description:  "The Lansky Play-Performance Status for patients under 16 years old."
* subject 1..1
* insert NotUsed(bodySite)
* insert NotUsed(specimen)
* insert NotUsed(device)
* insert NotUsed(hasMember)
* insert NotUsed(component)
* basedOn only Reference (ServiceRequest or CarePlan)
* partOf only Reference (Procedure)
* subject only Reference(CancerPatient)
* subject ^definition = "Pediatric patient whose performance status is recorded."
* effective[x] only dateTime or Period
// Use the same MS set as EGOG and Karnofsky
* status and code and subject and effective[x] and value[x] and interpretation MS
* code = NCIT#C38144 // Lansky Play-Performance Status
* value[x] from LanskyPerformanceStatusVS

ValueSet: LanskyPerformanceStatusVS
Id: pedcan-lansky-vs
Title: "Lansky Performance Status VS"
Description: "Value set for Lansky Play-Performance performance status."
* NCIT#C70538 "Lansky Performance Status 0"
* NCIT#C70539 "Lansky Performance Status 10"
* NCIT#C70540 "Lansky Performance Status 20"
* NCIT#C70541 "Lansky Performance Status 30"
* NCIT#C70542 "Lansky Performance Status 40"
* NCIT#C69421 "Lansky Performance Status 50"
* NCIT#C69422 "Lansky Performance Status 60"
* NCIT#C69423 "Lansky Performance Status 70"
* NCIT#C69424 "Lansky Performance Status 80"
* NCIT#C69425 "Lansky Performance Status 90"
* NCIT#C69426 "Lansky Performance Status 100" 

Profile: BodySurfaceArea
Parent: USCoreVitalSignsProfile
Id: pedcan-body-surface-area
Title: "Body Surface Area"
Description: "Entire body surface area, either measured or calculated."
* code = LNC#8277-6 // Body Surface Area
* value[x] only Quantity
//* valueQuantity = UCUM#m2 <-- THIS LINE IS CAUSING THE PUBLISHER TO CRASH 6/30/2023 VERSION 1.3.20
* method from BSAMethodVS (extensible)

ValueSet: BSAMethodVS
Id: pedcan-bsa-method-vs
Title: "Body Surface Area Method VS"
Description: "Methods for calculating body surface area from height and weight. See https://dicom.nema.org/medical/dicom/current/output/chtml/part16/sect_CID_3663.html"
* DCM#122240 "BSA = 0.003207*WT^(0.7285-0.0188*log(WT))*HT^0.3"
* DCM#122241 "BSA = 0.007184*WT^0.425*HT^0.725"
* DCM#122242 "BSA = 0.0235*WT^0.51456*HTcm^0.42246"
* DCM#122243 "BSA = 0.024265*WT^0.5378*HTcm^0.3964"
* DCM#122244 "BSA = (HT*WT/36)^0.5"
* DCM#122245 "BSA = 1321+0.3433*WT"
* DCM#122246 "BSA = 0.0004688*WT^(0.8168-0.0154*log(WT))"
* DCM#122266 "BSA = 0.007358*WT^0.425*HT^0.725"
* DCM#122267 "BSA = 0.010265*WT^0.423*HT^0.651"
* DCM#122268 "BSA = 0.008883*WT^0.444*HT^0.663"
* DCM#122269 "BSA = 0.038189*WT^0.423*HT^0.362"
* DCM#122270 "BSA = 0.009568*WT^0.473*HT^0.655"


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

/*
Not high priority

Profile: PediatricCancerPatient
Parent: CancerPatient
Id: pedcan-pediatric-cancer-patient
Title: "Pediatric Cancer Patient"
Description: "A pediatric patient being treated for cancer"
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

*/

