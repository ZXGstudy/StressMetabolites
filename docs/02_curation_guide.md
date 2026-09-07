# Curation guide

## 1. Literature discovery

The literature search is performed in PubMed using a stress-focused query combined with metabolite-related terms.

The exact search components are distributed in:

`data/screening/pubmed_search_strategy.csv`

The 1,110 initially retrieved records are distributed in:

`data/screening/pubmed_records_1110.csv`

## 2. Screening

Retrieved studies are screened for relevance to stress-associated metabolite changes.

Summarized exclusion reasons are available in:

`data/screening/screening_exclusion_summary.csv`

## 3. Basic curation unit

The basic unit of SMART is one metabolite-change observation.

One publication may therefore generate multiple SMART entries when it reports multiple:

- metabolites;
- tissues or biofluids;
- stress conditions;
- platforms;
- comparison groups.

## 4. Source-reported and curator-derived fields

SMART separates source-reported information from curator-derived standardized annotations.

### Source-reported fields

Examples include:

- PMID;
- first author;
- publication year;
- article title;
- original stress model;
- original metabolite name;
- original sample type;
- analytical platform;
- regulation;
- original comparison groups.

### Curator-derived fields

Examples include:

- Entry_ID;
- Study_ID;
- host category;
- standardized stress model;
- stress type;
- standardized metabolite name;
- tissue category;
- standardized analytical-platform category.

The detailed rules are provided in `metadata/data_dictionary.csv`.

## 5. Metabolite harmonization

Metabolite names are standardized conservatively.

The workflow may include:

1. removal of unnecessary whitespace;
2. punctuation normalization;
3. capitalization normalization;
4. normalization of D/L notation where supported;
5. synonym matching;
6. conservative lipid naming at the structural resolution reported by the source.

The source-reported metabolite name is retained whenever possible.

Synonym mappings are available in:

`metadata/metabolite_synonyms.csv`

## 6. External identifiers

Where an unambiguous match is available, standardized metabolite names are mapped to:

- HMDB;
- KEGG;
- PubChem.

Mappings are distributed in:

`metadata/metabolite_identifiers.csv`

Derived ratios, composite features, incompletely resolved features, and ambiguous names may not have a direct external identifier.

## 7. Corrections and future curation

Data corrections and candidate new studies should be submitted through the structured GitHub Issue forms.

Changes accepted into SMART should be documented in `CHANGELOG.md` and included in a new tagged release.
