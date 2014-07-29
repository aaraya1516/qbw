fly.means = c(mean(lowtemp), mean(hightemp))
fly.sems = c(sem(lowtemp), sem(hightemp))
fly.lower = fly.means-2*fly.sems
fly.upper = fly.means+2*fly.sems
plot(c(1,2), fly.means)
errorbars(fly.lower, fly.upper)
plot(c(1,2), fly.means, ylim=c(0.9,1.2))
errorbars(fly.lower, fly.upper)