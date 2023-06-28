Profile: TumorMorphologyReport
Parent: USCoreDiagnosticReportProfileLaboratoryReporting
Id: pedcan-tumor-morphology
Title: "Tumor Morphology"
Description: "ICD-O-3 morphology determined from examination of tumor sample, composed of three parts: histologic type, the malignant potential of the tumor (behavior) and the tumor grade (degree of differentiation)."
* specimen 1..1 MS
* code = LNC#77753-2  // Tumor morphology panel Cancer
* insert SliceReferenceOnProfile(result)
* result contains histology 0..1 and behavior 0..1 and grade 0..1
* result[histology] only Reference(HistologicType)
* result[histology] ^short = "Histology Type being reported using ICD-O-3"
* result[histology] ^definition = "The ICD-O-3 4-digit histology code for the tumor"
* result[behavior] only Reference(HistologicBehavior)
* result[behavior] ^short = "Tumor behavior code being reported using ICD-O-3"
* result[behavior] ^definition = "The ICD-O-3 5th digit, a 1-digit behavior code for the tumor"
* result[grade] only Reference(HistologicGrade)
* result[grade] ^short = "Tumor grade code being reported using ICD-O-3"
* result[grade] ^definition = "The ICD-O-3 6th digit, a 1-digit grade or differentiation code for the tumor"

Profile: HistologicType
Parent: USCoreObservationLab
Id: pedcan-histologic-type
Title: "Histologic Type"
Description: "Histologic type determined from examination of tumor sample."
* specimen 1..1 MS
* code = LNC#31205-8 // Histology ICD-O-3 Cancer
* value[x] only CodeableConcept
* value[x] from HistologicTypeVS

Profile: HistologicBehavior
Parent: USCoreObservationLab
Id: pedcan-histologic-behavior
Title: "Histologic Behavior"
Description: "Histologic behavior determined from examination of tumor sample."
* specimen 1..1 MS
* code = LNC#31206-6 // Behavior ICD-O-3 Cancer
* value[x] only CodeableConcept
* value[x] from HistologicBehaviorVS

Profile: HistologicGrade
Parent: USCoreObservationLab
Id: pedcan-histologic-grade
Title: "Histologic Grade"
Description: "Histologic grade determined from examination of tumor sample."
* specimen 1..1 MS
* code = LNC#33732-9 // Histology grade [Identifier] in Cancer specimen  (could be 21858-6 Grade Cancer)
* value[x] only CodeableConcept
* value[x] from HistologicGradeVS
* method from HistologicGradingSystemVS (extensible)

ValueSet: HistologicTypeVS
Id: pedcan-histologic-type-vs
Title: "Histologic Type Value Set"
Description:  "A description of a tumor based on how abnormal the cancer cells and tissue look under a microscope and how quickly the cancer cells are likely to grow and spread."
* include codes from system ICDO3  // should exclude topology codes, but no practical way to do this?

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

ValueSet: HistologicGradeVS
Id: pedcan-histologic-grade-vs
Title: "Histologic Grade Value Set"
Description:  "A description of a tumor based on how abnormal the cancer cells and tissue look under a microscope."
//* insert SNOMEDCopyrightForVS
//* include codes from system SCT where concept is-a #370114008 "Histological grades (qualifier value)"
* ICDO3#1 "Grade I: Well differentiated"
* ICDO3#2 "Grade II: Moderately differentiated"
* ICDO3#3 "Grade III: Poorly differentiated"
* ICDO3#4 "Grade IV: Undifferentiated"
* ICDO3#5 "T-cell"
* ICDO3#6 "B-cell"
* ICDO3#7 "Null cell"
* ICDO3#8 "NK cell"
* ICDO3#9 "Grade, cell type, or differentiation not determined, not stated, or not applicable"

ValueSet: HistologicGradingSystemVS
Id: pedcan-histologic-grading-system-vs
Title: "Histologic Grading System Value Set"
Description:  "A description of a tumor based on how abnormal the cancer cells and tissue look under a microscope and how quickly the cancer cells are likely to grow and spread."
* insert SNOMEDCopyrightForVS
* include codes from system SCT where concept is-a #277457005 "Histological grading systems (staging scale)"
