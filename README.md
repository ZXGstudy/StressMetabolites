# SMART
## Stress Metabolite Analysis and Research Tool

**SMART** is a manually curated database that integrates published evidence on metabolite alterations associated with psychological stress across different species, stress models, biological sources, and analytical platforms.

Psychological stress is an important risk factor for a broad range of mental and physical disorders. Metabolic responses to stress have been investigated using diverse experimental models, organisms, tissues, and metabolomic technologies, resulting in a large but highly fragmented body of evidence.

SMART was developed to systematically organize these findings and provide a centralized resource for exploring **stress–metabolite associations across the body**.

---

## Overview

SMART currently contains:

- **1,110 publications screened**
- **545 eligible studies curated**
- **6,175 stress-associated metabolite entries**
- Multiple **species**, including humans, rats, mice, and other experimental models
- Multiple **stress paradigms**
- Multiple **biological sources**, including brain, blood, feces, urine, gastrointestinal tissues, liver, and others
- Multiple **analytical platforms**, including mass spectrometry- and NMR-based metabolomics
- Information on the **direction of metabolite change** under stress

Each curated record is linked to its original publication and annotated using standardized metadata wherever possible.

---

## What information does SMART contain?

SMART integrates information at both the **study level** and the **metabolite-observation level**.

A typical SMART record may contain:

| Category | Information |
|---|---|
| Literature | PMID, publication year, first author, article title |
| Study design | Study type, species, host category |
| Stress exposure | Original stress model, standardized stress model, stress duration/type |
| Metabolite | Original metabolite name, standardized metabolite name |
| Biological source | Original sample type, standardized tissue/source category |
| Analytical method | LC-MS, GC-MS, NMR, CE-MS, targeted assays, or other platforms |
| Regulation | Increased or decreased under stress |
| Comparison | Original comparison groups reported in the study |
| External identifiers | HMDB, KEGG, and PubChem IDs where available |

---

## Basic unit of SMART

The basic unit of SMART is **one metabolite-change observation**, rather than one publication.

A single study may therefore contribute multiple entries when it reports:

- multiple metabolites;
- multiple biological sources;
- multiple stress conditions;
- multiple analytical platforms;
- multiple comparison groups.

This observation-level structure allows SMART to preserve the complexity of the original studies while enabling standardized cross-study exploration.

---

## What can SMART be used for?

SMART can support several types of stress-related metabolomics research.

Users can use SMART to:

- identify metabolites repeatedly associated with psychological stress;
- examine which tissues or biofluids have reported evidence for a given metabolite;
- compare stress-associated metabolic alterations across species;
- investigate similarities and differences among stress models;
- explore the direction of metabolite changes across studies;
- identify candidate metabolites for experimental validation;
- integrate stress-associated metabolites with microbiome, transcriptomic, proteomic, or phenotypic datasets;
- generate hypotheses regarding systemic metabolic responses to stress.

---

## Biological-source distribution

Stress-associated metabolite alterations have been reported across multiple biological sources.

Among the studies currently included in SMART, the largest numbers of reported metabolite alterations originate from:

- **Brain**
- **Blood**
- **Feces**

Additional evidence is available from gastrointestinal tissues, urine, liver, and other biological sources.

These distributions should be interpreted as **literature evidence coverage**, rather than direct measurements of tissue-specific metabolic responsiveness.

---

## Important interpretation

SMART is designed as an **evidence map of stress-associated metabolite changes**.

A larger number of reported metabolites in one tissue or biological source does **not necessarily indicate a stronger biological response to stress**.

The number of recorded metabolites may also be influenced by:

- the number of available studies;
- sample accessibility;
- metabolomic platform;
- analytical sensitivity;
- chromatographic and mass-spectrometric settings;
- metabolite annotation coverage;
- study design;
- statistical thresholds;
- reporting practices.

Similarly, the absence of a metabolite–source association in SMART should be interpreted as:

> **No corresponding stress-associated evidence was identified in the literature curated in the current SMART release.**

It should **not** be interpreted as evidence that the metabolite is biologically absent from that tissue or biofluid.

For further details, see:

`docs/04_methodological_considerations.md`

---

## Metabolite standardization

Different publications may report the same metabolite using different names, abbreviations, spelling conventions, or chemical nomenclature.

SMART therefore applies manual metabolite-name harmonization while retaining the original source-reported terminology.

The standardization process includes, where applicable:

1. normalization of spelling and punctuation;
2. harmonization of capitalization;
3. standardization of D/L notation;
4. synonym matching;
5. conservative lipid-name harmonization;
6. mapping to external identifiers.

Available metabolite mappings are provided in:

```text
metadata/metabolite_synonyms.csv
metadata/metabolite_identifiers.csv
```

External identifiers currently include, where available:

- HMDB
- KEGG
- PubChem

---

## Repository structure

```text
SMART/
│
├── README.md
├── CITATION.cff
├── LICENSE
├── CHANGELOG.md
├── CONTRIBUTING.md
├── VERSION
│
├── data/
│   ├── source/
│   ├── screening/
│   └── release/
│
├── metadata/
│   ├── data_dictionary.csv
│   ├── metabolite_synonyms.csv
│   ├── metabolite_identifiers.csv
│   └── resource_comparison.csv
│
├── docs/
│   ├── 01_database_overview.md
│   ├── 02_curation_guide.md
│   ├── 03_data_model.md
│   ├── 04_methodological_considerations.md
│   ├── 05_database_comparison.md
│   ├── 06_faq.md
│   └── 07_release_guide.md
│
├── scripts/
│   ├── qc_repository.py
│   ├── 01_screening_summary.R
│   ├── 02_synonym_summary.R
│   ├── 03_identifier_format_qc.R
│   └── 04_upset_plot.R
│
├── templates/
│
├── figures/
│
└── .github/
    ├── workflows/
    └── ISSUE_TEMPLATE/
```

---

## Data availability

### Literature search and screening

The repository provides the literature-search and screening records used to construct SMART:

```text
data/screening/pubmed_search_strategy.csv
data/screening/pubmed_records_1110.csv
data/screening/screening_exclusion_summary.csv
```

These files provide traceability from the initial PubMed search to the final curated resource.

### SMART data release

The main SMART data release is organized around the following recommended files:

```text
SMART_observations.csv
SMART_studies.csv
SMART_metabolites.csv
SMART_full_export.csv
```

These files are intended to provide both normalized relational tables and a user-friendly flattened export.

---

## Data dictionary

Detailed definitions of SMART fields and curation rules are available in:

```text
metadata/data_dictionary.csv
```

The data dictionary distinguishes between:

- **source-reported fields**, which are directly extracted from the original publication; and
- **curator-derived fields**, which are standardized during SMART curation.

---

## Curation workflow

The SMART curation workflow can be summarized as:

```text
PubMed literature search
        ↓
Initial literature screening
        ↓
Eligible stress-metabolomics studies
        ↓
Study-level information extraction
        ↓
Metabolite-level observation extraction
        ↓
Metabolite-name harmonization
        ↓
Tissue / stress model / platform standardization
        ↓
External identifier mapping
        ↓
SMART database
```

A detailed description is available in:

```text
docs/02_curation_guide.md
```

---

## Web resource

SMART also provides an interactive web interface that allows users to explore stress-associated metabolite evidence across multiple dimensions, including:

- metabolite;
- species;
- stress model;
- biological source;
- analytical platform;
- direction of change.

The SMART website is intended for interactive exploration, whereas this GitHub repository provides the underlying documentation, metadata, downloadable data, and reproducibility resources.

**SMART website:**  
`[SMART website URL]`

---

## Reproducibility

Scripts used for quality control, summary analyses, and figure generation are provided in:

```text
scripts/
```

These include workflows for:

- screening statistics;
- metabolite synonym summaries;
- identifier quality control;
- cross-source overlap analysis;
- UpSet visualization.

Repository-level quality control can be performed using:

```bash
python scripts/qc_repository.py
```

---

## Versioning

SMART uses stable filenames and versioned releases.

Current release:

```text
v1.0.0
```

Version history is documented in:

```text
CHANGELOG.md
```

Future releases will incorporate newly published studies, curation corrections, metadata improvements, and identifier updates.

---

## Citation

If you use SMART or data distributed through this repository, please cite the accompanying SMART publication.

```text
Zhong et al.
SMART: Stress Metabolite Analysis and Research Tool.
[Journal information / DOI to be added]
```

Machine-readable citation information is available in:

```text
CITATION.cff
```

---

## Contributing

We welcome community feedback regarding:

- missing stress-metabolomics studies;
- metabolite-name corrections;
- external identifier corrections;
- metadata corrections;
- database usability.

Please use the GitHub Issue templates or refer to:

```text
CONTRIBUTING.md
```

All proposed changes should include supporting evidence, preferably from the original publication or an authoritative chemical/metabolite database.

---

## License

Please refer to:

```text
LICENSE
data/LICENSE.md
```

for code and curated-data reuse conditions.

---

## Contact

For questions regarding SMART, data curation, or database updates, please contact the SMART development team or open a GitHub Issue.

---

## Acknowledgement

SMART was developed to provide a centralized, transparent, and reusable resource for understanding how psychological stress is associated with metabolic alterations across different biological systems.

By integrating fragmented metabolomics evidence across studies, tissues, species, and experimental models, SMART aims to facilitate cross-study comparison, hypothesis generation, and future mechanistic research on stress-related metabolic regulation.
