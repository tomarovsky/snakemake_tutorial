#!/bin/bash
# 1. get genes (imagine we have 5000 of them and we get them as the result of some tool)
cp -r Files results/genes

# 2. mafft multiple alignments
mkdir results/mafft
for fna in $(ls results/genes); do 
	mafft results/genes/${fna} > results/mafft/${fna}
done

# 3. Constract phylogenetic tree
mkdir results/iqtree
iqtree -s results/mafft --prefix results/iqtree/species

