nsamples = 100

samplesize = 25

datasets = sim(nsamples, samplesize)

col.means = colMeans(datasets$yvals)

col.sems = sem(datasets$yvals)

points(1:nsamples, col.means, pch="x")

col.lowers = col.means-2*col.sems
col.uppers = col.means+2*col.sems
colors = errorbarcolors(col.uppers, col.lowers)
errorbars(col.uppers, col.lowers, col=colors)
abline(h=0, col="red")
print(count(0, col.lowers, col.uppers)/nsamples)
