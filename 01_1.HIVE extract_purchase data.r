# 온라인 구매이력 데이터
buy2018_1 <- dbGetQuery(conn, 'select * from buy2018_1')
buy2018_2 <- dbGetQuery(conn, 'select * from buy2018_2')
buy2019_1 <- dbGetQuery(conn, 'select * from buy2019_1')
buy2019_2 <- dbGetQuery(conn, 'select * from buy2019_2')

library(dplyr)
str(buy2018_1)
str(buy2018_2)

# 20대, 30대 여성의 평균 추출
buy2018_1_23 <- buy2018_1 %>% filter(buy2018_1.sex == 'F') %>% 
  filter(buy2018_1.age == '30'|buy2018_1.age == '20') %>%
  group_by(buy2018_1.date, buy2018_1.sm_cat) %>% 
  summarise(qty=mean(buy2018_1.qty))

buy2018_2_23 <- buy2018_2 %>% filter(buy2018_2.sex == 'F') %>% 
  filter(buy2018_2.age == '30'|buy2018_2.age == '20') %>%
  group_by(buy2018_2.date, buy2018_2.sm_cat) %>% 
  summarise(qty=mean(buy2018_2.qty))

buy2019_1_23 <- buy2019_1 %>% filter(buy2019_1.sex == 'F') %>% 
  filter(buy2019_1.age == '30'|buy2019_1.age == '20') %>%
  group_by(buy2019_1.date, buy2019_1.sm_cat) %>% 
  summarise(qty=mean(buy2019_1.qty))

buy2019_2_23 <- buy2019_2 %>% filter(buy2019_2.sex == 'F') %>% 
  filter(buy2019_2.age == '30'|buy2019_2.age == '20') %>%
  group_by(buy2019_2.date, buy2019_2.sm_cat) %>% 
  summarise(qty=mean(buy2019_2.qty))

head(buy2019_1_23)

# 분기별 데이터 합치기
library(reshape2)
View(dcast(buy2018_1_23, buy2018_1.sm_cat~buy2018_1.date))

data_2018_1 <- data.frame(dcast(buy2018_1_23, buy2018_1.sm_cat~buy2018_1.date))
data_2018_2 <- data.frame(dcast(buy2018_2_23, buy2018_2.sm_cat~buy2018_2.date))
data_2019_1 <- data.frame(dcast(buy2019_1_23, buy2019_1.sm_cat~buy2019_1.date))
data_2019_2 <- data.frame(dcast(buy2019_2_23, buy2019_2.sm_cat~buy2019_2.date))

head(data_2018_1)

data_all <- merge(data_2018_1, merge(data_2018_2, merge(data_2019_1, data_2019_2, by.x = 'buy2019_1.sm_cat', by.y = 'buy2019_2.sm_cat', all=T),
                                     by.x = 'buy2018_2.sm_cat', by.y = 'buy2019_1.sm_cat', all = T),
                  by.x = 'buy2018_1.sm_cat', by.y = 'buy2018_2.sm_cat', all=T)

View(data_all)


# 데이터 변형_전처리
str(data_all)
t(data_all[,-1])

buy_all_data <- t(data_all[,-1])
colnames(buy_all_data)
row.names(buy_all_data)
colnames(buy_all_data) <- data_all[,1]

str(buy_all_data)
View(buy_all_data)

write.csv(buy_all_data, 'buy_all_data.csv', fileEncoding = 'UTF-8')
