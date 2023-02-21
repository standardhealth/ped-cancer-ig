RuleSet: ExtensionContext(path)
* ^context[+].type = #element
* ^context[=].expression = "{path}"

// Probably not needed since the disease phase and course number can be determined from time stamps on resources
RuleSet: CourseAndDiseasePhase
* extension contains DiseasePhaseNumber named diseasePhaseNumber 0..1 MS
* extension contains CourseNumber named courseNumber 0..1 MS

RuleSet: NotUsed(path)
* {path} ^short = "Not used in this profile"
* {path} ^definition = "Not used in this profile"

RuleSet: SNOMEDCopyrightForVS
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement"
* ^experimental = false