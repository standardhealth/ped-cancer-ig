Profile: StemCellTransplant
Parent: CancerRelatedSurgicalProcedure
Id: pedcan-stem-cell-transplant
Title: "Stem Cell Transplant Procedure"
Description: "A procedure in which a patient receives healthy stem cells (blood-forming cells) to replace their own stem cells that have been destroyed by treatment with radiation or high doses of chemotherapy. The healthy stem cells may come from the blood or bone marrow of the patient or from a related or unrelated donor. A stem cell transplant may be autologous (using a patient's own stem cells that were collected and saved before treatment), allogeneic (using stem cells from a related or unrelated donor), syngeneic (using stem cells donated by an identical twin), or cord blood (using umbilical cord blood donated after a baby is born). (Source: NCI Dictionary of Cancer Terms)"
* code from StemCellTransplantVS
* insert SimpleArraySlicingRules(usedCode)
* usedCode contains stemCellSource 0..1
* usedCode[stemCellSource] from StemCellSourceVS
* extension contains 
    Donor named donor 0..1 and
    HLAMatchStatusExtension named matchStatus 0..1

Extension: Donor
Id: pedcan-donor-extension
Title: "Donor"
Description: "The donor of a biologic product or body structure used in a transplant procedure."
* value[x] only CodeableConcept or Reference(RelatedPerson)
* valueCodeableConcept from PatientRelationshipType  // http://hl7.org/fhir/ValueSet/relatedperson-relationshiptype

Extension: HLAMatchStatusExtension
Id: pedcan-match-status-extension
Title: "HLA Match Status Extension"
Description: "Extension with a referenece to the HLA match status."
* value[x] only Reference(HLAMatchStatus)

Profile: HLAMatchStatus
Parent: USCoreLaboratoryResultObservationProfile
Id: pedcan-hla-match-status
Title: "HLA Match Status"
Description: "Summary of human leukocyte antigens (HLA) matching patients and donors for blood or marrow transplants, derived from the HLA genotype."
* code = LNC#96061-7 // HLA donor match status [Type] 
* subject only Reference(USCorePatient)
* focus only Reference(RelatedPerson)  // donor
* focus ^short = "Reference to potential stem cell donor"
* value[x] only CodeableConcept
* value[x] from HLAMatchStatusVS
* insert ObservationComponentSlicingRules
* insert DefineIntegerComponent(numberEvaluated, NCIT#C173301, 0, 1, "Number of Evaluated HLAs", "Number of Evaluated HLAs")
* insert DefineIntegerComponent(numberMatched, NCIT#C173302, 0, 1, "Number of Matched HLAs", "Number of Matched HLAs")
* insert DefineCodeableComponent(HLA_A_result, SCT#49495002, 0, 1, HLAMatchStatusVS, "Match Status for HLA-A Antigen", "Match Status for HLA-A Antigen")
* insert DefineCodeableComponent(HLA_B_result, SCT#54481006, 0, 1, HLAMatchStatusVS, "Match Status for HLA-B Antigen", "Match Status for HLA-B Antigen")
* insert DefineCodeableComponent(HLA_C_result, SCT#80188006, 0, 1, HLAMatchStatusVS, "Match Status for HLA-C Antigen", "Match Status for HLA-C Antigen")
* insert DefineCodeableComponent(HLA_DRB1_result, SCT#260075000, 0, 1, HLAMatchStatusVS, "Match Status for HLA-DRB1 Antigen", "Match Status for HLA-DRB1 Antigen")
* insert DefineCodeableComponent(HLA_DQ_result, SCT#78749006, 0, 1, HLAMatchStatusVS, "Match Status for HLA-DQ Antigen", "Match Status for HLA-DQ Antigen")
* component contains HLA_other_result 0..*
* component[HLA_other_result].code from HLAAntigenVS
* component[HLA_other_result].value[x] from HLAMatchStatusVS
* component[HLA_other_result] ^short = "Match Status for named HLA Antigen"
* component[HLA_other_result] ^definition = "Match Status for named HLA Antigen"


/*--- VALUE SETS ----*/

ValueSet: HLAMatchStatusVS
Id: pedcan-hla-match-status-vs
Title: "HLS Match Status Value Set"
Description: "Codes for the patient's HLA donor match status (matched, mismatched)"
* LNC#LA31027-8 "HLA-matched"
* LNC#LA31028-6 "HLA-mismatched"

ValueSet: StemCellTransplantVS
Id: pedcan-stem-cell-transplant-vs
Title: "Stem Cell Transplant Value Set"
Description:  "Codes identifying different types of stem cell transplants."
* insert SNOMEDCopyrightForVS
* include codes from system SCT where concept is-a #234336002 "Hemopoietic stem cell transplant (procedure)"

ValueSet: StemCellSourceVS
Id: pedcan-stem-cell-source-vs
Title: "Stem Cell Source Value Set"
Description:  "Codes identifying the type of stem cell used in a stem cell transplant."
* insert SNOMEDCopyrightForVS
* include codes from system SCT where concept descendant-of #419758009 "Stem cell (cell)"

ValueSet: HLAAntigenVS
Id: pedcan-hla-antigen-vs
Title: "HLS Antigen Value Set"
Description: "Codes identifying HLA antigens"
* insert SNOMEDCopyrightForVS
* include codes from system SCT where concept descendant-of #47038001 "Human leukocyte antigen (substance)"

