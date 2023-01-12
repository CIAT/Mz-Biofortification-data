baby <- read.csv('~/Alliance/Job/App/data/AR_TZ_BabyTrials_20092021.csv')

with(baby, plot (Lat, Long))

p <- which(baby$Lat> -3.8)

p2 <- which(baby$Lat <  -6.5)

p2

p3 <- which(baby$Long <  36 & baby$Lat < -6)

p3

with(baby[p,], points (Lat, Long, col = "red"))

with(baby[p2,], points (Lat, Long, col = "blue"))

with(baby[p3,], points (Lat, Long, col = "green"))

baby <-  baby[-c(p, p2, p3),]

write.csv(baby, file = "~/Alliance/Job/App/data/Cleaned_AR_TZ_BabyTrials_20092021.csv", row.names = FALSE)


baby <- read.csv('~/Alliance/Job/App/data/Cleaned_AR_TZ_BabyTrials_20092021.csv')

with(baby, plot (Lat, Long))

p <- which(baby$Lat> -3.8)

p2 <- which(baby$Lat <  -6.5)

p2

p3 <- which(baby$Long <  36 & baby$Lat < -6)

p3

with(baby[p,], points (Lat, Long, col = "red"))

with(baby[p2,], points (Lat, Long, col = "blue"))

with(baby[p3,], points (Lat, Long, col = "green"))

baby <-  baby[-c(p, p2, p3),]
