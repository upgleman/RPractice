# [실습1 해설] 키(Key)

##패키지 호출
library(dplyr); 
install.packages("nycflights13")
library(nycflights13)

#기본키 
head(planes)

basic <- planes %>%
  count(tailnum) %>%
  filter(n > 1)
# 결과를 통해서 1개만 존재하는 것을 확인가능
print(basic)

#기본키가 없는 경우 -비행기 인지 알 수 없음

flights %>% 
  count(year, month, day, flight) %>% 
  filter(n > 1)

#기본키값인 경우 알수 있음음
no_basic <- flights %>% 
  count(year, month, day, tailnum) %>% 
  filter(n > 1)


no_basic
