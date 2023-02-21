Alias:   USCoreObservationLab = http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-lab
Alias:   USCoreCondition = http://hl7.org/fhir/us/core/StructureDefinition/us-core-condition-problems-health-concerns

Profile: TumorNecrosisObservation
Parent: USCoreObservationLab
Id: os-tumor-necrosis-observation
Title: "Tumor Necrosis Observation"
Description: "The percentage necrosis for a tumor or tumors"
* focus 1..1
* focus only Reference(Tumor or USCoreCondition)  // possible SUSHI bug TBD: does not work as Reference(Tumor or PrimaryCancerCondition)
* code = SCT#405921002 // Percentage of tumor involved by necrosis (observable entity)
* value[x] only Quantity
* valueQuantity = UCUM#%
* value[x] ^definition = "Percentage necrosis in tumor or overall."

Profile: SurgicalMarginFinding
Parent: USCoreObservationLab
Id: os-surgical-margin-finding
Title: "Surgical Margin Finding"
Description: "Result of macro- or microscopic examination of the margins of resected tumor"
* code = SCT#395536008 "Surgical margin finding (finding)"
* value[x] only CodeableConcept
* value[x] from SurgicalMarginFindingVS

ValueSet: SurgicalMarginFindingVS
Id: os-surgical-margin-finding-vs
Title: "Surgical Margin Finding Value Set"
Description:  "Codes describing the result of macro- or microscopic examination of the margins of a resected tumor"
* insert SNOMEDCopyrightForVS
* include codes from system SCT where concept is-a #395536008 "Surgical margin finding (finding)"