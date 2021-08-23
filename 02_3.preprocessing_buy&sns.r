# 구매이력 데이터
buy_all <- read.csv('buy_all_data.csv', encoding = 'UTF-8')
str(buy_all)

buy_all$X <- paste(substr(buy_all$X, 2,5),substr(buy_all$X, 6,7),substr(buy_all$X, 8,9), sep = '-')
str(buy_all)
names(buy_all)[1] <- 'date'
buy_all[is.na(buy_all)] <- 0
write.csv(buy_all, 'buy_all.csv', fileEncoding = 'UTF-8')


# 소셜데이터
sns_all <- read.csv('sns_all_data.csv', encoding = 'UTF-8')
str(sns_all)
sns_all$X <- paste(substr(sns_all$X, 2,5),substr(sns_all$X, 6,7),substr(sns_all$X, 8,9), sep = '-')
str(sns_all)
names(sns_all)[1] <- 'date'

write.csv(sns_all, 'sns_all.csv', fileEncoding = 'UTF-8')
