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

RuleSet: ObservationComponentSlicingRules
* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component ^slicing.description = "Slice based on the component.code pattern"

RuleSet: SimpleArraySlicingRules(path)
* {path} ^slicing.discriminator.type = #pattern
* {path} ^slicing.discriminator.path = "$this"
* {path} ^slicing.rules = #open
* {path} ^slicing.description = "Slice based on the element's value"

RuleSet: DefineIntegerComponent(sliceName, code, short, definition)
* component[{sliceName}].code = {code}
* component[{sliceName}].value[x] only integer
* component[{sliceName}] ^short = {short}
* component[{sliceName}] ^definition = {definition}


RuleSet: DefineCodeableComponent(sliceName, code, valueSet, short, definition)
* component[{sliceName}].code = {code}
* component[{sliceName}].value[x] only CodeableConcept
* component[{sliceName}].value[x] from {valueSet}
* component[{sliceName}] ^short = {short}
* component[{sliceName}] ^definition = {definition}

