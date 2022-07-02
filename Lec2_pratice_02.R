# [실습2 해설] 정규표현식 : 일치하는 문자 목록, 수량자, 앵커

#패키지 호출
library(stringr)
library(dplyr)

##4) 일치하는 문자 목록
#4-1) 대괄호식 []

str_extract(stringr::words, "[aeiou]")

#4-2) 하이픈 - 

chap <- c("Chapter 1", "Chapter 2", "Chapter 3", "Chapter 4", "Chapter 5")
str_extract(chap, "Chapter [12345]")
str_extract(chap, "Chapter [1-5]")

#4-3) 부정의 캐럿 ^

str_extract(chap, "Chapter [^1234]")
str_extract(chap, "Chapter [^1-4]")

##5) 수량자

food <- c("Bob", "food", "foood", "fooood")
str_extract(food, "o{2}")
str_extract(food, "o{2,}")
str_extract(food, "o{1,3}")

##6) 앵커
#6-1)$

fruit <- c("apple","banana","pear")
str_extract(fruit, "a$")
str_extract(fruit, "^a")


test <- c("hello\bworld")
writeLines(test)
str_extract(test,"\bw")

#재현 안됨
test2 <- c("hello\\Bworld")
writeLines(test2)
str_extract(test2,"\\B")
