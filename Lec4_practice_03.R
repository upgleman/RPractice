#패키지 호출
library(stringr)
library(dplyr)

# 1) 데이터 불러오기

busan <- read.csv("busan_2018_ANSI.csv", stringsAsFactors=FALSE, header = TRUE)
head(busan)
# 2) 정규표현식 만들기

number <- regex("
  \\(? 
  (\\d{3}) # 지역번호
  [)- ]?  # 하이픈이나 공백을 선택적으로 가져올 수 있습니다.
  (\\d{3}) # 3개 숫자
  [ -]? # 하이픈이나 공백을 선택적으로 가져올 수 있습니다.
  (\\d{4}) # 4개 숫자
                  ", comments = TRUE)


# 3) 정규표현식과 데이터 매칭
num <- str_match(busan$전화번호, number)
head(num)



# 4) 지역번호 제거하고 번호만 추출

final <- str_c(num[,3], num[,4], sep=".")
final




# 5) 내선번호 만들기

inner <- str_c(busan$역명 , num[,4], sep = " : ")
inner

