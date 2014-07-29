sorted.order = order(all.sds,decreasing=T)
sorted.matrix=mrna.data[sorted.order,]
m = matrix(c(1,2,3,4,5,6),nrow=2)
m

pheatmap(m)
m = matrix(seq(1,25),nrow=5)
m

pheatmap(m)

pheatmap(sorted.matrix[1:10,],scale='row')
ts=subset(patient.data,select='Tumor.subtype')
pheatmap(sorted.matrix[1:10,],annotation=ts,scale='row')