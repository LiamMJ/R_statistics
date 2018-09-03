# 13-3. 상관분석 - 두 변수의 관계성 분석

# 실업자 수와 개인 소비 지출의 상관관계

# 데이터 준비 
economics <- as.data.frame(ggplot2::economics)

# 상관분석 
cor.test(economics$unemploy, economics$pce)

# 상관행렬 히트맵 만들기
# • 상관행렬(Correlation Matrix)
# – 여러 변수 간 상관계수를 행렬로 타나낸 표
# – 어떤 변수끼리 관련이 크고 적은지 파악할 수 있음

# 데이터 준비 
head(mtcars)

# 상관행렬 만들기 
car_cor <- cor(mtcars) # 상관행렬 생성 
round(car_cor, 2) # 소수점 셋째 자리에서 반올림해서 출력

# 상관행렬 히트맵 만들기
#• 히트맵(heat map) : 값의 크기를 색깔로 표현한 그래프 
install.packages("corrplot")
library(corrplot)

corrplot(car_cor)

# 원 대신 상관계수 표시 
corrplot(car_cor, method = "number")

# 다양한 파라미터 지정하기 
col <- colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA")) 
corrplot(car_cor, method = "color", # 색깔로 표현 
         col = col(200), # 색상 200개 선정 
         type = "lower", # 왼쪽 아래 행렬만 표시 
         order = "hclust", # 유사한 상관계수끼리 군집화 
         addCoef.col = "black", # 상관계수 색깔 
         tl.col = "black", # 변수명 색깔 
         tl.srt = 45, # 변수명 45도 기울임 
         diag = F) # 대각 행렬 제외