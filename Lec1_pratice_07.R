# [실습7 해설] 조건에 맞는 문자열 변환

#패키지 호출
library(stringr)
library(dplyr)

#str_replace

rep <- sentences %>%
  head() %>%
  str_replace("the", "-")
rep
#str_replace_all 2개 이상 모두바꿈

rep_all <- sentences %>%
  head() %>%
  str_replace_all("the", "-")
rep_all
#gsub 내장함수 ?

sub <- sentences %>%
  head() %>%
  gsub("the","-",.)

sub
