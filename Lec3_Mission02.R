#[미션2 해설] 네이버 영화 평점 워드클라우드

# 패키지 호출
library(dplyr); library(stringr);
library(KoNLP); library(wordcloud); library(RColorBrewer);

#1) 데이터 불러오기

reviews <- read.csv("reviews.csv", stringsAsFactors= 
                      FALSE, header = TRUE,fileEncoding = "UTF-8-BOM")


#2) 어간 추출하기
print("어간 추출 중입니다. 잠시만 기다려주세요.")

words <- extractNoun(reviews$text)


un_words <- unlist(words)
head(un_words)

#3) 확인 후 전처리

wordcount <- table(un_words)


# 0. 이름바꾸기

df <- as.data.frame(wordcount, stringsAsFactors = F)

df <- rename(df, words = un_words, freq = Freq)
head(df)

# 1. 2음절 미만의 단어 필터링
df <- filter(df, str_length(words) >= 2 ) #, 뒤에
# head(df)
# 2. 의미없는 글자 대체 

df$words <- str_replace_all(df$words, "\\^ㅎ^ㅎ", "") #그대로 실행하세요
df$words <- str_replace_all(df$words, "\\^ㅎ", "") #여기는 채워주세요

#다시 한번필터 처리 필요?
# df <- filter(df, str_length(words) >= 2 )

## 빈도 확인 
top50 <- df %>% arrange(desc(freq)) %>% head(50)
top50

#4) 워드클라우드
pal <- brewer.pal(8, "Dark2")
set.seed(1234)

# 함수 안을 채워주세요 
wordcloud(words = df$words, 
          freq = df$freq, 
          min.freq = 2,
          max.words = 100,
          random.order = FALSE,
          rot.per = 0.25,
          colors = pal)

