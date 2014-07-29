x=rnorm(100)

y1 = x

y2 = x + rnorm(100)

y3 = rnorm(100)

par(mfcol=c(3,1))

plot(x, y1, main=cor(x,y1))

plot(x, y2, main=cor(x,y2))

plot(x, y3, main=cor(x,y3))

life.vector=rep(0,ncol(mrna.data))

life.vector[which(patient.data[,2]=='Alive')] = 1

head(life.vector)

cor(sorted.matrix[1,],life.vector)

all.cors = matrixToVectorSqCor(sorted.matrix,life.vector)

head(all.cors)

cor.matrix = sorted.matrix[order(all.cors,decreasing=T),]

surv = subset(patient.data,select='Death.status')

surv

pheatmap(cor.matrix[1:50,],annotation=surv,fontsize=8,cellheight=9,scale='row')