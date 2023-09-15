Profile: CMLPhase
Id: pedcan-cml-phase
Parent: CancerStage   // since this is a phase, is it appropriate to inherit from CancerStage?
Title: "Chronic Myeloid Leukemia Phase Profile"
Description: "Phase of Chronic Myeloid Leukemia (CML) observed at a specified point in time."
//* ^extension[FMM].valueInteger = 0 -- getting a SUSHI error with this?
* insert NotUsed(component)
* code = MDR#10066506  // CML Progression (code from medDRA; no suitable codes in NCIT, SCT, or LNC)
* value[x] from CMLPhaseValueVS (required)

Profile: NeuroblastomaINSSStage
Id: pedcan-neuroblastoma-inss-stage
Parent: CancerStage
Title: "Neuroblastoma INNS Stage Profile"
Description: "The International Neuroblastoma Staging System (INSS) stage for neuroblastoma."
//* ^extension[FMM].valueInteger = 0 -- getting a SUSHI error with this?
* code = SCT#409720004  // International neuroblastoma staging system stage (observable entity)
* value[x] from NeuroblastomaStageValueVS (required)

Profile: WilmsTumorStage
Id: pedcan-wilms-tumor-stage
Parent: CancerStage
Title: "Wilms Tumor (nephroblastoma) Stage Profile"
Description: "Profile for staging Wilms Tumors by NWTSG"
//* ^extension[FMM].valueInteger = 0 -- getting a SUSHI error with this?
* code = SCT#405931009 // National Wilms Tumor Study Group Stage
* code.text = "Wilms Tumor Stage"  // no code for this in SCT, LOINC, or NCIT
* value[x] from WilmsTumorStageValueVS (required)
* bodySite from WilmsTumorBodySiteVS (extensible)

Profile: NeuroblastomaRiskGroup
Id: pedcan-international-neuroblastoma-risk-group
Parent: CancerStage
Title: "Neuroblastoma International Risk Group Profile"
Description: "Neuroblastoma risk group according to the International Neuroblastoma Risk Group Staging System (INRGSS)."
//* ^extension[FMM].valueInteger = 0 -- getting a SUSHI error with this?
* code = NCIT#C192760 // International Neuroblastoma Risk Group
* value[x] from NeuroblastomaRiskGroupValueVS (required)


/*in mCODE STU3

- Gynecologogic FIGO Stage
- Leukemia Binet Stage
- Leukemia Rai Stage
- Lymphoma Stage
- Melanoma Breslow Stage
- Melanoma Clark Level
- Myeloma ISS Stage
- Myeloma RISS Stage
- Prostate Gleason Stage

*/


/* Outdated

Profile: ALLClassification
Id: pedcan-all-fab-classification
Parent: CancerStage
Title: "ALL French-American-British Classification Profile"
Description: "French-American-British (FAB) stage for acute lymphoblastic leukemia (ALL)"
//* ^extension[FMM].valueInteger = 0
* code = NCIT#C91220 // French-American-British Classification
* value[x] from FABClassificationValueVS (required)

*/

