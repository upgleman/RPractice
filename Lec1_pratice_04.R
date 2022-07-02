#[실습4 해설] 문자열 대,소문자 변환

#패키지 호출
library(stringr)
library(dplyr)

#1) 모든 문자를 소문자화 

#파이프라인 함수 사용 
low <- sentences %>% 
  head() %>% 
  str_to_lower()

#파이프라인 함수 미사용
low2 <- str_to_lower(head(sentences))


print(low2)

#2) 첫 문자만 대문자, 다음 문자는 소문자

title <- str_to_title(head(sentences))

print(title)

#3) 모든 문자를 대문자화

up <- str_to_upper(head(sentences))

print(up)




#4) casefold 함수를 사용해 모든 문자를 대문자화

case <- casefold(head(sentences), upper =TRUE)
print(case)
