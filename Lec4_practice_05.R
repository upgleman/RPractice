#패키지 호출
library(stringr)
library(dplyr)

# 1) 데이터 불러오기

busan <- read.csv("busan_2018.csv", stringsAsFactors = FALSE, header = TRUE,fileEncoding="UTF-8-BOM")
# View(busan)
run <- read.csv("run.csv", stringsAsFactors = FALSE, header = TRUE,fileEncoding="UTF-8-BOM")
# View(run)

# 2) 두 데이터 병합하기 

train <- left_join(busan, run, by = "역명")
View(train)

# 3) 필요한 부분을 원하는 형식으로 바꿔주기

check <- str_c(train$역명,train$노선명, sep = " : ") 
check
# View(check)

