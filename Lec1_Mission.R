#패키지 호출
library(stringr)
library(dplyr)

# shark 데이터 파일 읽어오기

shark <- read.table("shark.txt", sep = "\n", header = FALSE, stringsAsFactors =FALSE, encoding = "UTF-8")

# mission1 각 구절의 가사 문자열 길이 확인하기 
mission1 <- str_length(shark$V1)

mission1
# mission2 각 구절 문자열의 특정 부분을 추출해보기
mission2 <- str_sub(shark$V1, 1,3)

mission2
# mission3 각 구절의 가사 문자열 정렬하기 
mission3 <-  str_sort(shark$V1, decreasing = TRUE )
mission3

# mission4 각 구절의 가사 조건에 맞는 문자열 찾기 
mission4 <- str_subset(shark$V1, "상어")
mission4


# mission5 - baby_rabbit ! 각 구절의 가사 조건에 맞는 문자열로 바꾸기
baby_rabbit <- str_replace_all(shark$V1, "상어","토끼")
print(baby_rabbit)
