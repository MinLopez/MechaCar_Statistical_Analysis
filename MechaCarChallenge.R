##########Deliverable 1##########

#step 3 import dplyr
library(dplyr)

#step 4 introduce data
MechaCar_mpg <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)

#set up matrix of data
mc_matrix <- as.matrix(MechaCar_mpg[,c("vehicle_length", "vehicle_weight", "spoiler_angle", "ground_clearance", "AWD", "mpg")])

#pass through correlation
cor(mc_matrix)

#step 5 linear model vehicle length mpg using multiple
lm(vehicle_length ~ vehicle_weight + spoiler_angle + ground_clearance + AWD + mpg, data=MechaCar_mpg)

#step 6 generate summary
summary(lm(vehicle_length ~ vehicle_weight + spoiler_angle + ground_clearance + AWD + mpg, data=MechaCar_mpg))




##########Deliverable 2##########
#step 2 introduce data
Suspension_Coil <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)


#step 3 use summarize by total summary dataframe
total_summary <- Suspension_Coil %>%  summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI),.groups = 'keep')

#step 4 Lot summary
lot_summary <- Suspension_Coil %>% group_by(Manufacturing_Lot) %>%  summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI),.groups = 'keep')



##########Deliverable 3##########
#step 1 t.test() for PSI across all lots
t.test(Suspension_Coil$PSI,mu=mean(Suspension_Coil$PSI))
#step 2 do 3 more
#Lot 1
t.test(subset(Suspension_Coil$PSI, Suspension_Coil$Manufacturing_Lot == "Lot1"),mu=mean(Suspension_Coil$PSI)) 
#Lot 2
t.test(subset(Suspension_Coil$PSI, Suspension_Coil$Manufacturing_Lot == "Lot2"),mu=mean(Suspension_Coil$PSI)) 
#Lot 3
t.test(subset(Suspension_Coil$PSI, Suspension_Coil$Manufacturing_Lot == "Lot3"),mu=mean(Suspension_Coil$PSI)) 
