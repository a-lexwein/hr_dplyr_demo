library(dplyr) # call to use dplyr
starwars

add <- function(a,b) {
  sum <- a+b
  return(a+b)
}

add(1,2)
add(add(1,2),3)

## val1 %>% fun(val2) ==> fun(val1,val2)

add(1, 2)
1 %>% add(2)
add(add(1, 2), 3)
1 %>% add(2) %>% add(3)


1 %>%
  add(2) %>%
  add(3)

starwars %>%
  mutate(bmi = mass/((height/100)^2)) %>%
  select(name, species, bmi) %>%
  filter(species != 'Droid') %>%
  filter(!is.na(bmi)) %>%
  arrange(desc(bmi)) %>%
  summarise(avg_bmi = mean(bmi), observations = n())

step1 <- mutate(starwars, bmi = mass/((height/100)^2))
step2 <-select(step1, name, species, bmi)
step3 <-filter(step2, species != 'Droid')
step4 <- filter(step3, !is.na(bmi))
step5 <- arrange(step4, desc(bmi))
step6 <- summarise(step5, avg_bmi = mean(bmi), observations = n())
step6

summarise(arrange(filter(filter(select(mutate(starwars,
  bmi = mass/((height/100)^2)), name, species, bmi),
  species != 'Droid'),!is.na(bmi)), desc(bmi)),
  avg_bmi = mean(bmi), observations = n())

