# [실습1 해설] 정규표현식 : 일반 문자, 메타 문자, 문자 일치
#패키지 호출
library(stringr)
library(dplyr)

#0) 이스케이프 역슬래쉬

x <- c("\"", "\\", "\\\"", "\\\\")
x
# 해당 함수로 파일 Writing 가능 .. 실제 string 자체를 볼수 있음
writeLines(x)


#1) 일반문자 

y <- c("a\\b")
writeLines(y)

fruit <- c("apple", "banana", "pear")
str_extract(fruit, "an") #an 확인
str_extract(fruit, ".a.") #a의 앞뒤

#2) 메타문자 \d


meta <- c("widow maker", "soldier76")
str_extract(meta,"\\d")
str_extract(meta,"\\d\\d")


#3) 문자일치 

elice <- "https://academy.elice.io"
str_extract(elice, "elice\\.io") # . == \\.


