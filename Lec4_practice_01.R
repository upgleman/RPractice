#KoNLP설치 과정
install.packages("multilinguer")
library(multilinguer)
install_jdk( ) 
install.packages(c("hash", "tau", "Sejong", "RSQLite", "devtools", "bit", "rex", "lazyeval", "htmlwidgets", "crosstalk", "promises", "later", "sessioninfo", "xopen", "bit64", "blob", "DBI", "memoise", "plogr", "covr", "DT", "rcmdcheck", "rversions"), type = "binary")

install.packages("remotes")
remotes::install_github('haven-jeon/KoNLP', upgrade = "never", INSTALL_opts=c("--no-multiarch"))

library(KoNLP)

#패키지 호출
install.packages("wordcloud")

library(dplyr); 
library(stringr); 
library(wordcloud); 
library(RColorBrewer)


# 1) 데이터 불러오기

assem <- read.csv("assembly_ANSI.csv", stringsAsFactors = FALSE, header = TRUE)


# 2) 어간 추출하기
print("어간 추출 중입니다. 잠시만 기다려주세요.")
words <- extractNoun(assem$text)
un_words <- unlist(words)

# 3) 확인 후 전처리 
print("전처리 중입니다. 잠시만 기다려주세요.")
wordcount <- table(un_words)
wordcount %>% sort(decreasing = TRUE) %>% head(50)

#1. 의미없는 단어 제거

un_words <- un_words %>% str_replace_all("위원","")
un_words <- un_words %>% str_replace_all("생각","")
un_words <- un_words %>% str_replace_all("정부","")
un_words <- un_words %>% str_replace_all("문제","")
un_words <- un_words %>% str_replace_all("말씀","")
un_words <- un_words %>% str_replace_all("부분","")
un_words <- un_words %>% str_replace_all("우리","")
un_words <- un_words %>% str_replace_all("이것","")
un_words <- un_words %>% str_replace_all("때문","")
un_words <- un_words %>% str_replace_all("해서","")
un_words <- un_words %>% str_replace_all("의원","")
un_words <- un_words %>% str_replace_all("그것","")
un_words <- un_words %>% str_replace_all("얘기","")
un_words <- un_words %>% str_replace_all("들이","")
un_words <- un_words %>% str_replace_all("가지","")
un_words <- un_words %>% str_replace_all("하게","")
un_words <- un_words %>% str_replace_all("저희","")
un_words <- un_words %>% str_replace_all("관련","")

wordcount <- table(un_words)

wordcount
#2. 2음절 미만 단어 제거

df <- as.data.frame(wordcount, stringsAsFactors = F)
df <- rename(df,
             freq = Freq,
             words = un_words)
df <- filter(df, str_length(words) >= 2)
top50 <- df %>% arrange(desc(freq)) %>% head(50)



# 워드클라우드 
pal <- brewer.pal(8, "Dark2")
# 이 안에 코드를 입력해주세요 
wordcloud(words = df$words,
          freq = df$freq,
          min.freq = 2,
          max.words = 50,
          random.order = F,
          rot.per = .25,
          scale = c(3, 0.3),
          colors = pal)



