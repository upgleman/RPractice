#[실습4] html을 활용한 중앙일보 여러 페이지 크롤링

#패키지 호출
install.packages("rvest")
library(rvest)
library(XML)

## 크롤링 함수
# 저장 공간 생성


url_base <- "https://www.joongang.co.kr/_CP/176?category=Science&pageItemId=197&page="

#for 문을 활용해 중앙일보 뉴스 요약 텍스트 얻어오기 

news <- c()

for(page in 1:4){
  url <- paste(url_base, page, sep = "")
  htxt <- read_html(url)
  #URL 주소에서 html값을 읽어오는 함수
  content <- html_nodes(htxt, ".description") 
  #html값을 node 기준으로 읽어오는 함수 .클래스 명 구분
  reviews <- html_text(content)  #html에서 텍스트를 가져오는 함수
  news <- c(news, reviews)
  print(page)
}
news
