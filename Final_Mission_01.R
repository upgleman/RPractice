# 문제1. 고려가요 청산별곡 파헤치기
#패키지 불러오기

library(stringr)
library(dplyr)

#1) 데이터 읽어오기
goryeo <- readLines("청산별곡.txt", encoding = "UTF-8")
head(goryeo)
# summary(goryeo)
#2) 각 구절의 가사 문자열 길이 확인하기 

song1 <- str_length(goryeo)
song1
#3) 각 구절의 문자열의 뒤에서 2~4 번째 문자를 추출

song2 <- str_sub(goryeo, -4,-2)
song2
#4) 각 구절 정렬하기 

song3 <- str_sort(goryeo,decreasing=FALSE)
song3
#5) 조건에 맞는 문자열 찾기

song4 <- str_subset(goryeo,"얄리")
song4
#6) 조건에 맞는 문자열 바꾸기

song5 <- str_replace_all(goryeo, "얄랑셩","얄라셩")
song5
