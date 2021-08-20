# sns 데이터 불러오기
sns2018_1 <- dbGetQuery(conn, 'select * from sns2018_1')
sns2018_2 <- dbGetQuery(conn, 'select * from sns2018_2')
sns2019_1 <- dbGetQuery(conn, 'select * from sns2019_1')
sns2019_2 <- dbGetQuery(conn, 'select * from sns2019_2')
head(sns2018_1[,-2])

# 분기별데이터 합치기
sns2018_1_a <- data.frame(dcast(sns2018_1, sns2018_1.sm_cat~sns2018_1.date))
sns2018_2_a <- data.frame(dcast(sns2018_2, sns2018_2.sm_cat~sns2018_2.date))
sns2019_1_a <- data.frame(dcast(sns2019_1, sns2019_1.sm_cat~sns2019_1.date))
sns2019_2_a <- data.frame(dcast(sns2019_2, sns2019_2.sm_cat~sns2019_2.date))
head(sns2018_2_a)

sns_all <- merge(sns2018_1_a, merge(sns2018_2_a, merge(sns2019_1_a, sns2019_2_a, by.x = 'sns2019_1.sm_cat', by.y = 'sns2019_2.sm_cat', all=T),
                                    by.x = 'sns2018_2.sm_cat', by.y = 'sns2019_1.sm_cat', all = T),
                 by.x = 'sns2018_1.sm_cat', by.y = 'sns2018_2.sm_cat', all=T)
str(sns_all)

# 데이터 변형_전처리
sns_all_data <- t(sns_all[,-1])
colnames(sns_all_data)
row.names(sns_all_data)
colnames(sns_all_data) <- sns_all[,1]
colnames(sns_all_data)
str(sns_all_data)
View(sns_all_data)

write.csv(sns_all_data, 'sns_all_data.csv', fileEncoding = 'UTF-8')
