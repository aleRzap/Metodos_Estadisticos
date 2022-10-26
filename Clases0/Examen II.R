# 26/10/2022
# Examen II



data("InsectSprays")
head(InsectSprays)


boxplot(InsectSprays$count ~ InsectSprays$spray,
        xlab = "Tipo de Insecticida",
        ylab = "Conteo",
        col = "Gold")

tapply(InsectSprays$count, InsectSprays$spray, mean)

tapply(InsectSprays$count, InsectSprays$spray, median)

tapply(InsectSprays$count, InsectSprays$spray, sd)

tapply(InsectSprays$count, InsectSprays$spray, var)

tapply(InsectSprays$count, InsectSprays$spray, length)


par.aov <- aov(InsectSprays$count ~ InsectSprays$spray)
summary(par.aov)


TukeyHSD(par.aov)

















