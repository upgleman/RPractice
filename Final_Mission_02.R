#문제2. 정규표현식을 활용한 국제번호 처리
# 패키지 호출 
library(stringr)
library(dplyr)

# 데이터 가져오기 
numbers <- read.table("numbers.txt", sep = "\n", header=FALSE, stringsAsFactors =FALSE, fileEncoding = "UTF-8")

# 정규표현식 짜기
country <- regex("
  \\(? 
  (\\d{2}) # 국제번호
  [+]?  
  (\\d{3,4}) # 3개 또는 4개 숫자
  [ -]? # 하이픈이나 공백을 선택적으로 가져올 수 있습니다.
  (\\d{4}) # 4개 숫자
                  ", comments = TRUE)

# 1) 데이터와 정규표현식 매칭하기 

inter <-str_match(numbers$V1,country)


# 2) 형식 바꾸기
inter <- as.data.frame(inter)
inter
# inter
only_number <- str_c(inter$V3,inter$V4, sep = ".")
only_number
