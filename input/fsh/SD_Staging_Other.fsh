/* Staging Systems to consider:
TNM - check
INSS - check
INRGSS - check
Ann Arbor - check
COG/Wilms - check?  Wilms but not COG/Wilms
FIGO - check
French-American-British (FAB) classification -- This is a grading method (based on appearance and behavior of cells), not a staging method, but still fits the overall pattern of CancerStageGroup profile
Rai - check
Binet - check
CML Phase -- Chronic, blastic, accelerated CML are considered disease phases and appear in the SCT disorder hierarchy
B-cell ALL, T-cell ALL  - Currently, there is no staging system for acute lymphocytic leukemia (ALL).  The phases of ALL are described as untreated, in remission, relapsed (also called recurrent) or refractory.

Consider the WHO classification of myeloid neoplasms and acute leukemia? see https://ashpublications.org/blood/article/127/20/2391/35255/The-2016-revision-to-the-World-Health-Organization
*/

Profile: ALLClassification
Id: pedcan-all-fab-classification
Parent: CancerStage  // is the FAB classification really a stage?
Title: "ALL French-American-British Classification Profile"
Description: "French-American-British (FAB) stage for acute lymphoblastic leukemia (ALL)"
* ^extension[FMM].valueInteger = 0
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

//  French-American-British (FAB) Classification for ALL

Profile: FABClassification
Id: pedcan-fab-classification
Parent: CancerStage ///Group  // ?
Title: "FAB Classification for acute lymphoblastic leukemia"
Description: "Binet stage for acute lymphoblastic leukemia"
* insert NotUsed(component)
* code = NCIT#C91220 // French-American-British Classification
* value[x] from FABClassificationValueVS (required)


// Neuroblastoma Staging

Profile: NeuroblastomaINSSStage
Id: pedcan-neuroblastoma-inss-stage
Parent: CancerStage
Title: "Neuroblastoma INNS Stage Profile"
Description: "The International Neuroblastoma Staging System (INSS) stage for neuroblastoma."
* ^extension[FMM].valueInteger = 0
* code = SCT#409720004  // International neuroblastoma staging system stage (observable entity)
* value[x] from NeuroblastomaStageValueVS (required)

Profile: NeuroblastomaRiskGroup
Id: pedcan-international-neuroblastoma-risk-group
Parent: CancerStage
Title: "Neuroblastoma International Risk Group Profile"
Description: "Neuroblastoma risk group according to the International Neuroblastoma Risk Group Staging System (INRGSS)."
* ^extension[FMM].valueInteger = 0
* code = NCIT#C192760 // International Neuroblastoma Risk Group
* value[x] from NeuroblastomaRiskGroupValueVS (required)


//  Wilms Tumor Staging

Profile: WilmsTumorStage
Id: pedcan-wilms-tumor-stage
Parent: CancerStage
Title: "Wilms Tumor (nephroblastoma) Stage Profile"
Description: "Profile for staging Wilms Tumors by NWTSG"
* ^extension[FMM].valueInteger = 0
* code = SCT#405931009 // National Wilms Tumor Study Group Stage
* code.text = "Wilms Tumor Stage"  // no code for this in SCT, LOINC, or NCIT
* value[x] from WilmsTumorStageValueVS (required)
* bodySite from WilmsTumorBodySiteVS (extensible)


