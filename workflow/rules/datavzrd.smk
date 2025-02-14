rule fair_rnaseq_salmon_quant_datavzrd_salmon_yaml:
    input:
        table="results/{species}.{build}.{release}/Quantification/{counts}.{targets}.tsv",
    output:
        yaml=temp(
            "tmp/fair_rnaseq_salmon_quant_datavzrd_salmon_yaml/{species}.{build}.{release}/salmon/{counts}.{targets}.yaml"
        ),
    threads: 1
    resources:
        mem_mb=lambda wildcards, attempt: attempt * 1024,
        runtime=lambda wildcards, attempt: attempt * 5,
        tmpdir=tmp,
    log:
        "logs/fair_rnaseq_salmon_quant_datavzrd_salmon_yaml/{species}.{build}.{release}/salmon/{counts}.{targets}.config.log",
    benchmark:
        "benchmark/fair_rnaseq_salmon_quant_datavzrd_salmon_yaml/{species}.{build}.{release}/salmon/{counts}.{targets}.config.tsv"
    conda:
        "../envs/python.yaml"
    script:
        "../scripts/fair_rnaseq_salmon_quant_build_datavzrd_yaml.py"


rule fair_rnaseq_salmon_quant_datavzrd_salmon_render:
    input:
        config="tmp/fair_rnaseq_salmon_quant_datavzrd_salmon_yaml/{species}.{build}.{release}/salmon/{counts}.{targets}.yaml",
        table="results/{species}.{build}.{release}/Quantification/{counts}.{targets}.tsv",
    output:
        report(
            directory(
                "results/{species}.{build}.{release}/Quantification/html_reports/{counts}.{targets}"
            ),
            htmlindex="index.html",
            caption="../report/datavzrd_salmon.rst",
            category="Quantification",
            labels={
                "species": "{species}.{build}.{release}",
                "counts": "{counts}",
                "targets": "{targets}",
            },
        ),
    threads: 1
    resources:
        mem_mb=lambda wildcards, attempt: attempt * 1024,
        runtime=lambda wildcards, attempt: attempt * 5,
        tmpdir=tmp,
    log:
        "logs/fair_rnaseq_salmon_quant_datavzrd_salmon_render/{species}.{build}.{release}/salmon/{counts}.{targets}.render.log",
    benchmark:
        "benchmark/fair_rnaseq_salmon_quant_datavzrd_salmon_render/{species}.{build}.{release}/salmon/{counts}.{targets}.render.tsv"
    params:
        extra=lookup_config(
            dpath="params/fair_rnaseq_salmon_quant_datavzrd_salmon_render", default=""
        ),
    wrapper:
        f"{snakemake_wrappers_prefix}/utils/datavzrd"
