# SMART
## A Stress Metabolite Analysis and Research Tool

**SMART** is a manually curated database that integrates published evidence on metabolite alterations associated with psychological stress across different host species, stress models, biological sources, and analytical platforms.

Psychological stress is an important risk factor for a broad range of mental and physical disorders. Metabolic responses to stress have been investigated using diverse experimental models, organisms, tissues, and metabolomic technologies, resulting in a large but highly fragmented body of evidence.

SMART was developed to systematically organize these findings and provide a centralized resource for exploring **stress–metabolite associations**.

---

## Web resource

SMART also provides an interactive web interface that allows users to explore stress-associated metabolite evidence across multiple dimensions, including:

- metabolite;
- species;
- stress model;
- biological source;
- analytical platform;
- direction of change.

The SMART website is intended for interactive exploration, whereas this GitHub repository provides the underlying documentation, metadata, and reproducibility resources.

**SMART website:**  
`https://db.hscmdb.com/`

---

## Overview

SMART currently contains:

- **1,110 publications screened**
- **545 eligible studies curated**
- **6,175 stress-associated metabolite entries**
- Multiple **host species**, including humans, rats, mice, and other experimental models
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
| Literature | PMID, publication year, article title |
| Study design | Study type, species, host category |
| Stress exposure | Original stress model, standardized stress model, stress duration/type |
| Metabolite | Original metabolite name, standardized metabolite name |
| Biological source | Original sample type, standardized tissue/source category |
| Analytical method | LC-MS, GC-MS, NMR, or other platforms |
| Regulation | Up or Down under stress |
| Comparison | Original comparison groups reported in the study |

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
- examine literature evidence for a given metabolite;
- compare stress-associated metabolic alterations across species;
- identify candidate metabolites for experimental validation;
- generate hypotheses regarding systemic metabolic responses to stress.

---


## Repository structure

```text
SMART/
│
├── README.md
├── LICENSE
├── CHANGELOG.md
├── CONTRIBUTING.md
├── VERSION
│
├── data/
│   ├── 01_pubmed_search_strategy.csv
│   ├── 02_pubmed_records_1110.csv
│   └── 03_screening_exclusion_summary.csv
│
├── metadata/
│   ├── 01_Data_dictionary.xlsx
│   ├── 02_Data_template.xlsx
│   ├── 03_Metabolite_identifiers.csv
│   └── 04_Metabolite_synonyms.csv
│
├── scripts/
│   ├── plot bar chart.R
│   ├── plot heatmap.R
│   ├── plot pie chart.R
│   ├── plot sankey.R
│   ├── plot two-side bar chart.R
│   ├── plot upset graph.R
│   ├── plot volcano_host.R
│   └──plot volcano_sample source.R
│
└── Figure_abstract.jpg

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

---

## Contact

For questions regarding SMART, data curation, or database updates, please contact the SMART development team or open a GitHub Issue.

---

## Acknowledgement

SMART was developed to provide a centralized, transparent, and reusable resource for understanding how psychological stress is associated with metabolic alterations across different biological systems.

By integrating fragmented metabolomics evidence across studies, tissues, species, and experimental models, SMART aims to facilitate cross-study comparison, hypothesis generation, and future mechanistic research on stress-related metabolic regulation.
