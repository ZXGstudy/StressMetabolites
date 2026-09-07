# Release guide

## Stable filenames

Public SMART files use stable filenames rather than embedding release dates into every file.

Recommended filenames:

```text
SMART_observations.csv
SMART_studies.csv
SMART_metabolites.csv
SMART_full_export.csv
```

## Versioning

Version information is managed through:

- `VERSION`
- `CHANGELOG.md`
- Git tags
- GitHub Releases

Recommended semantic versioning:

- `v1.0.0` — first stable public release
- `v1.1.0` — added studies or metadata without breaking the schema
- `v1.1.1` — corrections that do not alter the schema
- `v2.0.0` — major schema or curation-model change

## Release checklist

Before creating a release:

1. update the public data files;
2. run `python scripts/qc_repository.py`;
3. run relevant R QC scripts;
4. update `CHANGELOG.md`;
5. update `VERSION`;
6. verify `CITATION.cff`;
7. create a Git tag;
8. create a GitHub Release;
9. archive the release in a persistent repository if desired.

## Figure reproducibility

Figure outputs should be committed only when:

- the corresponding data input is public;
- the script is included;
- the figure can be regenerated from the released files.
