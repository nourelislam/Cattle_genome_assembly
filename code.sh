##Bowtie2 End to end alignment ##
bowtie2 -x Bowtie2_index/whole_genome.fa -1 ERR174341_1.fastq -2 ERR174341_2.fastq -S ERR174341.sam

##Bowtie2 local alignment ##
bowtie2 --local -x Bowtie2_index/whole_genome.fa -1 ERR174341_1.fastq -2 ERR174341_2.fastq -S ERR174341_local.sam
samtools view -hbo ERR174341_local.bam ERR174341_local.sam
samtools sort ERR174341_local.bam -o ERR174341_local.sorted.bam
samtools index -b ERR174341_local.sorted.bam

##BWA alignment ##
bwa mem BWA_idx/GRCh38.p13.genome.fa ERR174341_1.fastq ERR174341_2.fastq > ERR174341_bwa.sam 

#GRIDSS
bash gridss.sh ERR174341.sorted.bam -j gridss-2.7.3-gridss-jar-with-dependencies.jar --output ERR174341.vcf -r BWA_idx/GRCh38.p13.genome.fa -a assembly/
#Error cannot allocate memory

##Manta
~/anaconda3/envs/ngs/share/manta-1.6.0-0/bin/configManta.py --bam ERR174341_local.sorted.bam --referenceFasta BWA_idx/GRCh38.p13.genome.fa --runDir data/
#Error Reference genome mismatch: Normal BAM/CRAM file is missing a chromosome found in the reference fasta file: 'ML143366.1'
