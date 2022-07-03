# [미션2 해설] 네이버 영화 네티즌 평점 크롤링

#패키지 호출
library(rvest)
library(stringr)


## URL 저장하기 
url_base <- "https://movie.naver.com/movie/point/af/list.nhn?st=mcode&sword=156464&target=after&page="


## 빈 공간 만들기
reviews <- c()

## for 문으로 20페이지까지 크롤링해오기 

for(page in 1:20) {
  URL <-paste(url_base, page, sep = "", encoding ="UTF-8")
  htxt <- read_html(URL)
  nodes <- html_nodes(htxt,".title") #. class명 title
  content <- html_text(nodes)
  reviews <- c(reviews, content)
  print(page)
}

reviews



