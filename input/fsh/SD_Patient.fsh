RuleSet: PerformanceStatusCommonRules
* ^extension[FMM].valueInteger = 4
* subject 1..1
* insert NotUsed(bodySite)
* insert NotUsed(specimen)
* insert NotUsed(device)
* insert NotUsed(hasMember)
* insert NotUsed(component)
* basedOn only Reference (ServiceRequest or CarePlan)
* partOf only Reference (Procedure)
* subject only Reference(CancerPatient)
* subject ^definition = "Patient whose performance status is recorded."
* effective[x] only dateTime or Period
// EGOG and Karnofsky have exactly the same set of MS
* status and code and subject and effective[x] and value[x] and interpretation MS

Profile: LanskyPlayPerformanceStatus
Parent:  USCoreClinicalTest
Id: pedcan-lansky-play-performance-status
Title:  "Lansky Play Performance Status Profile"
Description:  "The Lansky Play-Performance Status for children is a parent-rated instrument which records usual play activity as the index of performance. It is similar to the Karnofsky Performance Scale for adults (Definition from: [NCI Thesaurus](https://ncithesaurus.nci.nih.gov/ncitbrowser/ConceptReport.jsp?dictionary=NCI_Thesaurus&code=C38144&ns=ncit))."
* insert PerformanceStatusCommonRules
* code = NCIT#C38144 // Lansky Play-Performance Status
* value[x] only integer 
* interpretation from LanskyPerformanceStatusVS (required)

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

Profile: DeauvilleScore
Id: pedcan-deauville-score
Parent: USCoreObservationImaging
Title: "Deauville Score Profile"
Description: "Profile for Deauville Score. A 5 point scale devised to assess the response to treatment of Hodgkin and aggressive Non-Hodgkin lymphoma."
* code = SCT#708895006 "Deauville five point scale (assessment scale)"
* basedOn only Reference(CarePlan or MedicationRequest or ServiceRequest)
* partOf only Reference(MedicationAdministration or MedicationDispense or MedicationStatement or Procedure or ImagingStudy)
* performer only Reference(Practitioner or PractitionerRole or Organization or CareTeam)
* subject only Reference(CancerPatient)
* subject ^definition = "The patient associated with the Deauville Score."
* value[x] only CodeableConcept
* value[x] from DeauvilleScoreVS (required)
* focus only Reference(PrimaryCancerCondition)
* focus ^short = "The cancer condition associated with the Deauville Score"
* focus ^definition = "Deauville Score is associated with a particular primary cancer condition. Observation.focus is used to point back to that condition."
* status and code and subject and effective[x] and value[x] and focus MS
* insert NotUsed (specimen)


ValueSet: DeauvilleScoreVS
Id: pedcan-deauville-score-vs
Title: "Deauville Score Value Set"
Description: "Codes indicating the value of the Deauville assessment."
* ^experimental = false
* NCIT#C99728 "London Deauville Criteria Point Scale 1"
* NCIT#C99747 "London Deauville Criteria Point Scale 2"
* NCIT#C99748 "London Deauville Criteria Point Scale 3"
* NCIT#C99749 "London Deauville Criteria Point Scale 4"
* NCIT#C99750 "London Deauville Criteria Point Scale 5"
* NCIT#C136879 "London Deauville Criteria Point Scale X"




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


/*Not high priority

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
