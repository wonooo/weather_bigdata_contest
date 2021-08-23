# 구매이력 데이터 
buy_all <- read.csv('buy_all.csv', encoding = 'UTF-8')
buy_all <- buy_all[,-1]
str(buy_all)

# sd기준으로 변동이 큰 상품 30개 추출
buy_all_sd <- data.frame(sapply(buy_all[,-1], sd))
str(buy_all_sd)
names(buy_all_sd) <- 'sd'

library(dplyr)
sd_30 <- buy_all_sd %>% arrange(desc(sd)) %>% head(n=30)
write.csv(sd_30, 'sd_30.csv', fileEncoding = 'UTF-8')


# 변동이 큰 30개를 기준으로 구매이력 데이터 추출
buy_all_sd_30 <- buy_all %>% 
  select(date, buy_all_sd %>% arrange(desc(sd)) %>% head(n=30) %>% row.names())
str(buy_all_sd_30)

# 변동이 큰 30개를 기준으로 sns 데이터 추출
sns_all_sd_30 <- sns_all %>% 
  select(date, buy_all_sd %>% arrange(desc(sd)) %>% head(n=30) %>% row.names())
str(sns_all_sd_30)


# 날씨 데이터와 합쳐서 하나의 데이터셋으로 만들기
weather2 <- read.csv('weather2.csv', encoding = 'UTF-8')
str(weather2)
weather2 <- weather2[,-1]

buy30_weather2 <- merge(buy_all_sd_30, weather2, by='date')
str(buy30_weather2)
write.csv(buy30_weather2, 'buy30_weather2.csv', fileEncoding = 'UTF-8')

sns30_weather2 <- merge(sns_all_sd_30, weather2, by='date')
str(sns30_weather2)
write.csv(sns30_weather2, 'sns30_weather2.csv', fileEncoding = 'UTF-8')

