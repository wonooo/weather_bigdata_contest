# 날씨 데이터의 상관관계
weather <- read.csv('weather.csv', encoding = 'UTF-8')
weather <- weather[-1]
str(weather)
sum(is.na(weather))

options(scipen=999)
weather_cor <- data.frame(round(cor(weather[,-1]),4))
str(weather_cor)

write.csv(weather_cor, 'weather_cor.csv', fileEncoding = 'UTF-8')


# 상관계수를 이용해서 날씨 데이터 추려내기
weather <- read.csv('weather.csv')
str(weather)
weather <- weather[,-1]

weather2 <- weather %>% select(date,bad,sun,wind,cloud,rain,pm10)
write.csv(weather2, 'weather2.csv', fileEncoding = 'UTF-8')
