# [실습2 해설] 조인(join)

##패키지 호출
library(dplyr)

##데이터 생성
x <- tribble(
  ~key, ~val_x,
  1, "x1",
  2, "x2",
  3, "x3"
)
y <- tribble(
  ~key, ~val_y,
  1, "y1",
  2, "y2",
  4, "y3"
)

#1) 내부조인
inner <- inner_join(x,y, by = "key")

inner
#2) 외부조인
#left_join
left <- left_join(x,y, by = "key")

left

#right join
right <- right_join(x,y, by= "key")

right
#full_join
full <- full_join(x,y, by = "key")
full
