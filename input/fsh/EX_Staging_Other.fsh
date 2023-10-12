
Alias: FMM = http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm

RuleSet: StagingInstanceRuleSet
* status = #final "final"
* focus = Reference(primary-cancer-condition-nonspecific)
* subject = Reference(cancer-patient-john-anyperson)
* performer = Reference(us-core-practitioner-kyle-anydoc)
* effectiveDateTime = "2023-09-01"


Instance: all-fab-classification-M5b
InstanceOf: ALLClassification
Description: "Example of FAB (French-American-British) staging of acute lymphoblastic leukemia (ALL)."
* insert StagingInstanceRuleSet
* code = NCIT#C91220 "French-American-British Classification"
* valueCodeableConcept = SCT#278171008 "French-American-British type M5b (qualifier value)"

Instance: cml-phase-chronic
InstanceOf: CMLPhase
Description: "Example of reporting the CML phase."
* insert StagingInstanceRuleSet
* code = MDR#10066506  "CML Progression"
* valueCodeableConcept = SCT#278177007 "Chronic phase (qualifier value)"

Instance: wilms-tumor-stage-III
InstanceOf: WilmsTumorStage
Description: "Example of staging Wilms Tumor by Children's Oncology Group/National Wilms' Tumor Study Group"
* insert StagingInstanceRuleSet
* code = SCT#405931009 "National Wilms Tumor Study Group Stage"
* method = NCIT#C140271 "Children's Oncology Group/National Wilms' Tumor Study Group Staging System"
* valueCodeableConcept = SCT#405973001 "National Wilms Tumor Study Group Stage III (finding)"
* bodySite = SCT#18639004 "Left kidney structure (body structure)"

Instance: neuroblastoma-inss-stage-2B
InstanceOf: NeuroblastomaINSSStage
Description: "Example of The International Neuroblastoma Staging System (INSS) stage for neuroblastoma."
* insert StagingInstanceRuleSet
* code = SCT#409720004  "International neuroblastoma staging system stage (observable entity)"
* valueCodeableConcept = SCT#409724008 "International neuroblastoma staging system stage 2B (finding)"

Instance: neuroblastoma-risk-group-L2
InstanceOf: NeuroblastomaRiskGroup
Description: "Example of Neuroblastoma risk group according to the International Neuroblastoma Risk Group Staging System (INRGSS)"
* insert StagingInstanceRuleSet
* code = NCIT#C192760 "International Neuroblastoma Risk Group"
* valueCodeableConcept = NCIT#C133429 "INRG Stage L2"