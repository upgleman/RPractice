# [실습3 해설] 특정 위치의 문자열 추출
##패키지 호출
library(stringr)
library(dplyr)

##문자열 특정 부분 추출
# 문자열의 1~3 번째 문자 추출


#파이프라인 함수 사용
sen1 <- sentences %>% 
  head() %>% str_sub(1,3)

#파이프라인 함수 미사용
sen1 <-str_sub(head(sentences), 1,3)

print(sen1)


#문자열 뒤에서 1~3번째 문자 추출


#파이프라인 함수 사용
sen2 <-sentences %>% 
  head() %>% str_sub(-3,-1)

#파이프라인 함수 미사용
sen2 <-str_sub(head(sentences), -3,-1)


print(sen2)


