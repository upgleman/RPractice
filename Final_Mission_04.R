#문제4. 월별 비행기 지연시간 시각화
#패키지 호출
library(stringr)
library(dplyr)
library(nycflights13)


#1) flights, planes 데이터 병합
flight_planes <- inner_join(flights, planes, by = "tailnum")
head(flight_planes)

#2) 월별 지연시간 계산
month_delay <- flight_planes %>%
  group_by(month) %>%
  summarise(delay = mean(dep_delay, na.rm=TRUE))

month_delay <-month_delay %>%
  select(month, delay)
head(month_delay)
#3) 월별 지연시간 시각화
#이 사이에 코드를 넣어주세요

plot(month_delay, type ="l")
