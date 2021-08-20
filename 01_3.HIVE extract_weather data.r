# 평균 전운량
cloud <- dbGetQuery(conn, 'select * from DB_AWS_CLOUD_DD 
                    where STN_ID == 108 and (TMA like "2018%" or TMA like "2019%")')
nrow(cloud)
str(cloud)
cloud <- cloud %>% select(db_aws_cloud_dd.tma, db_aws_cloud_dd.avg_tca) %>% arrange(db_aws_cloud_dd.tma)

write.csv(cloud, 'cloud.csv', fileEncoding = 'UTF-8')

# 평균 풍속
wind <- dbGetQuery(conn, 'select * from DB_AWS_WIND_DD 
                    where STN_ID == 108 and (TMA like "2018%" or TMA like "2019%")')
nrow(wind)
str(wind)
wind <- wind %>% select(db_aws_wind_dd.tma, db_aws_wind_dd.avg_ws) %>% arrange(db_aws_wind_dd.tma)

write.csv(wind, 'wind.csv', fileEncoding = 'UTF-8')

# 일사/일조 -> 1시간 최다 일사
sun <- dbGetQuery(conn, 'select * from DB_AWS_ICSR_SS_DD 
                    where STN_ID == 108 and (TMA like "2018%" or TMA like "2019%")')
nrow(sun)
str(sun)
sun <- sun %>% select(db_aws_icsr_ss_dd.tma, db_aws_icsr_ss_dd.hr1_max_icsr) %>% arrange(db_aws_icsr_ss_dd.tma)

write.csv(sun, 'sun.csv', fileEncoding = 'UTF-8')


# 평균 상대습도
rhm <- dbGetQuery(conn, 'select * from DB_AWS_RHM_DD 
                    where STN_ID == 108 and (TMA like "2018%" or TMA like "2019%")')
nrow(rhm)
str(rhm)
rhm <- rhm %>% select(db_aws_rhm_dd.tma, db_aws_rhm_dd.avg_rhm) %>% arrange(db_aws_rhm_dd.tma)

write.csv(rhm, '습도.csv', fileEncoding = 'UTF-8')


# 최심적설
DB_SFC_DSNW_DD
snow <- dbGetQuery(conn, 'select * from DB_SFC_DSNW_DD 
                    where STN_ID == 108 and (TMA like "2018%" or TMA like "2019%")')
nrow(snow)
str(snow)
snow <- snow %>% select(db_sfc_dsnw_dd.tma, db_sfc_dsnw_dd.dd_mes) %>% arrange(db_sfc_dsnw_dd.tma)

write.csv(snow, 'snow.csv', fileEncoding = 'UTF-8')

#평균 기온
a <- dbGetQuery(conn, 'select * from DB_SFC_TA_DD 
                    where STN_ID == 108 and (TMA like "2018%" or TMA like "2019%")')
nrow(a)
str(a)
ta <- a %>% select(db_sfc_ta_dd.tma, db_sfc_ta_dd.avg_ta, db_sfc_ta_dd.max_ta, db_sfc_ta_dd.min_ta) %>% arrange(db_sfc_ta_dd.tma)
ta <- ta %>% mutate(max_min = ta$db_sfc_ta_dd.max_ta - ta$db_sfc_ta_dd.min_ta)

write.csv(ta, '기온.csv', fileEncoding = 'UTF-8')

# 강수
rain <- dbGetQuery(conn, 'select * from DB_AWS_RN_DD 
                    where STN_ID == 108 and (TMA like "2018%" or TMA like "2019%")')
nrow(rain)
str(rain)
rain <- rain %>% select(db_aws_rn_dd.tma, db_aws_rn_dd.sum_rn) %>% arrange(db_aws_rn_dd.tma)

write.csv(rain, 'rain.csv', fileEncoding = 'UTF-8')

