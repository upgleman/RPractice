## 패키지 호출
install.packages(c("rvest","XML"))

library(KoNLP); library(wordcloud); library(RColorBrewer); library(stringr);
library(rvest); library(XML); library(curl) ; library(dplyr);


# 1) 12월 차트에서 songid 얻어오기 

htxt <- read_html(curl("https://www.melon.com/chart/month/index.htm#params%5Bidx%5D=1&params%5BrankMonth%5D=201811&params%5BisFirstDate%5D=false&params%5BisLastDate%5D=false", handle = new_handle("useragent" = "Mozilla/5.0")))
print(htxt[2])

# 2) songid 부분의 데이터 가져오기
# id : # class : . 사용
content <- htxt %>% html_nodes("#tb_list")
songid <- content %>% html_nodes(".lst50")

# 3) songid 만 추출하기

id <- str_extract(songid, "\\d{8}")

# head(id)
# 4) 상세 곡 정보 링크만들기

songs <- c()

for(i in 1:50){
  songs[i] <- str_c("https://www.melon.com/song/detail.htm?songId=", id[i])
}


# 5) xpath 로 노래가사 크롤링
print("노래가사 크롤링 중입니다. 잠시만 기다려주세요. 약 30초 정도 소요됩니다. ")

lyrics <- c()
for(number in 1:50){
  get0 <- httr::GET(songs[number])
  html <- XML::htmlParse(get0)
  xpath1 <- '//*[@id="d_video_summary"]'
  lyric <- xpathSApply(html, xpath1, xmlValue)
  lyrics <- c(lyrics, lyric)
}
lyrics[1]
# 6) 어간 추출
print("어간 추출 중입니다. 잠시만 기다려주세요. 약 1분정도 소요됩니다. ")
words <- extractNoun(lyrics)
un_words <- unlist(words)


# 7) 확인 후 전처리
# 2음절 미만의 단어 필터링
wordcount <- table(un_words)
wordcount %>% sort(decreasing = TRUE) %>% head(50)

df <- as.data.frame(wordcount, stringsAsFactors = F)
df <- rename(df,
             freq = Freq,
             words = un_words)
df <- filter(df, str_length(words) >= 2)
top50 <- df %>% arrange(desc(freq)) %>% head(50)


# 8) 워드클라우드 그리기
pal <- brewer.pal(8, "Dark2")
set.seed(1234)
#이 사이에 코드를 넣어주세요
wordcloud(words = df$words,
          freq = df$freq,
          min.freq = 2,
          max.words = 100,
          random.order = F,
          rot.per = .25,
          scale = c(3, 0.3),
          colors = pal)
