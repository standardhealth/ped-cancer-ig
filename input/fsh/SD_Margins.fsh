Alias:   USCoreObservationLab = http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-lab
Alias:   USCoreCondition = http://hl7.org/fhir/us/core/StructureDefinition/us-core-condition-problems-health-concerns


//Extent of Margin//

Profile: SurgicalTumorMargin
Parent: USCoreObservationLab
Id: pedcan-surgical-tumor-margin
Title: "Surgical Margin"
Description: "Result of microscopic examination of the margins of a resected tumor."
* code = SCT#395536008 "Surgical margin finding (finding)"
* value[x] only CodeableConcept
* value[x] from SurgicalMarginVS
* partOf only Reference(SurgicalResectionProcedure)
* insert ObservationComponentSlicingRules
* component contains minimumMargin 0..1 
* component[minimumMargin].value[x] only Quantity
* component[minimumMargin].valueQuantity.unit = UCUM#mm
* component[minimumMargin] ^short = "Smallest margin (mm)"
* component[minimumMargin] ^definition = "The distance of the closest surgical margin from tumor after surgical resection of the tumor. The closest distance between a tumor and its resection margin has prognostic significance."

ValueSet: SurgicalMarginVS
Id: pedcan-surgical-margin-vs
Title: "Surgical Margin Value Set"
Description:  "Codes describing the result of macro- or microscopic examination of the margins of a resected tumor."
* insert SNOMEDCopyrightForVS
* SCT#442479004	"Surgical margins of excised lesion not clear"
* SCT#55182004 "Surgical margins free of tumor"




/* Not high priority

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

Profile: CentralNervousSystemInvolvement
Parent: USCoreObservationLab
Id: pedcan-cns-involvement
Title: "Central Nervous System Involvement"
Description: "Central nervous system involvement with hematologic malignancy, measured by the number of red and white blood cells found in a cerebral spinal fluid cytospin preparation, at the time of leukemia diagnosis."
* code = NCIT#C116832 // CNS Involvement Status at Leukemia Diagnosis
* value[x] only CodeableConcept
* value[x] from CentralNervousSystemInvolvementVS

ValueSet: CentralNervousSystemInvolvementVS
Id: pedcan-central-nervous-system-involvement-vs
Title: "Central Nervous System Involvement Value Set"
Description: "Codes describing the degree of CNS involvement at the time of leukemia diagnosis"
* NCIT#C116833 "CNS1: The status of central nervous system leukemia at diagnosis, where there is an absence of blasts on a cerebral spinal fluid cytospin preparation, regardless of the number of white blood cells."
* NCIT#C116834 "CNS2: The status of central nervous system leukemia at diagnosis, where there are less than 5 white blood cells per microliter on a cerebral spinal fluid cytospin preparation that is positive for blasts; or greater than 5 white blood cells per microliter on a cerebral spinal fluid cytospin preparation that is considered negative by Steinherz/Bleyer algorithm."
* NCIT#C116835 "CNS3: The status of central nervous system leukemia at diagnosis, where there are more than 5 white blood cells per microliter on a cerebral spinal fluid cytospin preparation that is positive for blasts; with or without clinical signs of leukemia."
* NCIT#C116836 "CNS2a: The status of central nervous system leukemia at diagnosis, where there are less than 10 red blood cells and less than 5 white blood cells per microliter on a cerebral spinal fluid cytospin preparation that is positive for blasts."
* NCIT#C116837 "CNS2b: The status of central nervous system leukemia at diagnosis, where there are 10 or more red blood cells and less than 5 white blood cells per microliter on a cerebral spinal fluid cytospin preparation that is positive for blasts."
* NCIT#C116838 "CNS2c: The status of central nervous system leukemia at diagnosis, where there are 10 or more red blood cells and 5 or more white blood cells per microliter on a cerebral spinal fluid cytospin preparation that is positive for blasts and is considered negative by Steinherz/Bleyer algorithm."
* NCIT#C116840 "CNS3a: The status of central nervous system leukemia at diagnosis, where there are less than 10 red blood cells and 5 or more white blood cells per microliter on a cerebral spinal fluid cytospin preparation that is positive for blasts."
* NCIT#C116841 "CNS3b: The status of central nervous system leukemia at diagnosis, where there are 10 or more red blood cells and 5 or more white blood cells per microliter on a cerebral spinal fluid cytospin preparation that is considered positive by Steinherz/Bleyer algorithm."
* NCIT#C116843 "CNS3c: The status of central nervous system leukemia at diagnosis, where there are clinical signs of central system leukemia (such as facial nerve palsy, brain/eye involvement, or hypothalamic syndrome)."



*/



/*
Extension: ExtentOfResection
Id: pedcan-extent-of-resection
Title: "Extent of Resection"
Description: "The purpose of a treatment, medication, or procedure."
* insert ExtensionContext(DomainResource)
* insert ExtensionContext(Extension)
* ^extension[FMM].valueInteger = 4
* value[x] only CodeableConcept
* value[x] from ExtentOfResectionVS (required)
* value[x] 1..1
*/



/* remvove - created surgical resection profile

//Extent of Resection//

Profile: ExtentOfResection
Parent: USCoreObservationLab
Id: pedcan-extent-of-resection
Title: "Extent of Resection"
Description: "Extent of Resection"
* code = SCT#246160008 "Extent of Resection (attribute)"
* partOf only Reference(CancerRelatedSurgicalProcedure) 
* value[x] only CodeableConcept
* value[x] from ExtentOfResectionVS (required)
* value[x] 1..1 MS

ValueSet: ExtentOfResectionVS
Id: pedcan-extent-of-resection-vs
Title: "Extent of Resection Value Set"
Description: "Extent of resection"
* ^extension[FMM].valueInteger = 3
* NCIT#C131672 "Gross Total Resection"
* NCIT#C175027 "Complete Resection"
* NCIT#C131680 "Partial Resection"
* NCIT#C185521 "Equivocal Complete Resection" */

