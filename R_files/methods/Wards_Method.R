# Practice with Ward's Method

# If we merge the two clusters, Ci and Cj, what is the distance between the newly formed cluster (Ci + Cj) and
# a third distict cluster Ck?

# This is Ward's answer: 
# d((Ci + Cj), Ck) = 
# (Ni + Nk) / (Ni + Nj + Nk) * d(Ci, Ck) 
# +  (Nj + Nk) / (Ni + Nj + Nk) * d(Cj, Ck)
# - (Nk / Ni + Nj + Nk) * d (Ci, Cj)


# We thus calculate the distance between a new cluster containing Od_13-16 and Od_17-20 and other files.
D_CiCk <- 44.07
D_CjCk <- 46.49
D_CiCj <- 43.82

Ni <- 1
Nj <- 1
Nk <- 1

Step_1 <- 2/3 * D_CiCk 
Step_2 <- 2/3 * D_CjCk
Step_3 <- 1/3 * D_CiCj

result2 <- Step_1 + Step_2 - Step_3
