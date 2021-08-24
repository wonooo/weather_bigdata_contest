# 데이터 불러오기
sns30_weather <- read.csv('sns30_weather2.csv', encoding = 'UTF-8')
sns30_weather <- sns30_weather[,-1]
str(sns30_weather)

# sns 최적회귀(유의확률 기반 변수선택법)
# 회귀분석을 통해 유의하지 않은 모델을 제거하고, 유의한 모델의 경우 유의한 변수들만 이용하여 모델링
# 상품별로 모델링하여 2019년도 예측값을 저장
'''
첫번째 줄: 변수 전체를 선택해 유의한 변수를 확인하는 코드
두번째 줄: 유의한 변수만 가지고 회귀모델을 만드는 코드
세번째 줄: 두번쨰 줄의 회귀모델을 확인하는 코드
네번째 줄: 확정된 회귀모델의 2019년 값을 예측하여 저장하는 코드
다섯번째 줄: 저장한 예측값에 대한 이름을 입력하는 코드
'''

summary(lm(paste0(names(sns30_weather[,2:31])[1],'~bad+sun+wind+cloud+rain+pm10'), data=sns30_weather))
fit_1 <- lm(paste0(names(sns30_weather[,2:31])[1],'~bad+wind+pm10'), data=sns30_weather)
summary(fit_1)
sns1 <- data.frame(fitted.values(fit_1)[366:730])
names(sns1) <- names(sns30_weather[,2:31])[1]

summary(lm(paste0(names(sns30_weather[,2:31])[2],'~bad+sun+wind+cloud+rain+pm10'), data=sns30_weather))
fit_2 <- lm(paste0(names(sns30_weather[,2:31])[2],'~bad+wind+pm10'), data=sns30_weather)
summary(fit_2)
sns2 <- data.frame(fitted.values(fit_2)[366:730])
names(sns2) <- names(sns30_weather[,2:31])[2]

summary(lm(paste0(names(sns30_weather[,2:31])[3],'~bad+sun+wind+cloud+rain+pm10'), data=sns30_weather))
fit_3 <- lm(paste0(names(sns30_weather[,2:31])[3],'~bad+sun+cloud+pm10'), data=sns30_weather)
summary(fit_3)
sns3 <- data.frame(fitted.values(fit_3)[366:730])
names(sns3) <- names(sns30_weather[,2:31])[3]

summary(lm(paste0(names(sns30_weather[,2:31])[4],'~bad+sun+wind+cloud+rain+pm10'), data=sns30_weather))
fit_4 <- lm(paste0(names(sns30_weather[,2:31])[4],'~bad+sun+wind+cloud'), data=sns30_weather)
summary(fit_4)
sns4 <- data.frame(fitted.values(fit_4)[366:730])
names(sns4) <- names(sns30_weather[,2:31])[4]

summary(lm(paste0(names(sns30_weather[,2:31])[5],'~bad+sun+wind+cloud+rain+pm10'), data=sns30_weather))
fit_5 <- lm(paste0(names(sns30_weather[,2:31])[5],'~sun+wind+cloud+rain+pm10'), data=sns30_weather)
summary(fit_5)
sns5 <- data.frame(fitted.values(fit_5)[366:730])
names(sns5) <- names(sns30_weather[,2:31])[5]

summary(lm(paste0(names(sns30_weather[,2:31])[6],'~bad+sun+wind+cloud+rain+pm10'), data=sns30_weather))
fit_6 <- lm(paste0(names(sns30_weather[,2:31])[6],'~bad+wind'), data=sns30_weather)
summary(fit_6)
sns6 <- data.frame(fitted.values(fit_6)[366:730])
names(sns6) <- names(sns30_weather[,2:31])[6]

summary(lm(paste0(names(sns30_weather[,2:31])[7],'~bad+sun+wind+cloud+rain+pm10'), data=sns30_weather))
fit_7 <- lm(paste0(names(sns30_weather[,2:31])[7],'~bad+wind'), data=sns30_weather)
summary(fit_7)
sns7 <- data.frame(fitted.values(fit_7)[366:730])
names(sns7) <- names(sns30_weather[,2:31])[7]

summary(lm(paste0(names(sns30_weather[,2:31])[8],'~bad+sun+wind+cloud+rain+pm10'), data=sns30_weather))
# 모델이 유의하지 않음

summary(lm(paste0(names(sns30_weather[,2:31])[9],'~bad+sun+wind+cloud+rain+pm10'), data=sns30_weather))
fit_9 <- lm(paste0(names(sns30_weather[,2:31])[9],'~wind+pm10'), data=sns30_weather)
summary(fit_9)
sns9 <- data.frame(fitted.values(fit_9)[366:730])
names(sns9) <- names(sns30_weather[,2:31])[9]

summary(lm(paste0(names(sns30_weather[,2:31])[10],'~bad+sun+wind+cloud+rain+pm10'), data=sns30_weather))
fit_10 <- lm(paste0(names(sns30_weather[,2:31])[10],'~bad+sun+cloud+rain+pm10'), data=sns30_weather)
summary(fit_10)
sns10 <- data.frame(fitted.values(fit_10)[366:730])
names(sns10) <- names(sns30_weather[,2:31])[10]

summary(lm(paste0(names(sns30_weather[,2:31])[11],'~bad+sun+wind+cloud+rain+pm10'), data=sns30_weather))
fit_11 <- lm(paste0(names(sns30_weather[,2:31])[11],'~bad+sun+cloud'), data=sns30_weather)
summary(fit_11)
sns11 <- data.frame(fitted.values(fit_11)[366:730])
names(sns11) <- names(sns30_weather[,2:31])[11]

summary(lm(paste0(names(sns30_weather[,2:31])[12],'~bad+sun+wind+cloud+rain+pm10'), data=sns30_weather))
fit_12 <- lm(paste0(names(sns30_weather[,2:31])[12],'~bad+wind'), data=sns30_weather)
summary(fit_12)
sns12 <- data.frame(fitted.values(fit_2)[366:730])
names(sns12) <- names(sns30_weather[,2:31])[12]

summary(lm(paste0(names(sns30_weather[,2:31])[13],'~bad+sun+wind+cloud+rain+pm10'), data=sns30_weather))
fit_13 <- lm(paste0(names(sns30_weather[,2:31])[13],'~bad+sun+wind+cloud'), data=sns30_weather)
summary(fit_13)
sns13 <- data.frame(fitted.values(fit_13)[366:730])
names(sns13) <- names(sns30_weather[,2:31])[13]

summary(lm(paste0(names(sns30_weather[,2:31])[14],'~bad+sun+wind+cloud+rain+pm10'), data=sns30_weather))
fit_14 <- lm(paste0(names(sns30_weather[,2:31])[14],'~bad+sun+wind+cloud+rain'), data=sns30_weather)
summary(fit_14)
sns14 <- data.frame(fitted.values(fit_14)[366:730])
names(sns14) <- names(sns30_weather[,2:31])[14]

summary(lm(paste0(names(sns30_weather[,2:31])[15],'~bad+sun+wind+cloud+rain+pm10'), data=sns30_weather))
fit_15 <- lm(paste0(names(sns30_weather[,2:31])[15],'~0+bad+sun+wind+cloud+rain'), data=sns30_weather)
summary(fit_15)
sns15 <- data.frame(fitted.values(fit_15)[366:730])
names(sns15) <- names(sns30_weather[,2:31])[15]

summary(lm(paste0(names(sns30_weather[,2:31])[16],'~bad+sun+wind+cloud+rain+pm10'), data=sns30_weather))
fit_16 <- lm(paste0(names(sns30_weather[,2:31])[16],'~bad+sun+cloud+rain'), data=sns30_weather)
summary(fit_16)
sns16 <- data.frame(fitted.values(fit_16)[366:730])
names(sns16) <- names(sns30_weather[,2:31])[16]

summary(lm(paste0(names(sns30_weather[,2:31])[17],'~bad+sun+wind+cloud+rain+pm10'), data=sns30_weather))
fit_17 <- lm(paste0(names(sns30_weather[,2:31])[17],'~bad+sun+cloud'), data=sns30_weather)
summary(fit_17)
sns17 <- data.frame(fitted.values(fit_17)[366:730])
names(sns17) <- names(sns30_weather[,2:31])[17]

summary(lm(paste0(names(sns30_weather[,2:31])[18],'~bad+sun+wind+cloud+rain+pm10'), data=sns30_weather))
fit_18 <- lm(paste0(names(sns30_weather[,2:31])[18],'~sun+cloud'), data=sns30_weather)
summary(fit_18)
sns18 <- data.frame(fitted.values(fit_18)[366:730])
names(sns18) <- names(sns30_weather[,2:31])[18]

summary(lm(paste0(names(sns30_weather[,2:31])[19],'~bad+sun+wind+cloud+rain+pm10'), data=sns30_weather))
fit_19 <- lm(paste0(names(sns30_weather[,2:31])[19],'~bad+sun+cloud+rain'), data=sns30_weather)
summary(fit_19)
sns19 <- data.frame(fitted.values(fit_19)[366:730])
names(sns19) <- names(sns30_weather[,2:31])[19]

summary(lm(paste0(names(sns30_weather[,2:31])[20],'~bad+sun+wind+cloud+rain+pm10'), data=sns30_weather))
fit_20 <- lm(paste0(names(sns30_weather[,2:31])[20],'~sun+cloud'), data=sns30_weather)
summary(fit_20)
sns20 <- data.frame(fitted.values(fit_20)[366:730])
names(sns20) <- names(sns30_weather[,2:31])[20]

summary(lm(paste0(names(sns30_weather[,2:31])[21],'~bad+sun+wind+cloud+rain+pm10'), data=sns30_weather))
fit_21 <- lm(paste0(names(sns30_weather[,2:31])[21],'~bad+sun+cloud+rain'), data=sns30_weather)
summary(fit_21)
sns21 <- data.frame(fitted.values(fit_21)[366:730])
names(sns21) <- names(sns30_weather[,2:31])[21]

summary(lm(paste0(names(sns30_weather[,2:31])[22],'~bad+sun+wind+cloud+rain+pm10'), data=sns30_weather))
fit_22 <- lm(paste0(names(sns30_weather[,2:31])[22],'~bad'), data=sns30_weather)
summary(fit_22)
sns22 <- data.frame(fitted.values(fit_22)[366:730])
names(sns22) <- names(sns30_weather[,2:31])[22]

summary(lm(paste0(names(sns30_weather[,2:31])[23],'~bad+sun+wind+cloud+rain+pm10'), data=sns30_weather))
fit_23 <- lm(paste0(names(sns30_weather[,2:31])[23],'~0+bad+sun+wind+cloud+rain'), data=sns30_weather)
summary(fit_23)
sns23 <- data.frame(fitted.values(fit_23)[366:730])
names(sns23) <- names(sns30_weather[,2:31])[23]

summary(lm(paste0(names(sns30_weather[,2:31])[24],'~bad+sun+wind+cloud+rain+pm10'), data=sns30_weather))
fit_24 <- lm(paste0(names(sns30_weather[,2:31])[24],'~bad+sun+wind+cloud+rain'), data=sns30_weather)
summary(fit_24)
sns24 <- data.frame(fitted.values(fit_24)[366:730])
names(sns24) <- names(sns30_weather[,2:31])[24]

summary(lm(paste0(names(sns30_weather[,2:31])[25],'~bad+sun+wind+cloud+rain+pm10'), data=sns30_weather))
fit_25 <- lm(paste0(names(sns30_weather[,2:31])[25],'~0+bad+sun+rain'), data=sns30_weather)
summary(fit_25)
sns25 <- data.frame(fitted.values(fit_25)[366:730])
names(sns25) <- names(sns30_weather[,2:31])[25]

summary(lm(paste0(names(sns30_weather[,2:31])[26],'~bad+sun+wind+cloud+rain+pm10'), data=sns30_weather))
fit_26 <- lm(paste0(names(sns30_weather[,2:31])[26],'~sun+cloud+rain'), data=sns30_weather)
summary(fit_26)
sns26 <- data.frame(fitted.values(fit_26)[366:730])
names(sns26) <- names(sns30_weather[,2:31])[26]

summary(lm(paste0(names(sns30_weather[,2:31])[27],'~bad+sun+wind+cloud+rain+pm10'), data=sns30_weather))
fit_27 <- lm(paste0(names(sns30_weather[,2:31])[27],'~bad'), data=sns30_weather)
summary(fit_27)
sns27 <- data.frame(fitted.values(fit_27)[366:730])
names(sns27) <- names(sns30_weather[,2:31])[27]

summary(lm(paste0(names(sns30_weather[,2:31])[28],'~bad+sun+wind+cloud+rain+pm10'), data=sns30_weather))
fit_28 <- lm(paste0(names(sns30_weather[,2:31])[28],'~bad+pm10'), data=sns30_weather)
summary(fit_28)
sns28 <- data.frame(fitted.values(fit_28)[366:730])
names(sns28) <- names(sns30_weather[,2:31])[28]

summary(lm(paste0(names(sns30_weather[,2:31])[29],'~bad+sun+wind+cloud+rain+pm10'), data=sns30_weather))
fit_29 <- lm(paste0(names(sns30_weather[,2:31])[29],'~bad+sun+wind+cloud'), data=sns30_weather)
summary(fit_29)
sns29 <- data.frame(fitted.values(fit_29)[366:730])
names(sns29) <- names(sns30_weather[,2:31])[29]

summary(lm(paste0(names(sns30_weather[,2:31])[30],'~bad+sun+wind+cloud+rain+pm10'), data=sns30_weather))
fit_30 <- lm(paste0(names(sns30_weather[,2:31])[30],'~bad+sun+cloud+rain'), data=sns30_weather)
summary(fit_30)
sns30 <- data.frame(fitted.values(fit_30)[366:730])
names(sns30) <- names(sns30_weather[,2:31])[30]



# 각각의 상품들의 예측값들을 하나의 데이터셋으로 만들기
# 8번째 모델링이 되지 않았기에 한개를 제외한 29개의 제품
# 구매이력에 15번째, 23번째 상품 또한 모델링이 되지않아 제거하고 총 27개의 상품을 합친 데이터셋 만들기
snssss <- c()
for(i in c(1:7, 9:14, 16:22, 24:30)){
  snssss <- (paste(snssss, paste0('sns', i), sep=','))
}
snssss <- sub(',', '', snssss)
snssss

pred_sns <- c()
pred_sns <- cbind(sns1,sns2,sns3,sns4,sns5,sns6,sns7,sns9,sns10,sns11,sns12,sns13,sns14,sns16,sns17,sns18,sns19,sns20,sns21,sns22,sns24,sns25,sns26,sns27,sns28,sns29,sns30)
str(pred_sns)
row.names(pred_sns) <- NULL
View(pred_sns)

# 예측 데이터 저장
write.csv(pred_sns, 'pred_sns.csv', fileEncoding = 'UTF-8')
