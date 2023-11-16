Profile:  CancerDiseaseStatusModified
Parent:   CancerDiseaseStatus
Id: pedcan-cancer-disease-status
Title:    "Cancer Disease Status Profile -- modified version"
Description:    "A clinician's qualitative judgment on the current trend of the cancer, e.g., whether it is stable, worsening (progressing), or improving (responding). The judgment may be based a single type or multiple kinds of evidence, such as imaging data, assessment of symptoms, tumor markers, laboratory data, etc."
* value[x] only CodeableConcept
* value[x] from ConditionStatusTrendModifiedVS (preferred)
* value[x] ^binding.extension[http://hl7.org/fhir/StructureDefinition/elementdefinition-maxValueSet].valueCanonical = Canonical(ConditionStatusTrendMaxModifiedVS)


ValueSet:   ConditionStatusTrendModifiedVS
Id: pedcan-condition-status-trend-modified-vs
Title: "Condition Status Trend Modified Value Set"
Description:  "How patient's given disease, condition, or ability is trending."
* insert SNOMEDCopyrightForVS
* ^extension[FMM].valueInteger = 3
* SCT#268910001 "Patient's condition improved (finding)"
* SCT#359746009 "Patient's condition stable (finding)"
* SCT#271299001 "Patient's condition worsened (finding)"
* SCT#709137006 "Patient condition undetermined (finding)"


ValueSet:   ConditionStatusTrendMaxModifiedVS
Id: pedcan-condition-status-trend-max-modified-vs
Title: "Condition Status Trend Maximum Value Set"
Description:  "Like the ConditionStatusTrendVS, but includes two additional deprecated codes and codes that were removed from the VS. Codes from the SNOMED CT disorder hierarchy were less than ideal because the value of an Observation should be either a finding or a qualifier (see https://confluence.ihtsdotools.org/display/FHIR/Observation+binding for details)."
* include codes from valueset ConditionStatusTrendVS
* SCT#550991000124107 "Malignant neoplasm in full remission (disorder)" // FHIR-32837 - MLT_note: SCT FN is displayed. The initial term of "cancer in complete remission" is a synonym for the concept.
* SCT#551001000124108 "Malignant neoplasm in partial remission (disorder)" // FHIR-32837 - MLT_note: SCT FN is displayed. The initial term of "cancer in partial remission" is a synonym for the concept.

* insert SNOMEDCopyrightForVS
* ^extension[FMM].valueInteger = 3
// * SCT#281900007 "No abnormality detected (finding)" // better than SCT#260415000 "Not detected (qualifier)" - FHIR-32837
* SCT#268910001 "Patient's condition improved (finding)"
* SCT#359746009 "Patient's condition stable (finding)"
* SCT#271299001 "Patient's condition worsened (finding)"
* SCT#709137006 "Patient condition undetermined (finding)"
/*
   Retired these, replaced with qualifier values
* SCT#550991000124107 "Malignant neoplasm in full remission (disorder)" // FHIR-32837 - MLT_note: SCT FN is displayed. The initial term of "cancer in complete remission" is a synonym for the concept.
* SCT#551001000124108 "Malignant neoplasm in partial remission (disorder)" // FHIR-32837 - MLT_note: SCT FN is displayed. The initial term of "cancer in partial remission" is a synonym for the concept.
*/
* SCT#103338009 "In full remission (qualifier value)"
* SCT#103337004 "In partial remission (qualifier value)"
/* Added based on FHIR-40811 */
* SCT#399409002 "Distant metastasis present (finding)"
