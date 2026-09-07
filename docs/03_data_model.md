# SMART data model

SMART is designed around three core entities.

## 1. Studies

One row represents one included publication.

Recommended key:

`Study_ID`

Recommended fields include:

- PMID
- DOI
- first author
- publication year
- article title
- study type
- host
- host species

Recommended public file:

`data/release/SMART_studies.csv`

## 2. Observations

One row represents one stress-associated metabolite-change observation.

Recommended key:

`Entry_ID`

Recommended fields include:

- Entry_ID
- Study_ID
- PMID
- original stress model
- standardized stress model
- stress type
- original metabolite name
- standardized metabolite name
- original sample type
- tissue category
- analytical-platform category
- regulation
- statistical-significance category
- original comparison groups
- HMDB ID
- KEGG ID
- PubChem CID

Recommended public file:

`data/release/SMART_observations.csv`

## 3. Metabolites

One row represents one standardized metabolite.

Recommended key:

`Metabolite_ID`

Recommended fields include:

- Metabolite_ID
- standardized metabolite name
- HMDB ID
- KEGG ID
- PubChem CID

Recommended public file:

`data/release/SMART_metabolites.csv`

## Flat export

For users who do not want to join normalized tables, SMART should also provide:

`data/release/SMART_full_export.csv`

## Relationship model

```text
SMART_studies
     |
   Study_ID
     |
SMART_observations ---- Metabolite_standardized ---- SMART_metabolites
     |
     +---- tissue / stress model / platform / direction / comparison
```

The detailed field-level data dictionary is available in:

`metadata/data_dictionary.csv`
