y=rnorm(1000)

plot(y, ylab="y-axis label goes here")

abline(h=mean(y), col="red")

sdabove = mean(y)+sd(y)

sdbelow = mean(y)-sd(y)

abline(h=sdabove, col="orange")

abline(h=sdbelow, col="orange")