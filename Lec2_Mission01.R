# [미션1 해설] 정규표현식으로 가계부쓰기
#패키지 호출
library(stringr)
library(dplyr)

#가계부 
money <- c("20181209 수입 9100원","20181214 수입 8900원", "20181215 지출 450원")

# 미션1) 돈 부분만 추출해서 won1에 저장
won1 <- str_extract_all(money,"[0-9]{1,7}원")

print(won1)

#리스트 해제 
won1 <- unlist(won1) 
print(won1)
# 미션2-1) 
won2 <- str_extract_all(money,"[0-9]{8}")



#리스트 해제
won2 <- unlist(won2)
print(won2)
#정규표현식

mon_date <- regex("
  \\(?
  (\\d{4})
  [)- ]?
  (\\d{2})
  [ -]?
  (\\d{2})
                  ", comments = TRUE)
#comments 정규식 안내 주석 가능하도록

#간단한 구현한 정규표현식
mon_date2 <- regex("
  (\\d{4})
  (\\d{2})
  (\\d{2})
                  ", comments = TRUE)

#정규표현식 매칭
won3 <- str_match(won2, mon_date2)




#데이터프레임화 
won3 <- as.data.frame(won3)
print(won3)
#won3$V2, won3$V3, won3$V4 를 하나의 텍스트로 만들기
won4 <- str_c(won3$V2,won3$V3, won3$V4,sep = "/")



## 가계부 결과 확인
str_c(won4,won1, sep = " ")
