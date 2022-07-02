#[실습2] 문자열 길이

library(stringr)

## sentences 데이터 확인
print(sentences)

## 문자열 길이 

len <- sentences %>%
  head %>%
  str_length()
print(len)

len2 <- str_length(head(sentences)) 

print(len2)

## nchar 내장함수

#파이프라인 함수 사용
len3 <- sentences %>% 
  head() %>%
  nchar()
print(len3)
#파이프라인 함수 미사용
len4 <- nchar(head(sentences)) 
print(len4)


## length 문자열의 수 확인하기

length(sentences)
