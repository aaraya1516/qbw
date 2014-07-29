'''
    I/O Python
'''

gene_file='mm9_sel_chroms_knownGene.txt'
fopen=open(gene_file,'rU').readlines()
len(fopen)
fopen[0]
fopen[1999]
gene_info=loadGeneFile(gene_file)
gene_info.keys()[0:10] 
gene_info[gene_info.keys()[10]] 
chroms=[]
for k in gene_info.keys():
    chr=gene_info[k]['chr']
    if chr not in chroms:
        chroms=chroms+[chr]