#문제3. 전화가 어느나라에서 걸려온지 확인하기
# 패키지 호출 
library(stringr)
library(dplyr)

# 데이터 가져오기 
number <- read.csv("number.csv", stringsAsFactors = FALSE, header = TRUE, fileEncoding = "UTF-8-BOM")
country <- read.csv("country.csv", stringsAsFactors = FALSE, header = TRUE, fileEncoding = "UTF-8-BOM")
head(number)
head(country)
# 데이터 병합하기 

country_number <- number %>%
  inner_join(country, by = "국가번호")

head(country_number)

