# [실습8 해설] 문자열 나누기
#패키지 호출
library(stringr)
library(dplyr)

#문자열 나누기 


#파이프라인 함수 사용 
spl <- sentences %>% 
  head() %>% 
  str_split(" ")

#파이프라인 함수 미사용
spl <- str_split(head(sentences), " ")


spl

# simplify = TRUE 옵션주기


#파이프라인 함수 사용 simplify = TRUE -> 매트릭스 / FALSE -> 리스트
sim <- sentences %>% 
  head() %>% 
  str_split(" ", simplify = TRUE)

#파이프라인 함수 미사용
sim <- str_split(head(sentences), " ",  simplify = TRUE)

sim


