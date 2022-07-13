#패키지 호출

install.packages("tm")
install.packages("SnowballC")

library(tm); # for text mining
library(SnowballC); # for text stemming(어근추출)
library(wordcloud);  # word-cloud generator 
library(RColorBrewer); # color palettes
library(stringr)
set.seed(1234)

# 1) 데이터 불러오기

trump <- readLines("trump.txt", encoding = "UTF-8")
  
head(trump)
#라인별 번호 추가
doc_ids <- seq(1, length(trump), 1)
df <- data.frame(doc_id = doc_ids, text = trump, stringsAsFactors = FALSE)
# head(df)
#데이터를 Corpus로 로드함
docs <- Corpus(DataframeSource(df))
#문서 내용 검사
inspect(head(docs))
#2)전처리

#1. 소문자 처리
  
docs <- tm_map(docs, content_transformer(tolower))
  
#2. 숫자 제거
  
docs <- tm_map(docs, removeNumbers)
  
#3. 구두점 제거 '...'
  
docs <- tm_map(docs, removePunctuation)
  
#4. 공백 제거 
  
docs <- tm_map(docs, stripWhitespace)
  
#5. 영어 표현 제거 etc, i.e. 
  
docs <- tm_map(docs, removeWords, stopwords('english'))
  
#6. 스태밍 하기  영어의 시제에 따라 붙는 ed, ing 등
  
docs <- tm_map(docs, stemDocument)
  
#7. 추가 단어 제거
  
trans <- content_transformer(
  function(x, pattern) 
    str_replace_all(x, pattern, ""))

docs <- tm_map(docs, trans, "the") 
# function 에  docs 와 "the" 인수로 들어가는 구조
docs <- tm_map(docs, trans, "and")
docs <- tm_map(docs, trans, "this")

  
  
# 3) 워드클라우드 
pal <- brewer.pal(8, "Dark2")

# 이 안에 코드를 입력해주세요 
wordcloud(docs,
          min.freq = 2,
          max.words = 50,
          random.order = F,
          rot.per = .25,
          scale = c(3, 0.3),
          colors = pal)



