# [실습4 해설] 중앙일보 기사 워드클라우드
# 패키지 호출
library(dplyr); library(stringr);
library(KoNLP); library(wordcloud); library(RColorBrewer);


## 1) 데이터 불러오기
news <- read.csv("news.csv", stringsAsFactors = FALSE, header = TRUE, fileEncoding = "UTF-8-BOM")


## 2) 어간 추출하기
print("어간 추출 중입니다. 잠시만 기다려주세요.")
words <- extractNoun(news$text)
un_words <- unlist(words)


## 3) 확인 후 전처리
print("전처리 중입니다. 잠시만 기다려주세요.")
wordcount <- table(un_words)
wordcount %>% sort(decreasing = TRUE) %>% head(50)



# 2음절 미만의 단어 필터링
df <- as.data.frame(wordcount, stringsAsFactors = F)
df <- rename(df,
             freq = Freq,
             words = un_words)
df <- filter(df, str_length(words) >= 2)
top50 <- df %>% arrange(desc(freq)) %>% head(50)



## 4) 워드클라우드
pal <- brewer.pal(8, "Dark2")

# 함수 안을 채워주세요 
wordcloud(words = df$words,
          freq = df$freq,
          min.freql = 2,
          max.words = 50,
          random.order =F,
          rot.per = .25,
          colors = pal)


