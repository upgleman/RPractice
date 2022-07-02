#[실습1] 문자열 결합
library(stringr)

#x,y를 str_c 함수로 합쳐서 xy 에 저장하기 
xy <- str_c("x","y")
print(xy)
#x,y,z 를 str_c 함수로 합쳐서 xyz 에 저장하기
xyz <- str_c("x","y","z")
print(xyz)
#x,y를 , 을 넣어서 str_c 함수로 합쳐서 x.y 에 저장하기
x.y <- str_c("x","y", sep =",")
print(x.y)
#x,y를 paste 함수를 사용하여 합쳐서 pas1 에 저장하기
pas1 <- paste("x", "y")
print(pas1)

#x,y를 paste 함수를 사용하여 공백 없이 합쳐서 pas2 에 저장하기
pas2 <- paste("x","y",sep="")
print(pas2)

