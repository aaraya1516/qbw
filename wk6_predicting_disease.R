mrna.data = getMrnaData()
dim(mrna.data)
head(mrna.data)
patient.data = getPatientData()
dim(patient.data)
head(patient.data)

sd(mrna.data[1,])
all.sds = getAllRowStd(mrna.data)
head(all.sds)

sorted.sds = sort(all.sds,decreasing=T)
head(sorted.sds)