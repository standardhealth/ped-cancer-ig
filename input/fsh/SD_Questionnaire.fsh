Profile: ResearchStudyQuestionnaire
Parent: Questionnaire
Id: pedcan-research-study-Questionnaire
Description: "Questionnaire with linkage to a research study"
* extension contains ResearchStudyReference named researchStudy 0..1 MS

Extension: ResearchStudyReference
Id: pedcan-research-study-reference
Title:  "Research Study Reference"
Description: "Reference to the research study associated with this resource."
* value[x] only Reference(ResearchStudy)
* value[x] 1..1

