# [미션1 해설] 기상 조건에 따른 지연 시간 시각화
##패키지 호출
install.packages("nycflights13")
library(nycflights13)
library(dplyr)


#1) flights, weather 데이터 병합**

flight_weather <- inner_join(flights, weather, by = c("origin", "year","month","day", "hour"))



#2) 날씨별 지연시간 계산
# precip : 강수를 나타내는 변수
delay_time <- flight_weather %>%
  group_by(precip) %>%
  summarise(delay = mean(dep_delay, na.rm = TRUE))

head(delay_time)

#3) 날씨별 지연시간 시각화
#이 사이에 코드를 넣어주세요

plot(delay_time, type = "l")

