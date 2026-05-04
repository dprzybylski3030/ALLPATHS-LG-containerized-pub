# ALLPATHS-LG (Containerized)

ALLPATHS-LG is a whole-genome shotgun assembler developed by the Computational
Research and Development Group at the Broad Institute of MIT and Harvard. It
produces high-quality genome assemblies from short Illumina reads (~100 bp) and
represents assemblies as graphs rather than linear sequences, preserving
ambiguities from polymorphism, uncorrected errors, and repeats.

This repository packages ALLPATHS-LG revision 52488 as a Docker image to avoid
the original build-environment constraints (gcc-4.7, Ubuntu 16.04).

## Requirements

**Input data:**
- Minimum 2 paired-end libraries: one short-insert (~180 bp for 100 bp reads)
  and one long-insert (~3000 bp)
- ~100x raw read coverage (before error correction)
- Reads must not contain non-genomic portions (stuffers etc.)

**Host machine (for running the container):**
- Docker
- At least 32 GB RAM for small genomes; 512 GB for mammalian-sized genomes

## Building the image

```bash
docker build -t allpathslg .
```

## Running

```bash
docker run --rm -it \
  -v /path/to/your/data:/allpathslg \
  allpathslg
```

The working directory inside the container is `/allpathslg`. Mount your data
there and run the pipeline from a shell:

```bash
RunAllPathsLG \
  PRE=/allpathslg \
  DATA=<data_dir> \
  RUN=<run_dir> \
  SUBDIR=<assembly_dir>
```

## Documentation

The full manual is available at [docs/AllPaths-LG_Manual.pdf](docs/AllPaths-LG_Manual.pdf).

## Test data

A small dataset for testing is available directly from the Broad Institute
```bash
ftp ftp://ftp.broadinstitute.org/distribution/crd/ALLPATHS/Release-LG/test.genome.tar.gz
```


## Citation

If you use ALLPATHS-LG in your work, please cite:

Gnerre S, MacCallum I, <u>Przybylski D</u>, Ribeiro FJ, Burton JN, Walker BJ,
Sharpe T, Hall G, Shea TP, Sykes S, Berlin AM, Aird D, Costello M, Daza R,
Williams L, Nicol R, Gnirke A, Nusbaum C, Lander ES, Jaffe DB.
**High-quality draft assemblies of mammalian genomes from massively parallel
sequence data.**
*Proc Natl Acad Sci USA.* 2011;108(4):1513–1518.
https://doi.org/10.1073/pnas.1017351108

## License

See [LICENSE](LICENSE).
