Profile: DiseasePhaseTiming
Parent: Basic
Description: "The phase of the cancer treatment process during which relevant observations were recorded. This variable is used across domains to frame the timing of these longitudinal observations and reduce the number of redundant variables needed to report similar concepts."
* subject only Reference(Patient or ResearchSubject)  // which?
* code = NCIT#C168878  // or SCT#278174000 "Disease phase (attribute)"
* extension contains DiseasePhase named diseasePhase 1..1 MS
* extension contains DiseasePhaseNumber named diseasePhaseNumber 1..1 MS
* extension contains DiseasePhaseStartDate named startDate 0..1 MS
* extension contains DiseasePhaseEndDate named endDate 0..1 MS

Extension: DiseasePhase
Id: os-disease-phase
Title:  "Disease Phase"
Description: "This variable indicates the ordinal numbering of the Disease Phase variable within its various subgroups (e.g., Relapse 1, Relapse 2, Relapse 3, etc.). The observations across domains can therefore be organized longitudinally without the need for specific dates."
//* . ^code = NCIT#C168878  // the meaning of the extension (but TBD must distinguish from the code of DiseasePhaseTiming)
// Above generates IGPub error: Rule sdf-9: 'In any snapshot or differential, no label, code or requirements on an element without a "." in the path (e.g. the first element)' Failed
* value[x] only CodeableConcept
* value[x] from DiseasePhaseVS (required)
* value[x] 1..1

Extension: DiseasePhaseNumber
Id: os-disease-phase-number
Title:  "Disease Phase Number"
Description: "This variable indicates the ordinal numbering of the Disease Phase variable within its various subgroups (e.g., Relapse 1, Relapse 2, Relapse 3, etc.). The observations across domains can therefore be organized longitudinally without the need for specific dates."
//* . ^code = NCIT#C173258
* value[x] only unsignedInt
* value[x] 1..1

Extension: DiseasePhaseStartDate
Id: os-disease-phase-start-date
Title:  "Disease Phase Start Date"
Description: "The date when this disease phase was started."
* value[x] only date
* value[x] 1..1

Extension: DiseasePhaseEndDate
Id: os-disease-phase-end-date
Title:  "End Date"
Description: "The date when this ordinally numbered DiseasePhase was ended."
* value[x] only date
* value[x] 1..1

ValueSet: DiseasePhaseVS
Id: os-disease-phase-vs
Title: "Disease Phase Value Set"
Description: "Value set for phases of disease."
* insert SNOMEDCopyrightForVS
* SCT#255251009 "Acute phase (qualifier value)"  // substitute for "initial" ?
* SCT#263855007 "Relapse phase (qualifier value)"
* include codes from system SCT where concept is-a SCT#277022003 "Remission phase (qualifier value)"
// missing initial and progressing. Do we also need stable?



