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

Profile: MIPIClassification
Id: pedcan-mipi-score
Parent: CancerStage
Title: "Mantle Cell Lymphoma International Prognostic Index Profile"
Description: "A scoring system designed to classify a patient's risk of mantle cell lymphoma progression or relapse and overall survival following therapy. It uses the criteria of patient's age, ECOG performance status, serum LDH activity, WBC count and Ki-67 index to classify patients into low risk, medium risk or high risk groups."
//* ^extension[FMM].valueInteger = 0
* code = SCT#763236005 // "Mantle Cell Lymphoma International Prognostic Index (assessment scale)"
* value[x] from MIPIValueVS (required)

Profile: RhabdomyosarcomaStage
Id: pedcan-rhabdomyosarcoma-stage
Parent: CancerStage
Title: "Rhabdomyocaroma Stage Profile"
Description: "Staging and grouping for rhabdomyosarcoma that groups patients into low, intermediate, or high clinical risk groups based on: histologic type, tumor site, tumor size, and pathologic TNM. Note: this is not the TNM system described in AJCC."
//* ^extension[FMM].valueInteger = 0
* code = NCIT#C148010 // "Intergroup Rhabdomyosarcoma Study Group Clinical Staging and Grouping System"
* value[x] from LymphomaStageValueVS (required)
* insert ObservationComponentSlicingRules
* component contains clinical-group-modifier 0..1
* component[clinical-group-modifier].value[x] only CodeableConcept
* component[clinical-group-modifier].value[x] from ClinicalGroupValueModifierVS

Profile: LeukemiaRiskGroup
Id: pedcan-leukemia-risk-group
Parent: CancerStage
Title: "Leukemia Risk Group Profile"
Description: "Refers to clinicopathologic findings related to leukemias."
//* ^extension[FMM].valueInteger = 0
* code = NCIT#C167435 // "Leukemia Finding"
* value[x] from LeukemiaRiskGroupVS (required)
//Greg R. mentioned a COG leukemia risk group system, which I found details for here - https://cancer.ca/en/cancer-information/cancer-types/leukemia-childhood/prognosis-and-survival/prognosis-for-all/risk-groups. However, I cannot find codes for the COG system or values anywhere...






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

