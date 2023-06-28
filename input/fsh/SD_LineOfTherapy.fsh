Extension: LineOfTherapyNumber
Id: pedcan-line-of-therapy-number
Title:  "Line of Therapy Number"
Description: "A serial chronological number assigned to each systemic anti-cancer therapy (SACT) administered to a patient, denoting a discrete attempt to treat the cancer. The Line of Therapy (LoT) should be assigned by the clinician, since inferring the LoT"
* insert ExtensionContext(MedicationRequest)
* insert ExtensionContext(MedicationAdministration)
* insert ExtensionContext(LineOfTherapy)
* value[x] only positiveInt
* value[x] 1..1

Profile: RegimenIdentifier
Parent: Identifier
Id: pedcan-regimen-identifier
Title: "Regimen Identifier"
Description: "An identifier for the regimen or regimen variant. Since regimens generally lack standard identifiers and are constantly changing, the regimens should be identified with a text description in `identifier.value`, e.g., 'anastrozole & palbociclib' and URL in `identifier.system`, e.g., https://www.cancercareontario.ca/en/drugformulary/regimens/56831"
* type from RegimenTypeVS (extensible)
* value 1..1
* value ^short = "Description of the regimen"
* value ^definition = "A description of the regimen in terms of the medications, cycles, doses, etc."
* system ^short = "URL reference."
* system ^definition = "A reference to more information about the regimen. Not every regimen will have a definitive source."

ValueSet: RegimenTypeVS
Id: pedcan-regime-type-vs
Title: "Regimen Type Value Set"
Description: "Codes that identify the type of regimen being described, for example, a therapeutic Values should come from the regime/therapies branch of SNOMED CT (under procedure)"
* SCT#133877004 "Therapeutic regimen (regime/therapy)"
* SCT#716872004 "Antineoplastic chemotherapy regimen (regime/therapy)"
* SCT#897713009 "Antineoplastic chemoimmunotherapy (regime/therapy)"
* SCT#110461004 "Adjunctive care (regime/therapy)"
* SCT#103735009 "Palliative care (regime/therapy)"

Profile: LineOfTherapy
Parent: USCoreCarePlanProfile
Id: pedcan-line-of-therapy
Title:  "Line of Therapy"
Description: "A record of line of therapy (LoT) given to a patient, both planned and executed. A LoT is  identified by a serial chronological number assigned to each systemic anti-cancer therapy administered to a patient, denoting a discrete attempt to treat the cancer. Definition of a LoT can be defined by start and end rules such as those given in [Hess et al., 2021](https://www.futuremedicine.com/doi/full/10.2217/fon-2020-1041) or [this Optum whitepaper](https://cdn-aem.optum.com/content/dam/optum3/optum/en/resources/white-papers/wf520768_guidelines-for-determining-lines-of-therapy.pdf). However, the exact rules around LoT starting and ending are not defined by this profile, and should be determined by the clinician."
* extension contains LineOfTherapyNumber named lineOfTherapyNumber 1..1 MS
* extension contains ProcedureIntent named treatmentIntent 0..1 MS 
* replaces only Reference(LineOfTherapy)
// Identify the regimen
* identifier ^short = "Identifiers for this LoT, including identifiers for the regimen (if any)."
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier contains regimenIdentifier 1..*
* identifier[regimenIdentifier] only RegimenIdentifier
* identifier[regimenIdentifier] ^short = "Regimen indentifier."
* identifier[regimenIdentifier] ^definition = "The regimen this line of therapy is based on. Deviations from the regimen (such as different number of cycles) are documented in the activities of the care plan instance (`activity.outcomeReference`)."
* activity.outcomeReference only Reference(CancerRelatedMedicationAdministration or CancerRelatedMedicationRequest or MedicationDispense or Procedure)
* activity.outcomeReference ^short = "Action taken as part of this line of therapy"
* activity.outcomeReference ^definition = "An action carried out as part of the line of therapy, a medication administration, medication dispense, or procedure."
