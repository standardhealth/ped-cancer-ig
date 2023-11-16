//profiles//

Profile: TreatmentRegimen
Parent: USCoreCarePlanProfile
Id: pedcan-treatment-regimen
Title:  "Treatment Regimen"
Description: "A regimen is a treatment plan that specifies the dosage, the schedule, and the duration of treatment Definition from: [NCI Thesaurus] (https://www.cancer.gov/publications/dictionaries/cancer-terms/def/regimen). This profile captures information important for a regimen.
Since regimens generally lack standard identifiers and are constantly changing, the regimens should be identified with a text description in identifier.value, e.g., ‘anastrozole & palbociclib’ and URL in identifier.system, e.g., https://www.cancercareontario.ca/en/drugformulary/regimens/56831
A Line of Therapy (LoT) is  identified by a serial chronological number assigned to each systemic anti-cancer therapy administered to a patient, denoting a discrete attempt to treat the cancer. Definition of a LoT can be defined by start and end rules such as those given in [Hess et al., 2021](https://www.futuremedicine.com/doi/full/10.2217/fon-2020-1041) or [this Optum whitepaper](https://cdn-aem.optum.com/content/dam/optum3/optum/en/resources/white-papers/wf520768_guidelines-for-determining-lines-of-therapy.pdf). However, the exact rules around LoT starting and ending are not defined by this profile, and should be determined by the clinician."

* extension contains LineOfTherapyNumber named lineOfTherapyNumber 1..1 MS
* extension contains ProcedureIntent named treatmentIntent 0..1 MS
* extension contains TreatmentPhase named treatmentPhase 0..1 MS
* subject only Reference(CancerPatient)
//* extension contains TreatmentTerminationReason named terminationReason 0..* MS
//* replaces only Reference(LineOfTherapy)
// Identify the regimen
* identifier ^short = "Identifiers for this LoT, including identifiers for the regimen (if any)."
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier contains regimenIdentifier 1..*
* identifier[regimenIdentifier] only RegimenIdentifier
* identifier[regimenIdentifier] ^short = "Regimen indentifier."
* identifier[regimenIdentifier] ^definition = "The regimen this line of therapy is based on. Deviations from the regimen (such as different number of cycles) are documented in the activities of the care plan instance (`activity.outcomeReference`)."
* activity.outcomeReference only Reference(CancerRelatedMedicationAdministration or CancerRelatedMedicationRequest or MedicationDispense or CancerRelatedSurgicalProcedure or RadiotherapyCourseSummary)
* activity.outcomeReference ^short = "Action taken as part of this regimen"
* activity.outcomeReference ^definition = "An action carried out as part of the line of therapy, a medication administration, medication dispense, or procedure."

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

Profile: TreatmentPhaseProfile
Parent: Basic
Id: pedcan-treatment-phase-profile
Title: "Treatment Phase Profile"
Description: "A period of time marked by the application of a certain therapeutic approch."
* ^abstract = true
* code = SCT#277132007 "Therapeutic procedure (procedure)"
* extension contains TreatmentPhaseName named phaseName 0..1 MS
* extension contains TreatmentPhaseNumber named phaseNumber 1..1 MS
* extension contains TreatmentPhaseStartDate named startDate 0..1 MS
* extension contains TreatmentPhaseEndDate named endDate 0..1 MS
* extension contains TreatmentPhaseDescription named description 0..1 MS

//extensions//

Extension: LineOfTherapyNumber
Id: pedcan-line-of-therapy-number
Title:  "Line of Therapy Number"
Description: "A serial chronological number assigned to each systemic anti-cancer therapy (SACT) administered to a patient, denoting a discrete attempt to treat the cancer. The Line of Therapy (LoT) should be assigned by the clinician, since inferring the LoT"
* insert ExtensionContext(MedicationRequest)
* insert ExtensionContext(MedicationAdministration)
* insert ExtensionContext(CancerRelatedSurgicalProcedure)
* insert ExtensionContext(RadiotherapyCourseSummary)
* value[x] only positiveInt
* value[x] 1..1

Extension: TreatmentPhase
Id: pedcan-treatment-phase
Title:  "Treatment Phase"
Description: "The name and number of the phase during which relevant observations were recorded (e.g., Induction 1, Induction 2, Induction 3, etc.)."
* insert ExtensionContext(MedicationRequest)
* insert ExtensionContext(MedicationAdministration)
* insert ExtensionContext(CancerRelatedSurgicalProcedure)
* insert ExtensionContext(RadiotherapyCourseSummary)
* value[x] only Reference(TreatmentPhase)
* value[x] 1..1

Extension: TreatmentPhaseName
Id: pedcan-treatment-phase-name
Title:  "Treatment Phase Name"
Description: "The name of the treatment phase during which relevant observations were recorded."
* value[x] only CodeableConcept
* value[x] from TreatmentPhaseNameVS (extensible)
* value[x] 1..1

Extension: TreatmentPhaseNumber
Id: pedcan-treatment-phase-number
Title:  "Treatment Phase Number"
Description: "This variable indicates the ordinal numbering of the Phase within its various subgroups (e.g., Induction 1, Induction 2, Induction 3, etc.). The observations across domains can therefore be organized longitudinally without the need for specific dates."
* value[x] only unsignedInt   // start at 0 or 1?
* value[x] 1..1

Extension: TreatmentPhaseStartDate
Id: pedcan-treatment-phase-start-date
Title:  "Treatment Phase Start Date"
Description: "The date when an ordinally numbered phase was started."
* value[x] only date
* value[x] 1..1

Extension: TreatmentPhaseEndDate
Id: pedcan-treatment-phase-end-date
Title:  "Treatment Phase End Date"
Description: "The date when an ordinally numbered phase was ended."
* value[x] only date
* value[x] 1..1

Extension: TreatmentPhaseDescription
Id: pedcan-treatment-phase-description
Title:  "Treatment Phase Description"
Description: "Text description of the resource."
* value[x] only string
* value[x] 1..1


//value sets//

ValueSet: RegimenTypeVS
Id: pedcan-regime-type-vs
Title: "Regimen Type Value Set"
Description: "Codes that identify the type of regimen being described, for example, a therapeutic Values should come from the regime/therapies branch of SNOMED CT (under procedure)"
* SCT#133877004 "Therapeutic regimen (regime/therapy)"
* SCT#716872004 "Antineoplastic chemotherapy regimen (regime/therapy)"
* SCT#897713009 "Antineoplastic chemoimmunotherapy (regime/therapy)"
* SCT#110461004 "Adjunctive care (regime/therapy)"
* SCT#103735009 "Palliative care (regime/therapy)"

ValueSet: TreatmentPhaseNameVS
Id: pedcan-treatment-phase-name-vs
Title: "Treatment Phase Name Value Set"
Description: "Codes that identify the name of the treatmnent phase."
* NCIT#C15679 "Consolidation Therapy"
* NCIT#C178270 "Delayed intesification therapy"
* NCIT#C123452 "Continuation Therapy Epoch"
* NCIT#C158876 "Induction Therapy"
* NCIT#C173105 "Intensification Therapy"
* NCIT#C178069 "Interim Maintenance Therapy"
* NCIT#C15688 "Maintenance Therapy"



/* Cutting this out for now because I couldn't find codes for TreatmentToleration
Extension: TreatmentToleration
Id: pedcan-treatment-toleration
Title:  "Treatment Toleration"
Description: "Subjective assessment of how well a treatment is tolerated by the patient."
* insert ExtensionContext(MedicationAdministration)
* insert ExtensionContext(LineOfTherapy)
* insert ExtensionContext(Procedure)
* value[x] only CodeableConcept
* value[x] from TreatmentTolerationVS

ValueSet: TreatmentTolerationVS
Id: pedcan-treatment-toleration-vs
Title: "Treatment Toleration Value Set"
Description: "Codes describing levels of treatment toleration."
* SCT#
*/