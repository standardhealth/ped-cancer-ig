//Option 1 - Diagnostic Report that references Histologic type, grade, and behavior. Type and behavior are also covered under the mCODE PrimaryCancerCondition histology extension//


Profile: TumorMorphologyReport
Parent: USCoreDiagnosticReportProfileLaboratoryReporting
Id: pedcan-tumor-morphology
Title: "Tumor Morphology"
Description: "ICD-O-3 morphology determined from examination of tumor sample, composed of three parts: histologic type, the malignant potential of the tumor (behavior) and the tumor grade (degree of differentiation)."
* ^extension[FMM].valueInteger = 4
* specimen only Reference(HumanSpecimen)
* specimen 0..1 MS
* code = LNC#77753-2  // Tumor morphology panel Cancer
* subject only Reference(CancerPatient)
* subject ^definition = "Patient whose test result is recorded."
* subject 1..1
* effective[x] only dateTime or Period
* extension contains RelatedCondition named relatedCondition 0..* MS 
* extension[relatedCondition] ^short = "Condition associated with this test."
* extension[relatedCondition] ^definition = "Associates the tumor marker test with a condition, if one exists. Condition can be given by a reference or a code. In the case of a screening test such as prostate-specific antigen (PSA), there may be no existing condition to reference."
* insert SliceReferenceOnProfile(result)
* result contains histology 0..1 and behavior 0..1 and grade 0..1
* result[histology] only Reference(HistologicType)
* result[histology] ^short = "Histology Type being reported using ICD-O-3"
* result[histology] ^definition = "The ICD-O-3 4-digit histology code for the tumor"
* result[behavior] only Reference(HistologicBehavior)
* result[behavior] ^short = "Tumor behavior code being reported using ICD-O-3"
* result[behavior] ^definition = "The ICD-O-3 5th digit, a 1-digit behavior code for the tumor"
* result[grade] only Reference(HistologicGrade)
* result[grade] ^short = "Tumor grade code being reported using SNOMED" //should I change this back to ICD-O-3?
* result[grade] ^definition = "The histologic grade of the tumor"

Profile: HistologicBehavior
Parent: USCoreObservationLab
Id: pedcan-histologic-behavior
Title: "Histologic Behavior"
Description: "Histologic behavior determined from examination of tumor sample."
* ^extension[FMM].valueInteger = 4
* specimen only Reference(HumanSpecimen)
* specimen 0..1 MS
* code = LNC#31206-6 // Behavior ICD-O-3 Cancer
* value[x] only CodeableConcept
* value[x] 1..1
* value[x] from HistologicBehaviorVS
* subject only Reference(CancerPatient)
* subject ^definition = "Patient whose test result is recorded."
* subject 1..1
* effective[x] only dateTime or Period
* extension contains RelatedCondition named relatedCondition 0..* MS 
* extension[relatedCondition] ^short = "Condition associated with this test."
* extension[relatedCondition] ^definition = "Associates the tumor marker test with a condition, if one exists. Condition can be given by a reference or a code. In the case of a screening test such as prostate-specific antigen (PSA), there may be no existing condition to reference."

Profile: HistologicType
Parent: USCoreObservationLab
Id: pedcan-histologic-type
Title: "Histologic Type"
Description: "Histologic type determined from examination of tumor sample."
* ^extension[FMM].valueInteger = 4
* specimen only Reference(HumanSpecimen)
* specimen 0..1 MS
* code = LNC#31205-8 // Histology ICD-O-3 Cancer
* value[x] only CodeableConcept
* value[x] 1..1
* value[x] from HistologicTypeVS
* subject only Reference(CancerPatient)
* subject ^definition = "Patient whose test result is recorded."
* subject 1..1
* effective[x] only dateTime or Period
* extension contains RelatedCondition named relatedCondition 0..* MS 
* extension[relatedCondition] ^short = "Condition associated with this test."
* extension[relatedCondition] ^definition = "Associates the tumor marker test with a condition, if one exists. Condition can be given by a reference or a code. In the case of a screening test such as prostate-specific antigen (PSA), there may be no existing condition to reference."

Profile: HistologicGrade
Parent: USCoreObservationLab
Id: pedcan-histologic-grade
Title: "Histologic Grade"
Description: "Histologic grade determined from examination of tumor sample."
* ^extension[FMM].valueInteger = 4
* specimen only Reference(HumanSpecimen)
* specimen 0..1 MS  // is not MS in US Core 4.0.0 and 5.0.1 
* code = LNC#33732-9 // Histology grade [Identifier] in Cancer specimen  (could be 21858-6 Grade Cancer)
* value[x] 1..1
* value[x] only CodeableConcept
* value[x] from HistologicGradeVS
* subject only Reference(CancerPatient)
* subject ^definition = "Patient whose test result is recorded."
* subject 1..1
* effective[x] only dateTime or Period
* extension contains RelatedCondition named relatedCondition 0..* MS 
* extension[relatedCondition] ^short = "Condition associated with this test."
* extension[relatedCondition] ^definition = "Associates the histologic grade test with a condition, if one exists. Condition can be given by a reference or a code."
* method from HistologicGradingSystemVS (extensible)
// Already MS in US Core Obs Lab: status, category, code, subject, effective[x], value[x], dataAbsentReason
// RelatedCondition added 11/14/2022, see https://chat.fhir.org/#narrow/stream/229074-CodeX/topic/Reference.20between.20tumor.20characteristics.20and.20cancer.20diagnosis


ValueSet: HistologicTypeVS
Id: pedcan-histologic-type-vs
Title: "Histologic Type Value Set"
Description:  "A description of a tumor based on how abnormal the cancer cells and tissue look under a microscope and how quickly the cancer cells are likely to grow and spread."
* include codes from system ICDO3  // should exclude topology codes, but no practical way to do this?


ValueSet: HistologicGradeVS
Id: pedcan-histologic-grade-vs
Title: "Histologic Grade Value Set"
Description:  "A description of a tumor based on how abnormal the cancer cells and tissue look under a microscope."
* insert SNOMEDCopyrightForVS
//* include codes from system SCT where concept is-a #370114008 "Histological grades (qualifier value)"
* SCT#1155708003 "Low histologic grade (qualifier value)"
* SCT#1286893008 "Intermediate histologic grade (qualifier value)"
* SCT#1155707008 "High histologic grade (qualifier value)"


//covered by histology type
//* SCT#57184004 "T lymphocyte (cell)"
//* SCT##112130006 "B lymphocyte (cell)"
//* SCT#54991005 "Null lymphocyte (cell)"
//* SCT#259717003 "Natural Killer cell (cell)"
//* ICDO3#9 "Grade, cell type, or differentiation not determined, not stated, or not applicable"
/*Team said low/mintermediate/high are more commonly used
* ICDO3#1 "Grade I: Well differentiated"
* ICDO3#2 "Grade II: Moderately differentiated"
* ICDO3#3 "Grade III: Poorly differentiated"
* ICDO3#4 "Grade IV: Undifferentiated"
* ICDO3#5 "T-cell"
* ICDO3#6 "B-cell"
* ICDO3#7 "Null cell"
* ICDO3#8 "NK cell"
* ICDO3#9 "Grade, cell type, or differentiation not determined, not stated, or not applicable"
* ICDO3#4 "Grade IV: Undifferentiated"*/

ValueSet: HistologicGradingSystemVS
Id: pedcan-histologic-grading-system-vs
Title: "Histologic Grading System Value Set"
Description:  "A description of a tumor based on how abnormal the cancer cells and tissue look under a microscope and how quickly the cancer cells are likely to grow and spread."
* insert SNOMEDCopyrightForVS
* include codes from system SCT where concept is-a #277457005 "Histological grading systems (staging scale)"



ValueSet: HistologicBehaviorVS
Id: pedcan-histologic-behavior-vs
Title: "Histologic Behavior Value Set"
Description:  "How likely the cancer cells are likely to grow and spread."
* ICDO3#/0 "Benign"
* ICDO3#/1 "Uncertain whether benign or malignant"
* ICDO3#/2 "Carcinoma in situ"
* ICDO3#/3 "Malignant, primary site"
* ICDO3#/6 "Malignant, metastatic site"
* ICDO3#/9 "Malignant, uncertain whether primary or metastatic site" 