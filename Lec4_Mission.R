#패키지 호출
library(KoNLP); library(dplyr); library(stringr); library(wordcloud); library(RColorBrewer);


# 1) 데이터 불러오기
expense <- read.csv("expense_2018_11.csv", head = TRUE, fileEncoding="UTF-8-BOM")

# 2) 어간 추출하기
print("어간 추출 중입니다. 잠시만 기다려주세요.")
words <- extractNoun(expense$지출개요)
un_words <- unlist(words)

# 3) 확인 후 전처리 
print("전처리 중입니다. 잠시만 기다려주세요.")
wordcount <- table(un_words)
wordcount %>% sort(decreasing=TRUE) %>% head(50)


#1. 의미없는 단어 제거

un_words <- un_words %>% str_replace_all("\\d{4}년","")
un_words <- un_words %>% str_replace_all("\\d{2}월","")
un_words <- un_words %>% str_replace_all("\\d{2}일","")
un_words <- un_words %>% str_replace_all(" ","")


wordcount <- table(un_words)

df <- as.data.frame(wordcount, stringsAsFactors = FALSE)
head(df)

df <- rename(df, freq = Freq, words = un_words)
# head(df)
#2. 2음절 미만 단어 제거

df <- filter(df, str_length(words) >=2)

top50 <- df %>% arrange(desc(freq)) %>% head(50)
top50

# 워드클라우드 
pal <- brewer.pal(8, "Dark2")

# 이 안에 코드를 입력해주세요 
wordcloud(words= df$words, freq = df$freq, 
          min.freq = 2, 
          max.freq = 30,
          random.order = FALSE,
          rot.per = .25,
          scale = c(3,0.3),
          colors =pal)


