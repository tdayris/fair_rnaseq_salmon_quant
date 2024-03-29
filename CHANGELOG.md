# 1.0.3

* Documentation fixes
* Sample schema update, downstream_file is now required

# 1.0.2

* Use `lookup` and `branch` instead of hand made functions
* Pipeline can be used through mamba + apptainer
* fair_fastqc_multiqc_pipeline version 2.0.4
* fair_genome_indexer version 3.1.4
* snakemake wrappers v3.3.6

# 1.0.1

## Features

* Salmon quant merge now annotates transcripts as well as genes
* DataVzrd to explore quantification if needed

## Fix

* Missing fastp report page

# 1.0.0

## Features

* Control/Clean fastq files
* Estimate quantification
* Build report (snakemake + datavzrd)
* Build a single table with all counts from all samples
* Snakemake-wrappers v3.3.3
* Snakemake v8+ compatible
* fair_genome_indexer v3.0.0
