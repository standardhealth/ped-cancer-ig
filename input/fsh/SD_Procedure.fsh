Profile: CombinedSurgery
Parent: CancerRelatedSurgicalProcedure
Id: pedcan-combined-surgery
Title: "Combined Surgery"
Description: "A surgery that involves more than one type of surgical procedure, for example, resection and reconstruction."

Profile: SurgicalResectionProcedure
Parent: CancerRelatedSurgicalProcedure
Id: pedcan-surgical-resection-procedure
Title: "Surgical Resection Procedure"
Description: "Surgery to remove tissue or part or all of an organ or limb due to presence of cancer. Can be part of a surgical procedure that involves other steps, such as reconstruction."
* code from SurgicalResectionProcedureVS
* outcome from SurgicalResectionOutcomeVS

Profile: BiopsyProcedure
Parent: CancerRelatedSurgicalProcedure
Id: pedcan-biopsy-procedure
Title: "Biopsy Procedure"
Description: "Surgery to remove tissue for diagnostic purposes."
* code from BiopsyProcedureVS

Profile: SurgicalReconstructionProcedure
Parent: CancerRelatedSurgicalProcedure
Id: pedcan-surgical-reconstruction-procedure
Title: "Surgical Reconstruction Procedure"
Description: "Surgery to restore functionality or appearance following cancer surgery. Can be part of a surgical procedure that involves other steps, such as resection."  // Cancer surgery only?
* code from SurgicalReconstructionProcedureVS

Profile: SurgicalAmputationProcedure
Parent: CancerRelatedSurgicalProcedure
Id: pedcan-surgical-amputation-procedure
Title: "Surgical Amputation Procedure"
Description: "Surgery to remove a limb (arm or leg) or other body part because of cancer. Can be part of a surgical procedure that involves other steps, such as reconstruction."  // Cancer surgery only?
* code from SurgicalAmputationProcedureVS

/*--- VALUE SETS ----*/

ValueSet: SurgicalResectionProcedureVS
Id: pedcan-surgical-resection-procedure-vs
Title: "Surgical Resection Procedure Value Set"
Description:  "Codes that describe surgical resections."
* insert SNOMEDCopyrightForVS
* include codes from system SCT where concept is-a #128303001 "Surgical removal (procedure)"

ValueSet: SurgicalResectionOutcomeVS
Id: pedcan-surgical-resection-outcome-vs
Title: "Surgical Resection Outcome Value Set"
Description:  "Codes that describe the macroscopic outcome surgical resections. Microscopic finding of tumor margins should be reported using the SurgicalMarginFinding profile"
* ^experimental = true
* NCIT#C131672 "Gross Total Resection"
* NCIT#C131680 "Partial Resection"

ValueSet: BiopsyProcedureVS
Id: pedcan-biopsy-procedure-vs
Title: "Biopsy Procedure Value Set"
Description:  "Codes that describe biopsy procedures."
* insert SNOMEDCopyrightForVS
* include codes from system SCT where concept is-a #86273004 "Biopsy (procedure)"

ValueSet: SurgicalReconstructionProcedureVS
Id: pedcan-surgical-reconstruction-procedure-vs
Title: "Surgical Reconstruction Procedure Value Set"
Description:  "Codes that describe surgical reconstruction."
* insert SNOMEDCopyrightForVS
* include codes from system SCT where concept is-a #122465003 "Reconstruction procedure (procedure)"

ValueSet: SurgicalAmputationProcedureVS
Id: pedcan-surgical-amputation-procedure-vs
Title: "Surgical Amputation Procedure Value Set"
Description:  "Codes that describe surgical amputation."
* insert SNOMEDCopyrightForVS
* include codes from system SCT where concept is-a #81723002 "Amputation (procedure)"
