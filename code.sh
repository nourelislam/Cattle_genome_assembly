##Bowtie2 End to end alignment ##
bowtie2 -x Bowtie2_index/whole_genome.fa -1 ERR174341_1.fastq -2 ERR174341_2.fastq -S ERR174341.sam

##Bowtie2 local alignment ##
bowtie2 --local -x Bowtie2_index/whole_genome.fa -1 ERR174341_1.fastq -2 ERR174341_2.fastq -S ERR174341_local.sam


#GRIDSS
bash gridss.sh ERR174341.sorted.bam -j gridss-2.7.3-gridss-jar-with-dependencies.jar --output ERR174341.vcf -r BWA_idx/GRCh38.p13.genome.fa -a assembly/
#Error cannot allocate memory
