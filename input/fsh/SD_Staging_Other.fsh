
Profile: NeuroblastomaINSStage
Id: pedcan-neuroblastoma-inss-stage
Parent: CancerStage
Title: "Neuroblastoma INSS Stage Profile"
Description: "The International Neuroblastoma Staging System (INSS) stage for neuroblastoma."
* ^extension[FMM].valueInteger = 0
* code = SCT#409720004  // International neuroblastoma staging system stage (observable entity)
* value[x] from NeuroblastomaINSSValueVS (required)

Profile: WilmsTumorStage
Id: pedcan-wilms-tumor-stage
Parent: CancerStage
Title: "Wilms Tumor Stage Profile"
Description: "Wilms Tumors (nephroblastoma) Stage by the National Wilms Tumor Study Group."
* ^extension[FMM].valueInteger = 0
* code = SCT#405931009 // National Wilms Tumor Study Group Stage (observable entity)
* value[x] from WilmsTumorStageValueVS (required)
* bodySite from WilmsTumorBodySiteVS (extensible)


Profile: LymphomaStageBulky //lymphoma is already in mCODE, just showing how the profile could look with a bulky modifier
Id: pedcan-lymphoma-stage-bulky
Parent: LymphomaStage
Title: "Lymphoma Stage Profile"
Description: "Staging of lymphoma (both Hodgkins and Non-Hodgkins) by Ann Arbor, Cotswold, or Lugano staging systems. The method (required) indicates which of these related staging systems was used."
* ^extension[FMM].valueInteger = 0
* component contains bulky-modifier 0..1
* component[bulky-modifier].value[x] only CodeableConcept
* component[bulky-modifier] ^meaningWhenMissing = "no bulky disease"  
* component[bulky-modifier].value[x] from LymphomaStageBulkyModifierVS







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

Profile: CMLPhase
Id: pedcan-cml-phase
Parent: CancerStage   // since this is a phase, is it appropriate to inherit from CancerStage?
Title: "Chronic Myeloid Leukemia Phase Profile"
Description: "Phase of Chronic Myeloid Leukemia (CML) observed at a specified point in time."
* ^extension[FMM].valueInteger = 0
* insert NotUsed(component)
* code = MDR#10066506  // CML Progression (code from medDRA; no suitable codes in NCIT, SCT, or LNC)
* value[x] from CMLPhaseValueVS (required)

*/
