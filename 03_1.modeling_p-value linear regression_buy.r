# 데이터 불러오기
buy30_weather <- read.csv('buy30_weather2.csv', encoding = 'UTF-8')
buy30_weather <- buy30_weather[,-1]
str(buy30_weather)

# 구매이력 최적회귀(유의확률 기반 변수선택법)
# 회귀분석을 통해 유의하지 않은 모델을 제거하고, 유의한 모델의 경우 유의한 변수들만 이용하여 모델링
# 상품별로 모델링하여 2019년도 예측값을 저장
'''
첫번째 줄: 변수 전체를 선택해 유의한 변수를 확인하는 코드
두번째 줄: 유의한 변수만 가지고 회귀모델을 만드는 코드
세번째 줄: 두번쨰 줄의 회귀모델을 확인하는 코드
네번째 줄: 확정된 회귀모델의 2019년 값을 예측하여 저장하는 코드
다섯번째 줄: 저장한 예측값에 대한 이름을 입력하는 코드
'''

options(scipen=-1)
summary(lm(paste0(names(buy30_weather[,2:31])[1],'~bad+sun+wind+cloud+rain+pm10'), data=buy30_weather))
fit1 <- lm(paste0(names(buy30_weather[,2:31])[1],'~bad+sun+cloud+pm10'), data=buy30_weather)
summary(fit1)
buy1 <- data.frame(fitted.values(fit1)[366:730])
names(buy1) <- names(buy30_weather[,2:31])[1]

summary(lm(paste0(names(buy30_weather[,2:31])[2],'~bad+sun+wind+cloud+rain+pm10'), data=buy30_weather))
fit2 <- lm(paste0(names(buy30_weather[,2:31])[2],'~bad+sun+rain+pm10'), data=buy30_weather)
summary(fit2)
buy2 <- data.frame(fitted.values(fit2)[366:730])
names(buy2) <- names(buy30_weather[,2:31])[2]

summary(lm(paste0(names(buy30_weather[,2:31])[3],'~bad+sun+wind+cloud+rain+pm10'), data=buy30_weather))
fit3 <- lm(paste0(names(buy30_weather[,2:31])[3],'~sun+cloud'), data=buy30_weather)
summary(fit3)
buy3 <- data.frame(fitted.values(fit3)[366:730])
names(buy3) <- names(buy30_weather[,2:31])[3]

summary(lm(paste0(names(buy30_weather[,2:31])[4],'~bad+sun+wind+cloud+rain+pm10'), data=buy30_weather))
fit4 <- lm(paste0(names(buy30_weather[,2:31])[4],'~bad+sun+wind+cloud+rain'), data=buy30_weather)
summary(fit4)
buy4 <- data.frame(fitted.values(fit4)[366:730])
names(buy4) <- names(buy30_weather[,2:31])[4]

summary(lm(paste0(names(buy30_weather[,2:31])[5],'~bad+sun+wind+cloud+rain+pm10'), data=buy30_weather))
fit5 <- lm(paste0(names(buy30_weather[,2:31])[5],'~bad+sun+cloud+rain'), data=buy30_weather)
summary(fit5)
buy5 <- data.frame(fitted.values(fit5)[366:730])
names(buy5) <- names(buy30_weather[,2:31])[5]

summary(lm(paste0(names(buy30_weather[,2:31])[6],'~bad+sun+wind+cloud+rain+pm10'), data=buy30_weather))
fit6 <- lm(paste0(names(buy30_weather[,2:31])[6],'~bad+sun'), data=buy30_weather)
summary(fit6)
buy6 <- data.frame(fitted.values(fit6)[366:730])
names(buy6) <- names(buy30_weather[,2:31])[6]

summary(lm(paste0(names(buy30_weather[,2:31])[7],'~bad+sun+wind+cloud+rain+pm10'), data=buy30_weather))
fit7 <- lm(paste0(names(buy30_weather[,2:31])[7],'~sun+wind+cloud+rain+pm10'), data=buy30_weather)
summary(fit7)
buy7 <- data.frame(fitted.values(fit7)[366:730])
names(buy7) <- names(buy30_weather[,2:31])[7]

summary(lm(paste0(names(buy30_weather[,2:31])[8],'~bad+sun+wind+cloud+rain+pm10'), data=buy30_weather))
fit8 <- lm(paste0(names(buy30_weather[,2:31])[8],'~bad'), data=buy30_weather)
summary(fit8)
buy8 <- data.frame(fitted.values(fit8)[366:730])
names(buy8) <- names(buy30_weather[,2:31])[8]

summary(lm(paste0(names(buy30_weather[,2:31])[9],'~bad+sun+wind+cloud+rain+pm10'), data=buy30_weather))
fit9 <- lm(paste0(names(buy30_weather[,2:31])[9],'~sun+rain+pm10'), data=buy30_weather)
summary(fit9)
buy9 <- data.frame(fitted.values(fit9)[366:730])
names(buy9) <- names(buy30_weather[,2:31])[9]

summary(lm(paste0(names(buy30_weather[,2:31])[10],'~bad+sun+wind+cloud+rain+pm10'), data=buy30_weather))
fit10 <- lm(paste0(names(buy30_weather[,2:31])[10],'~bad+sun+cloud+rain+pm10'), data=buy30_weather)
summary(fit10)
buy10 <- data.frame(fitted.values(fit10)[366:730])
names(buy10) <- names(buy30_weather[,2:31])[10]

summary(lm(paste0(names(buy30_weather[,2:31])[11],'~bad+sun+wind+cloud+rain+pm10'), data=buy30_weather))
fit11 <- lm(paste0(names(buy30_weather[,2:31])[11],'~bad+sun+cloud'), data=buy30_weather)
summary(fit11)
buy11 <- data.frame(fitted.values(fit11)[366:730])
names(buy11) <- names(buy30_weather[,2:31])[11]

summary(lm(paste0(names(buy30_weather[,2:31])[12],'~bad+sun+wind+cloud+rain+pm10'), data=buy30_weather))
fit12 <- lm(paste0(names(buy30_weather[,2:31])[12],'~sun'), data=buy30_weather)
summary(fit12)
buy12 <- data.frame(fitted.values(fit12)[366:730])
names(buy12) <- names(buy30_weather[,2:31])[12]

summary(lm(paste0(names(buy30_weather[,2:31])[13],'~bad+sun+wind+cloud+rain+pm10'), data=buy30_weather))
fit13 <- lm(paste0(names(buy30_weather[,2:31])[13],'~sun+cloud+rain+pm10'), data=buy30_weather)
summary(fit13)
buy13 <- data.frame(fitted.values(fit13)[366:730])
names(buy13) <- names(buy30_weather[,2:31])[13]

summary(lm(paste0(names(buy30_weather[,2:31])[14],'~bad+sun+wind+cloud+rain+pm10'), data=buy30_weather))
fit14 <- lm(paste0(names(buy30_weather[,2:31])[14],'~0+bad+wind+pm10'), data=buy30_weather)
summary(fit14)
buy14 <- data.frame(fitted.values(fit14)[366:730])
names(buy14) <- names(buy30_weather[,2:31])[14]

summary(lm(paste0(names(buy30_weather[,2:31])[15],'~bad+sun+wind+cloud+rain+pm10'), data=buy30_weather))
# 모델이 유의하지않음

summary(lm(paste0(names(buy30_weather[,2:31])[16],'~bad+sun+wind+cloud+rain+pm10'), data=buy30_weather))
fit16 <- lm(paste0(names(buy30_weather[,2:31])[16],'~sun+cloud+pm10'), data=buy30_weather)
summary(fit16)
buy16 <- data.frame(fitted.values(fit16)[366:730])
names(buy16) <- names(buy30_weather[,2:31])[16]

summary(lm(paste0(names(buy30_weather[,2:31])[17],'~bad+sun+wind+cloud+rain+pm10'), data=buy30_weather))
fit17 <- lm(paste0(names(buy30_weather[,2:31])[17],'~bad+sun+cloud+rain+pm10'), data=buy30_weather)
summary(fit17)
buy17 <- data.frame(fitted.values(fit17)[366:730])
names(buy17) <- names(buy30_weather[,2:31])[17]

summary(lm(paste0(names(buy30_weather[,2:31])[18],'~bad+sun+wind+cloud+rain+pm10'), data=buy30_weather))
fit18 <- lm(paste0(names(buy30_weather[,2:31])[18],'~bad+pm10'), data=buy30_weather)
summary(fit18)
buy18 <- data.frame(fitted.values(fit18)[366:730])
names(buy18) <- names(buy30_weather[,2:31])[18]

summary(lm(paste0(names(buy30_weather[,2:31])[19],'~bad+sun+wind+cloud+rain+pm10'), data=buy30_weather))
fit19 <- lm(paste0(names(buy30_weather[,2:31])[19],'~0+sun+cloud+rain+pm10'), data=buy30_weather)
summary(fit19)
buy19 <- data.frame(fitted.values(fit19)[366:730])
names(buy19) <- names(buy30_weather[,2:31])[19]

summary(lm(paste0(names(buy30_weather[,2:31])[20],'~bad+sun+wind+cloud+rain+pm10'), data=buy30_weather))
fit20 <- lm(paste0(names(buy30_weather[,2:31])[20],'~sun+rain+pm10'), data=buy30_weather)
summary(fit20)
buy20 <- data.frame(fitted.values(fit20)[366:730])
names(buy20) <- names(buy30_weather[,2:31])[20]

summary(lm(paste0(names(buy30_weather[,2:31])[21],'~bad+sun+wind+cloud+rain+pm10'), data=buy30_weather))
fit21 <- lm(paste0(names(buy30_weather[,2:31])[21],'~bad'), data=buy30_weather)
summary(fit21)
buy21 <- data.frame(fitted.values(fit21)[366:730])
names(buy21) <- names(buy30_weather[,2:31])[21]

summary(lm(paste0(names(buy30_weather[,2:31])[22],'~bad+sun+wind+cloud+rain+pm10'), data=buy30_weather))
fit22 <- lm(paste0(names(buy30_weather[,2:31])[22],'~bad+sun+cloud'), data=buy30_weather)
summary(fit22)
buy22 <- data.frame(fitted.values(fit22)[366:730])
names(buy22) <- names(buy30_weather[,2:31])[22]

summary(lm(paste0(names(buy30_weather[,2:31])[23],'~bad+sun+wind+cloud+rain+pm10'), data=buy30_weather))
# 모델이 유의하지않음

summary(lm(paste0(names(buy30_weather[,2:31])[24],'~bad+sun+wind+cloud+rain+pm10'), data=buy30_weather))
fit24 <- lm(paste0(names(buy30_weather[,2:31])[24],'~bad+sun+pm10'), data=buy30_weather)
summary(fit24)
buy24 <- data.frame(fitted.values(fit24)[366:730])
names(buy24) <- names(buy30_weather[,2:31])[24]

summary(lm(paste0(names(buy30_weather[,2:31])[25],'~bad+sun+wind+cloud+rain+pm10'), data=buy30_weather))
fit25 <- lm(paste0(names(buy30_weather[,2:31])[25],'~bad+pm10'), data=buy30_weather)
summary(fit25)
buy25 <- data.frame(fitted.values(fit25)[366:730])
names(buy25) <- names(buy30_weather[,2:31])[25]

summary(lm(paste0(names(buy30_weather[,2:31])[26],'~bad+sun+wind+cloud+rain+pm10'), data=buy30_weather))
fit26 <- lm(paste0(names(buy30_weather[,2:31])[26],'~bad+sun+cloud+rain'), data=buy30_weather)
summary(fit26)
buy26 <- data.frame(fitted.values(fit26)[366:730])
names(buy26) <- names(buy30_weather[,2:31])[26]

summary(lm(paste0(names(buy30_weather[,2:31])[27],'~bad+sun+wind+cloud+rain+pm10'), data=buy30_weather))
fit27 <- lm(paste0(names(buy30_weather[,2:31])[27],'~bad+wind'), data=buy30_weather)
summary(fit27)
buy27 <- data.frame(fitted.values(fit27)[366:730])
names(buy27) <- names(buy30_weather[,2:31])[27]

summary(lm(paste0(names(buy30_weather[,2:31])[28],'~bad+sun+wind+cloud+rain+pm10'), data=buy30_weather))
fit28 <- lm(paste0(names(buy30_weather[,2:31])[28],'~bad'), data=buy30_weather)
summary(fit28)
buy28 <- data.frame(fitted.values(fit28)[366:730])
names(buy28) <- names(buy30_weather[,2:31])[28]

summary(lm(paste0(names(buy30_weather[,2:31])[29],'~bad+sun+wind+cloud+rain+pm10'), data=buy30_weather))
fit29 <- lm(paste0(names(buy30_weather[,2:31])[29],'~sun+wind+rain+pm10'), data=buy30_weather)
summary(fit29)
buy29 <- data.frame(fitted.values(fit29)[366:730])
names(buy29) <- names(buy30_weather[,2:31])[29]

summary(lm(paste0(names(buy30_weather[,2:31])[30],'~bad+sun+wind+cloud+rain+pm10'), data=buy30_weather))
fit30 <- lm(paste0(names(buy30_weather[,2:31])[30],'~sun+cloud+pm10'), data=buy30_weather)
summary(fit30)
buy30 <- data.frame(fitted.values(fit30)[366:730])
names(buy30) <- names(buy30_weather[,2:31])[30]



# 각각의 상품들의 예측값들을 하나의 데이터셋으로 만들기
# 15번째와 23번째 모델링이 되지 않았기에 두개를 제외한 28개의 제품
# sns에 8번째 상품 또한 모델링이 되지않아 제거하고 총 27개의 상품을 합친 데이터셋 만들기
buyss <- c()
for(i in c(1:7, 9:14, 16:22, 24:30)){
  buyss <- (paste(buyss, paste0('buy', i), sep=','))
}
buyss <- sub(',', '', buyss)
buyss

pred_buy <- cbind(buy1,buy2,buy3,buy4,buy5,buy6,buy7,buy9,buy10,buy11,buy12,buy13,buy14,buy16,buy17,buy18,buy19,buy20,buy21,buy22,buy24,buy25,buy26,buy27,buy28,buy29,buy30)
str(pred_buy)

row.names(pred_buy) <- NULL
View(pred_buy)


# 예측 데이터 저장
write.csv(pred_buy, 'pred_buy.csv', fileEncoding = 'UTF-8')

