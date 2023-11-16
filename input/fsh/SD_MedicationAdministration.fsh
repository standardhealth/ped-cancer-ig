Profile: CancerRelatedMedicationAdministrationModified
Parent: CancerRelatedMedicationAdministration
Id: pedcan-cancer-related-medication-administration-modified
Title: "Cancer Related Medication Administration Profile -- modified version"
Description: "Adding normalization extension to the Cancer Related Medication Administration profile."
* extension contains NormalizationBasis named normalizationBasis 0..1


Extension: NormalizationBasis
Id: ped-can-normalization-basis
Title:  "Normalization Basis Extension"
Description: "How the drug dosage was normalized."
* insert ExtensionContext(DomainResource)
* insert ExtensionContext(Extension)
* ^extension[FMM].valueInteger = 4
* value[x] only CodeableConcept
* value[x] from NormalizationBasisVS (required)
* value[x] 1..1


ValueSet: NormalizationBasisVS
Id: pedcan-normalization-basis-vs
Title: "Normalization Basis Value Set"
Description: "Normalization basis values."
* ^experimental = false
* insert SNOMEDCopyrightForVS
* SCT#363804004 "Body weight characteristic (observable entity)"
* SCT#60621009 "Body mass index (observable entity)"
* SCT#1157245009 "Fixed dose (qualifier value)"