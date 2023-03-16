Alias:   USCoreObservationLab = http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-lab
Alias:   USCoreCondition = http://hl7.org/fhir/us/core/StructureDefinition/us-core-condition-problems-health-concerns

Profile: TumorNecrosisObservation
Parent: USCoreObservationLab
Id: pedcan-tumor-necrosis-observation
Title: "Tumor Necrosis Observation"
Description: "The percentage necrosis for a tumor or tumors"
* focus 1..1
* focus only Reference(Tumor or USCoreCondition)  // possible SUSHI bug TBD: does not work as Reference(Tumor or PrimaryCancerCondition)
* code = SCT#405921002 // Percentage of tumor involved by necrosis (observable entity)
* value[x] only Quantity
* valueQuantity = UCUM#%
* value[x] ^definition = "Percentage necrosis in tumor or overall."

Profile: SurgicalTumorMargin
Parent: USCoreObservationLab
Id: pedcan-surgical-tumor-margin
Title: "Surgical Margin"
Description: "Result of macro- or microscopic examination of the margins of a resected tumor."
* code = SCT#395536008 "Surgical margin finding (finding)"
* value[x] only CodeableConcept
* value[x] from SurgicalMarginVS (extensible)

ValueSet: SurgicalMarginVS
Id: pedcan-surgical-margin-vs
Title: "Surgical Margin Value Set"
Description:  "Codes describing the result of macro- or microscopic examination of the margins of a resected tumor."
* insert SNOMEDCopyrightForVS
* include codes from system SCT where concept is-a #395536008 "Surgical margin finding (finding)"

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
* result[behavior] ^definition = "The ICD-O-3 1-digit behavior code for the tumor"
* result[grade] only Reference(HistologicGrade)
* result[grade] ^short = "Tumor grade code being reported using ICD-O-3"
* result[grade] ^definition = "The ICD-O-3 1-digit grade code for the tumor"

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
* insert SNOMEDCopyrightForVS
* include codes from system SCT where concept is-a #370114008 "Histological grades (qualifier value)"


ValueSet: HistologicGradeVS
Id: pedcan-histologic-grade-vs
Title: "Histologic Grade Value Set"
Description:  "A description of a tumor based on how abnormal the cancer cells and tissue look under a microscope and how quickly the cancer cells are likely to grow and spread."
* insert SNOMEDCopyrightForVS
* include codes from system SCT where concept is-a #370114008 "Histological grades (qualifier value)"

ValueSet: HistologicGradingSystemVS
Id: pedcan-histologic-grading-system-vs
Title: "Histologic Grade Value Set"
Description:  "A description of a tumor based on how abnormal the cancer cells and tissue look under a microscope and how quickly the cancer cells are likely to grow and spread."
* insert SNOMEDCopyrightForVS
* include codes from system SCT where concept is-a #277457005 "Histological grading systems (staging scale)"
