#패키지 호출

#KoNLP설치 과정
install.packages("multilinguer")
library(multilinguer)
# install_jdk( ) 
install.packages(c("hash", "tau", "Sejong", "RSQLite", "devtools", "bit", "rex", "lazyeval", "htmlwidgets", "crosstalk", "promises", "later", "sessioninfo", "xopen", "bit64", "blob", "DBI", "memoise", "plogr", "covr", "DT", "rcmdcheck", "rversions"), type = "binary")

install.packages("remotes")
remotes::install_github('haven-jeon/KoNLP', upgrade = "never", INSTALL_opts=c("--no-multiarch"))
install.packages("dplyr")
install.packages("wordcloud")
library(KoNLP)

library(dplyr)
library(stringr)

library(wordcloud) 
library(RColorBrewer)


# 1) 데이터 불러오기

busan <- read.csv("busan_2018.csv", stringsAsFactors = FALSE, head = TRUE,fileEncoding="UTF-8-BOM")
# View(busan)
# 2) 어간 추출하기
print("어간 추출 중입니다. 잠시만 기다려주세요.")
words <- extractNoun(busan$역명및.지명유래)
un_words <- unlist(words)
# head(un_words)
# 3) 확인 후 전처리
print("전처리 중입니다. 잠시만 기다려주세요.")
wordcount <- table(un_words)
wordcount %>% sort(decreasing = TRUE) %>%
  head(50)


#1. 의미없는 단어 제거

un_words <- un_words %>% str_replace_all("마을","")
un_words <- un_words %>% str_replace_all("부산","")
un_words <- un_words %>% str_replace_all("지명","")
un_words <- un_words %>% str_replace_all("유래","")
un_words <- un_words %>% str_replace_all("이름","")
un_words <- un_words %>% str_replace_all("명칭","")
un_words <- un_words %>% str_replace_all("기록","")
un_words <- un_words %>% str_replace_all("지역","")
un_words <- un_words %>% str_replace_all("위치","")
un_words <- un_words %>% str_replace_all("이곳","")
un_words <- un_words %>% str_replace_all("이후","")



wordcount <- table(un_words)


#2. 2음절 미만 단어 제거

df <- as.data.frame(wordcount, stringsAsFactors = F)
df <- rename(df,
             freq = Freq,
             words = un_words)
df <- filter(df, str_length(words) >= 2)

View(df)
top50 <- df %>% arrange(desc(freq)) %>% head(50)
head(top50)


# 워드클라우드 
pal <- brewer.pal(8, "Dark2")

# 이 안에 코드를 입력해주세요 
wordcloud(words = df$words,
          freq = df$freq,
          min.freq = 2,
          max.words = 30,
          random.order = F,
          rot.per = .25,
          scale = c(3, 0.3),
          colors = pal)


