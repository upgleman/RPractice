# [실습6 해설] 조건에 맞는 문자열

#패키지 호출
library(stringr)
library(dplyr)

# 1) The 가 포함되어 있는 문장 출력
# str_subset


set <- sentences %>%
  head() %>%
  str_subset("The")


set

# grep 내장함수
grp <- sentences %>%
  head() %>%
  grep(pattern = "The", value = TRUE)

grp


# 전체 문장들과 비교 

# 2) 조건에 맞는 문자열 논리형 출력

#파이프라인 함수 사용 
det1 <- sentences %>% 
  head() %>% 
  str_detect("The")
det1
#파이프라인 함수 미사용

det2 <- str_detect(head(sentences),"The")
det2
