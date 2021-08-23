# 전운량
cloud <- read.csv('cloud.csv', encoding = 'UTF-8', col.names = c('x', 'date', 'cloud'))
str(cloud)
cloud <- cloud[,-1]
cloud[,1] <- gsub(' 00:00:00.0', '', cloud[,1])
sum(is.na(cloud))

# 강수량
rain <- read.csv('rain.csv', encoding = 'UTF-8', col.names = c('x', 'date', 'rain'))
str(rain)
rain <- rain[,-1]
rain[,1] <- gsub(' 00:00:00.0', '', rain[,1])
sum(is.na(rain))

# 적설량
snow <- read.csv('snow.csv', encoding = 'UTF-8', col.names = c('x', 'date', 'snow'))
str(snow)
snow <- snow[,-1]
snow[,1] <- gsub(' 00:00:00.0', '', snow[,1])
sum(is.na(snow))
snow[is.na(snow)] <- 0

# 일사량
sun <- read.csv('sun.csv', encoding = 'UTF-8', col.names = c('x', 'date', 'sun'))
str(sun)
sun <- sun[,-1]
sun[,1] <- gsub(' 00:00:00.0', '', sun[,1])
sum(is.na(sun))
View(sun)
# 일사량의 결측치 대체 (결측된 날과 같은 날짜의 전년도, 결측된 날의 전날과 다음날의 수치의 평균)
sun[730,1] <- '2019-08-07'
sun[730,2] <- round(mean(sun[sun$date == '2018-08-07'|sun$date == '2019-08-06'|sun$date == '2019-08-08',2]),2)
sum(is.na(sun))

# 풍속
wind <- read.csv('wind.csv', encoding = 'UTF-8', col.names = c('x', 'date', 'wind'))
str(wind)
wind <- wind[,-1]
wind[,1] <- gsub(' 00:00:00.0', '', wind[,1])
sum(is.na(wind))
# 풍속의 결측치 대체 (결측된 날과 같은 날짜의 전년도, 결측된 날의 전날과 다음날의 수치의 평균)
wind[wind$date == '2019-12-24',2] <- round(mean(wind[wind$date == '2018-12-24'|wind$date == '2019-12-23'|wind$date == '2019-12-25',2]),2)
sum(is.na(wind))

# 기온
temp <- read.csv('기온.csv', encoding = 'UTF-8', col.names = c('x', 'date', 'temp', 'temp_max', 'temp_min', 'temp_minus'))
str(temp)
temp <- temp[,-1]
temp[,1] <- gsub(' 00:00:00.0', '', temp[,1])
sum(is.na(temp))

# 습도
humid <- read.csv('습도.csv', encoding = 'UTF-8', col.names = c('x', 'date', 'humid'))
str(humid)
humid <- humid[,-1]
humid[,1] <- gsub(' 00:00:00.0', '', humid[,1])
sum(is.na(humid))




# 7개의 날씨데이터 합치기
sum(cloud[,1] ==  rain[,1])
sum(cloud[,1] ==  snow[,1])
sum(cloud[,1] ==  sun[,1])
cloud[,1] ==  sun[,1]
sum(cloud[,1] ==  wind[,1])
sum(cloud[,1] ==  temp[,1])
sum(cloud[,1] ==  humid[,1])
weather <- merge(cbind(cloud, rain = rain[,2], snow=snow[,2], wind=wind[,2], temp=temp[,2], temp_minus=temp[,5], humid=humid[,2]),
                 sun, by='date')
str(weather)



# 불쾌지수 ---- 02_2 uncomfort index부분
result <- read.csv('result.csv', encoding = 'UTF-8')
str(result)
result$날짜 <- substr(result$날짜, 1,10)
result <- result %>% select(날짜, 불쾌지수.max.)
names(result) <- c('date', 'bad')

weather <- merge(weather, result, by='date')
str(weather)


# 미세먼지 데이터
air_2018 <- read.csv('AIR_HOUR_2018.csv', encoding = 'UTF-8')
air_2019 <- read.csv('AIR_HOUR_2019.csv')
str(air_2018)
str(air_2019)

air_2018 <- air_2018 %>% filter(측정소.코드 == 101) %>% filter(측정항목.코드 == 8)
air_2019 <- air_2019 %>% filter(측정소.코드 == 101) %>% filter(측정항목.코드 == 8)
air_2018[air_2018$측정기.상태%in%c(4,8),4] <- NA
sum(is.na(air_2018))
air_2018$date <- substr(air_2018$X.U.FEFF.측정일시, 1,10)
air_2019$date <- substr(air_2019$측정일시, 1,10)

air_2018 <- air_2018 %>% group_by(date) %>% summarise(pm10=round(mean(평균값, na.rm=T),3))
air_2019 <- air_2019 %>% group_by(date) %>% summarise(pm10=round(mean(평균값, na.rm=T),3))
str(air_2018)
str(air_2019)  # 355개->결측치 10개

# 19년도 결측치 찾기
air_2018$noyear <- substr(air_2018$date, 6,10)
air_2019$noyear <- substr(air_2019$date, 6,10)

air_merge <- merge(air_2018, air_2019, by='noyear', all=T) 
paste('2019', air_merge[is.na(air_merge$pm10.y),'noyear'], sep='-')

# 결측치 대체
air_na_3 <- (air_2018 %>% filter(substr(noyear, 1,2)=='03') %>%  summarise(n=mean(pm10)) +
               air_2019 %>% filter(substr(noyear, 1,2)=='02') %>%  summarise(n=mean(pm10, na.rm=T)) +
               air_2019 %>% filter(substr(noyear, 1,2)=='03') %>%  summarise(n=mean(pm10, na.rm=T)) +
               air_2019 %>% filter(substr(noyear, 1,2)=='04') %>%  summarise(n=mean(pm10, na.rm=T)))/4

air_na_9 <- (air_2018 %>% filter(substr(noyear, 1,2)=='09') %>%  summarise(n=mean(pm10)) +
               air_2019 %>% filter(substr(noyear, 1,2)=='08') %>%  summarise(n=mean(pm10, na.rm=T)) +
               air_2019 %>% filter(substr(noyear, 1,2)=='09') %>%  summarise(n=mean(pm10, na.rm=T)) +
               air_2019 %>% filter(substr(noyear, 1,2)=='10') %>%  summarise(n=mean(pm10, na.rm=T)))/4
air_2019 <- data.frame(rbind(air_2019, 
                             data.frame('date' = paste('2019', air_merge[is.na(air_merge$pm10.y),'noyear'], sep='-'), 
                                        'pm10' = c(rep(air_na_3[1,], 8), rep(air_na_9[1,],2)),
                                        'noyear' = air_merge[is.na(air_merge$pm10.y),'noyear'])))
air_2019 <- air_2019 %>% arrange(date)

# 18년도와 19년도 합치기
air_2year <- rbind(air_2018[,-3], air_2019[,-3])





# 날씨데이터와 합치기
str(weather)
sum(is.na(merge(weather, air_2year, by='date', all=T)))
weather <- merge(weather, air_2year, by='date', all=T)

write.csv(weather, 'weather.csv', fileEncoding = 'UTF-8')

