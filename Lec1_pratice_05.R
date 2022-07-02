#[실습5 해설] 문자열 정렬

# 패키지 호출
library(stringr)
library(dplyr)

# 문자열 정렬


so <- sentences %>%
  head() %>%
  str_sort()

so

so_de <- sentences %>%
  head() %>%
  str_sort(decreasing = TRUE)

so_de

# 문자열 정렬 순위

or_c <- sentences %>%
  head()
or_c

or <- sentences %>%
  head() %>%
  str_order()

or

so_d <- so_de %>%
  str_order()
so_d

# str_order str_sort 결과 다름..!!!

