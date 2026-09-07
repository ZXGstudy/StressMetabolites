# Contributing to SMART

SMART is a curated scientific resource. Contributions should prioritize traceability, conservative standardization, and reproducibility.

## Accepted contribution types

- correction of a curated value;
- metabolite synonym correction;
- external identifier correction;
- candidate new study;
- documentation improvement;
- QC or analysis-script improvement.

## Data-correction requirements

Please provide:

1. affected PMID, Study_ID, Entry_ID, or metabolite name;
2. current value;
3. proposed value;
4. primary supporting evidence.

## Curation principles

- preserve source-reported values;
- keep source-reported and curator-derived fields distinct;
- do not infer structural or biological detail beyond what the source supports;
- do not interpret missing literature evidence as biological absence;
- document accepted changes in the changelog.

## Pull requests

Before submitting a pull request, run:

```bash
python scripts/qc_repository.py
```

A GitHub Actions workflow will run the same core QC automatically.
