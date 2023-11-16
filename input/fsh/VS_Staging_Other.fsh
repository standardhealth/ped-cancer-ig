

ValueSet: NeuroblastomaINSSValueVS
Id: pedcan-neuroblastoma-inss-value-vs
Title: "International Neuroblastoma Staging System (INSS) for Neuroblastoma Stage Value Set"
Description: "Codes in INSS staging system representing neuroblastoma stage."
* insert SNOMEDCopyrightForVS
* include codes from system SCT where concept descendant-of #409721000 "International neuroblastoma staging system stage finding (finding)"

ValueSet: WilmsTumorStageValueVS
Id: pedcan-wilms-tumor-stage-value-vs
Title: "Wilms Tumor Stage Value Set"
Description: "Codes in the National Wilms Tumor Study Group representing Wilms Tumor stage."
* insert SNOMEDCopyrightForVS
* include codes from system SCT where concept descendant-of #405971004 "National Wilms Tumor Study Group Stage finding (finding)"


ValueSet: WilmsTumorBodySiteVS
Id: pedcan-wilms-tumor-body-site-vsCOG
Title: "Wilms Tumor Body Site Value Set"
Description: "Codes indicating the location of the Wilms Tumor."
* insert SNOMEDCopyrightForVS
* include codes from system SCT where concept is-a #18639004 "Left kidney structure (body structure)"
* include codes from system SCT where concept is-a #9846003 "Right kidney structure (body structure)"

ValueSet: LymphomaStageBulkyModifierVS
Id: pedcan-lymphoma-stage-bulky-modifier-vs
Title: "Lymphoma Stage Bulky Modifier Value Set"
Description: "Bulky modifier indicating if the lymphoma has the presence of bulky disease."
* ^experimental = false
* insert SNOMEDCopyrightForVS
* SCT#2667000 "Absent (qualifier value)"
* SCT#52101004 "Present (qualifier value)"
//there is no "bulky disease absent" value, so I just included positive and negative...thoughts?
















//ValueSet: WilmsTumorStagingMethodVS
//Id: pedcan-wilms-tumor-staging-method-vs
//Title: "Wilms Tumor Staging Method Value Set"
//Description: "Methods for staging Wilms Tumors, differentiating the original National Wilms' tumor study staging system from the Children's Oncology Group modification of the National Wilms' Tumor Study Group Staging System."
//* insert SNOMEDCopyrightForVS
//* SCT#254364004 "National Wilms' tumor study staging system (tumor staging)"
//* NCIT#C140271 "Children's Oncology Group/National Wilms' Tumor Study Group Staging System"
//* NCIT#C198026 "International Society of Pediatric Oncology (SIOP) Stage" // European



/* The following are pediatric codes removed from mCODE for inclusion in the pedcan IG

STAGING OBSERVABLES (.code)

// include codes from system SCT where concept is-a #405931009 "National Wilms Tumor Study Group Stage (observable entity)"
* SCT#405931009 "National Wilms Tumor Study Group Stage"
* SCT#405977000 "National Wilms Tumor Study Group Stage for left kidney"
* SCT#405976009 "National Wilms Tumor Study Group Stage for right kidney"
* SCT#409720004 "International neuroblastoma staging system stage (observable entity)"
* SCT#405916000 "Intergroup rhabdomyosarcoma study post-surgical clinical group (observable entity)"

* NCIT#C198025 "Children's Oncology Group (COG)/National Wilms Tumor Study Group (NWTSG) Stage"
* NCIT#C192760 "International Neuroblastoma Risk Group"
* NCIT#C198026 "International Society of Pediatric Oncology (SIOP) Stage"  // European
* NCIT#C28067 "Hepatoblastoma Stage" // 90% before age 3

STAGING METHODS
* NCIT#C186520 "Medulloblastoma Staging System"
* NCIT#C198826 "Modified Chang Staging System for Medulloblastoma"
* SCT#254364004 "National Wilms' tumor study staging system (tumor staging)"
* SCT_TBD#1287643004 "International Neuroblastoma Risk Group staging system (tumor staging)"  // #USCRS-34952  requested June 2023
* SCT#254363005 "International neuroblastoma staging system (tumor staging)"
* SCT#254370005 "St Jude's malignant histiocytosis tumor staging system (tumor staging)"
* SCT#254371009 "St Jude's non-Hodgkin's lymphoma staging system (tumor staging)"
* SCT#254368001 "United Kingdom children's cancer study group central nervous system tumor staging system (tumor staging)"
* SCT#254365003 "Siopel liver staging system (tumor staging)"

* SCT_TBD#USCRS-34957 "Children's Oncology Group Renal Staging System (tumor staging)" // requested June 2023
* NCIT#C177632 "Children's Oncology Group Renal Cancer Staging System"
* SCT_TBD#USCRS-34958 "Children's Oncology Group Liver Staging System (tumor staging)" // requested 6/13/23
* NCIT#C177630 "Children's Oncology Group Liver Tumor Staging System"
* SCT_TBD#1287647003 "Toronto Childhood Cancer Stage Guidelines Version 2 (tumor staging)" //USCRS-34951  requested June 2023
* NCIT#C186527 "Atypical Teratoid/Rhabdoid Tumor Staging System"  // 1969 Chang CH, Housepian EM, Herbert C. Radiology, 1969; 93(6):1351-9.)
* NCIT#C123333 "Reese-Ellsworth Staging System"  // retinoblastoma (pediatric)
* NCIT#C140271 "Children's Oncology Group/National Wilms' Tumor Study Group Staging System"
* NCIT#C133427 "International Neuroblastoma Risk Group Staging System"
* NCIT#C140272 "SIOP/COG/NWTSG Staging System"  // Wilms tumor
* NCIT#C141133 "PRETEXT Staging System"   // International Childhood Liver Tumor Strategy Group (SIOPEL)
* NCIT#C140270 "International Society of Pediatric Oncology Staging System"
* NCIT#C177550 "IRS Clinical Staging System"  // Intergroup Rhabdomyosarcoma Studies (IRS) 
* NCIT#C148010 "Intergroup Rhabdomyosarcoma Study Group Clinical Staging and Grouping System"
*/


/*
ValueSet: FABClassificationValueVS // TRG says is outdated
Id: pedcan-fab-classification-value-vs
Title: "FAB Classification"
Description: "French American British classification for acute myeloid leukemias, acute lymphoblastic leukemias, and myelodysplastic syndromes."
* insert SNOMEDCopyrightForVS
* include codes from system SCT where concept descendant-of #278159002 "French-American-British type values (qualifier value)"

ValueSet: CMLPhaseValueVS
Id: pedcan-cml-phase-value-vs
Title: "Chronic Myeloid Leukemia Phase Value Set"
Description: "Phases of Chronic Myeloid Leukemia (CML)"
* insert SNOMEDCopyrightForVS
* SCT#278177007 "Chronic phase (qualifier value)"
* SCT#278179005 "Accelerated phase (qualifier value)"
//* SCT#278180008 "Blast crisis (qualifier value)"
* SCT#255251009 "Acute phase (qualifier value)"  // aka Blast phase




*/