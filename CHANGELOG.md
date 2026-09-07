# Changelog

All notable changes to the SMART public repository are documented here.

## [1.0.0] - 2026-09-07

### Added
- Public repository structure based on common practices in curated biomedical database projects.
- Exact PubMed search strategy.
- Initial 1,110 PubMed records.
- Screening-exclusion summary.
- SMART data dictionary and curation rules.
- Metabolite synonym mappings.
- HMDB / KEGG / PubChem identifier mappings.
- Related-resource comparison.
- Literature-extraction examples.
- Public release schemas for studies, observations and metabolites.
- Curation guide, data model, methodological considerations, FAQ and release guide.
- Automated repository QC using GitHub Actions.
- Structured GitHub Issue forms for data, identifier and literature updates.
- Pull request template.
- Code and data licensing documentation.

### Current limitation
- The complete observation-level SMART master table was not part of the supplied Supplementary Table 1 and is therefore not fabricated in this repository package. `data/release/` is reserved for the future master release.
