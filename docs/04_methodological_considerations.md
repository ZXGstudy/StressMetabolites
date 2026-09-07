# Methodological considerations

SMART integrates evidence from heterogeneous metabolomics studies. The following points are essential when interpreting the resource.

## Analytical-platform heterogeneity

LC-MS, GC-MS, NMR, CE-MS, targeted assays, and other platforms differ in sensitivity, chemical coverage, ionization behavior, chromatographic separation, annotation depth, and reporting thresholds. Even studies using the same broad platform category can differ in instrument configuration and acquisition settings.

Therefore, a metabolite reported more frequently in one group of studies is not necessarily biologically more stress-responsive.

## Unequal evidence across biological sources

Different tissues and biofluids have been studied at different frequencies. Literature volume, sample accessibility, cohort design, model organism, and platform choice all influence the number of reported metabolites.

SMART should therefore be used primarily to answer:

> Which metabolites have been reported to change under stress, and in which biological sources has that evidence been observed?

It should not be used to infer tissue-level abundance or rank tissues solely by the number of recorded metabolites.

## “Not reported” is not “absent”

If a metabolite–source association is not present in SMART, the correct interpretation is that no corresponding stress-associated evidence was identified in the curated literature included in the current release. It does not demonstrate that the metabolite is absent from the tissue or biofluid.

## Direction of change

Regulation is retained according to the comparison reported in the original study. Users should check the original comparison groups before combining directions across studies.

## Metabolite-name standardization

SMART harmonizes synonyms to reduce duplicate metabolite names while preserving source-level terminology. Lipid names are standardized only to the resolution supported by the original report. Over-normalization that would imply unsupported structural resolution is avoided.

## External identifiers

External identifiers are included where a mapping was available. Derived ratios, composite measures, incompletely resolved features, and ambiguous metabolite names may not have a direct chemical-database identifier.

Identifier values in this repository are preserved from the supplied curation table rather than silently rewritten. Users performing identifier-sensitive analyses should independently verify the relevant subset against the current external database release.

## Version awareness

SMART is literature-curated and should be treated as a versioned evidence resource. New studies, corrected mappings, and harmonization updates can change future releases.
