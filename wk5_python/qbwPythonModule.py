'''
Course module for the MIT Quantitative Biology Workshop

'''

__author__='Sara JC Gosline'
__email__='sgosline@mit.edu'

##package imports enable the parsing of different types of files
import csv
import zipfile
from zipfile import ZipFile 

def loadFasta(filename):
    '''
    Takes zipped FASTA-formatted file and reads into dictionary of strings. This is Woanders' modified function, vastly improving load times for Windows users.
    '''
    seqdict={}
    lcount=0

    if zipfile.is_zipfile(filename):
        zf=ZipFile(filename,'r')
        fn=zf.namelist()[0]
        lines=zf.open(fn)
    else:
        lines=open(filename,'rU')
    curr_header,curr_seq='',[] #initialize blank string & empty list
    for row in lines:
        lcount+=1
        if lcount % 10000==0:
            print 'Parsed line '+str(lcount)
        if row.startswith('>'):
            if curr_header!='': #this means it's not the first
                seqdict[curr_header]=''.join(curr_seq) #add sequence
                curr_seq=[]
                import gc
                gc.collect() #request that memory be freed
            curr_header=row[1:].strip()
        else:
            curr_seq.append(row.strip())
    print 'Found '+str(len(seqdict))+' sequences in FASTA file'
    lines.close()
    return seqdict



def loadGeneFile(filename,getCoding=False):
    '''
    Takes tab-delimited gene table from UCSC genome browser 
    and loads gene locations
    '''
    genedict={}
    chroms=set()
    fields=['name','chrom','strand','txStart','txEnd','cdsStart','cdsEnd','exonCount','exonStarts','exonEnds','proteinID','alignID']
    reader=csv.DictReader(open(filename,'rU'),fieldnames=fields,delimiter='\t')
    for line in reader:
        if getCoding:
            start=int(line['cdsStart'])
            end=int(line['cdsEnd'])
        else:
            start=int(line['txStart'])
            end=int(line['txEnd'])
        genedict[line['name']]={'chr':line['chrom'],'start':start,'end':end,'strand':line['strand']}
        chroms.add(line['chrom'])
    print 'Parsed info for '+str(len(genedict))+' genes on '+str(len(chroms))+' chromosomes'
    return genedict
    

def getTssOnChroms(gene_info,chrom):
    starts={}
    for g in gene_info.keys():
        if gene_info[g]['chr']==chrom:    
            if gene_info[g]['strand']=='+':
                starts[g]=gene_info[g]['start']
            else:
                starts[g]=gene_info[g]['end']
    return starts
    