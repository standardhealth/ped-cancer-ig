//Parent profile//

ValueSet: CancerRiskAssessmentTypeVS
Id: pedcan-risk-assessment-type-vs
Title: "Risk Assessment Type Value Set"
Description: "If the risk assessment used to determine the risk score is not implicit in this code, the risk assessment system must be separately recorded in Observation.method. More specific risk assessment profiles, if available, should be consulted before determining the correct code."
* ^experimental = false
* insert SNOMEDCopyrightForVS
* NCIT#148010 "Intergroup Rhabdomyosarcoma Study Group Clinical Staging and Grouping System"
* NCIT#C133427 "International Neuroblastoma Risk Group Staging System"
* SCT#763236005 "Mantle Cell Lymphoma International Prognostic Index (assessment scale)"
* NCIT#C167435 "Leukemia Finding" 

/*
ValueSet: RiskAssessmentMethodVS
Id: pedcan-risk-assessment-method-vs
Title: "Risk Assessment Method Value Set"
Description: "Risk assessment methods"
* ^experimental = false
* insert SNOMEDCopyrightForVS
* NCIT#C177316 "Malignant Germ Cell International Collaborative Risk Classification"
* SCT#1287646007 "International Germ Cell Consensus Classification (tumor staging)"
*/

ValueSet: RiskAssessmentValueVS 
Id: pedcan-risk-assessment-vs
Title: "Risk Assessment Value Set"
Description: "A non-exhaustive value set containing codes that result from risk assessments, i.e., the risk level of the cancer."
* ^experimental = false
* insert SNOMEDCopyrightForVS
* SCT#260362008 "Very low (qualifier value)"
* SCT#62482003 "Low (qualifier value)"
* SCT#11896004 "Intermediate (qualifier value)"
* SCT#75540009 "High (qualifier value)"
* SCT#260360000 "Very high (qualifier value)"


//Rhabdomyosarcoma//

ValueSet: RhabdomyosarcomaAssessmentValueVS
Id: pedcan-rhabdomyosarcoma-assessment-value-vs
Title: "Rhabdomyosarcoma Assessment Value Set"
Description: "Codes in the Rhabdomyosarcoma risk assessment system."
* insert SNOMEDCopyrightForVS
* SCT#723505004 "Low risk (qualifier value)"
* SCT#723509005 "High risk (qualifier value)"
* NCIT#C102402 "Intermediate Risk"
//I couldn't find these values specific to this staging system


ValueSet: RhabdomyosarcomaClinicalGroupValueModifierVS
Id: pedcan-rhabdomyosarcoma-clinical-group-modifier-vs
Title: "Rhabdomyosarcoma Clinical Group Modifier"
Description: "Intergroup modifier indicating whether the rhabdomyosarcoma is confined to its primary location or has extended beyond the site of origin."
* insert SNOMEDCopyrightForVS
* include codes from system SCT where concept descendant-of #405917009 "Intergroup rhabdomyosarcoma study post-surgical clinical group finding (finding)"
* NCIT#C148012 "Intergroup Rhabdomyosarcoma Group I"
* NCIT#C148015 "Intergroup Rhabdomyosarcoma Group II"
* NCIT#C148019 "Intergroup Rhabdomyosarcoma Group III"

//Neuroblastoma//

ValueSet: NeuroblastomaINRGSSRiskAssessmentVS
Id: pedcan-neuroblastoma-INRGSS-risk-assessment-value-vs
Title: "International Neuroblastoma Risk Group Staging System (INRGSS) for Neuroblastoma Risk Assessment Value Set"
Description: "Codes in the INRGSS system representing neuroblastoma risk assessment."
* NCIT#C133428 "INRG Stage L1"
* NCIT#C133429 "INRG Stage L2"
* NCIT#C133430 "INRG Stage M"
* NCIT#C133431 "INRG Stage MS"


//Mantle Cell Lymphoma//

ValueSet: LymphomaMIPIRiskAssessmentVS
Id: pedcan-lymphoma-MIPI-risk-assessment-value-vs
Title: "Mantle Cell Lymphoma International Prognostic Index Value Set"
Description: "Codes in the Mantle Cell Lymphoma International Prognostic Index."
* NCIT#C137810 "High Risk Mantle Cell Lymphoma International Prognostic Index Combined Biologic Index"
* NCIT#C137809 "High-Intermediate Risk Mantle Cell Lymphoma International Prognostic Index Combined Biologic Index"
* NCIT#C137807 "Low Risk Mantle Cell Lymphoma International Prognostic Index Combined Biologic Index"
* NCIT#C137808 "Low-Intermediate Risk Mantle Cell Lymphoma International Prognostic Index Combined Biologic Index"


//Acute lymphoblastic leukemia//

ValueSet: ALLRiskAssessmentVS
Id: pedcan-all-risk-assessment-value-vs
Title: "Acute Lymphoblastic Leukemia (ALL) Risk Assessment Value Set"
Description: "Codes in the ALL risk assessment system."
* insert SNOMEDCopyrightForVS
* SCT#260360000 "Very high (qualifier value)"
* SCT#62482003 "Low (qualifier value)"
* SCT#75540009 "High (qualifier value)"
* SCT#11896004 "Intermediate (qualifier value)"




