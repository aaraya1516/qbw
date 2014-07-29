nsim = 1000

samplesize = 50

wildtype.mean = 300

wildtype.sd = 25

wildtype = sim(nsim, samplesize, wildtype.mean, wildtype.sd)

wildtype.col.means = colMeans(wildtype$yvals)

mutant = rnorm(samplesize, mean=290, sd=wildtype.sd)

print(mean(mutant) < 300)

print(t.test(mutant, mu=300, alternative="greater")$p.value)

print(count(wildtype.col.means, 0, mean(mutant))/nsim)