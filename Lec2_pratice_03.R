#[실습3 해설] xml을 활용한 멜론 차트 한 페이지 크롤링
#패키지 호출
library(stringr)
library(dplyr)
install.packages("XML")
library(XML)
library(httr)

#멜론 차트 크롤링

URL <- "https://www.melon.com/chart/month/index.htm#params%5Bidx%5D=1&params%5BrankMonth%5D=201811&params%5BisFirstDate%5D=false&params%5BisLastDate%5D=true"
# URL 주소의 웹페이지를 검색하는 함수
get0 <- httr::GET(URL)
#웹 페이지의 HTML소스를 가져오는 함수
html0 <- XML::htmlParse(get0)

songs <- c()

for (i in 1:100){
  xpath1 <- str_c('/html/body/div/div[1]/div/div/form/div/table/tbody/tr[',i,']/td[6]/div/div/div[1]/span/a')
  songs[i] <- xpathSApply(html0, xpath1, xmlValue) #html 소스에서 xpath에 해당하는 값을 얻어주는 함수
}
songs
