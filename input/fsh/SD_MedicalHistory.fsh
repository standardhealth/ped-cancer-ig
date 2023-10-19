//used the mCODE Comorbidity profile as a basis

Profile: MedicalHistory
Parent: Observation
Id: pedcan-medical-history
Title: "Medical History Profile"
Description: "General structure for capturing medical history. The user can use this profile in three ways: (1) free-form, listing any condition they wish to highlight as significant medical history, or (2) use disease categories defined for registry reporting purposes, such as those defined by Center for International Blood and Marrow Transplant Research (CIBMTR)."
//* ^extension[FMM].valueInteger = 1
* code = SCT#417662000 // History of clinical finding in subject (situation)
* focus only Reference(PrimaryCancerCondition)
* focus ^short = "The Index Condition"
* focus ^definition = "Medical history conditions are typically defined with respect to a specific 'index' condition." 
* subject only Reference(CancerPatient)
* subject ^definition = "The patient whose medical history is recorded."
// We cannot use hasMember because that element does not allow Reference(Condition) or CodeableConcept as a type
// We cannot use component because that element does not allow References of any type
// Therefore, we need extensions to record the comorbid conditions
* extension contains RelatedCondition named pastMedicalConditionPresent 0..*
* extension contains RelatedConditionAbsent named pastMedicalConditionAbsent 0..*
// Indicate MS and NotUsed elements
* extension and extension[pastMedicalConditionPresent] and extension[pastMedicalConditionAbsent] and status and code and subject and focus and effective[x] MS
* insert NotUsed(bodySite)
* insert NotUsed(specimen)
* insert NotUsed(device)
* insert NotUsed(hasMember)
* insert NotUsed(component)
* insert NotUsed(value[x]) //since there's no score or index, I don't think a value would ever be needed?


/* The following were included in the mCODE Comorbidity profile, but I don't think applies to medical history
* method ^short = "Comorbidity framework used."
* method ^definition = "The formal methodology used, such as Charlson, NCI, Elixhauser, or ACE-27. The method must be specified if a comorbidity index is specified, otherwise the index cannot be correctly interpreted."
* value[x] only Quantity or integer
* value[x] ^definition = "Comorbidity score or risk index"
*/