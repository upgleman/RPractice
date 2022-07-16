# [실습3 해설] 비행기의 나이에 따른 지연 시간 차이
##패키지 호출
library(dplyr)
install.packages("nycflights13")
library(nycflights13)

#1) 비행기별 나이 계산
View(planes)
plane_ages <- planes %>%
  mutate(age = 2022- year) %>%
  select(tailnum, age)

plane_ages

summary(plane_ages)



#2) 비행기별 나이와 지연시간 관계 

summary(flights)

age_delay <- flights %>%
  inner_join(plane_ages, by= "tailnum" ) %>%
  group_by(age) %>%
  filter(!is.na(dep_delay)) %>%
  summarise(delay = mean(dep_delay))

age_delay




#3) 시각화

#이 사이에 코드를 넣어주세요
plot(age_delay, type = "l")
# "l" 선그래프
# "p" 점그래프

