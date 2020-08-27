
# frescoから読み込んだデータを解析用に加工

require(tidyverse)

dirname = "C:/Users/00007802/Dropbox/saba_egg/2020"
setwd(dir=dirname)

df0 = read.table("spawn_onelump.txt",header=T,skip=10,sep="\t")
# Error in scan(file = file, what = what, sep = sep, quote = quote, dec = dec,  : 
#                 line 34893 did not have 38 elements
# というerrorが出るので、その手前の行まで読み込み
df0 = read.table("spawn_onelump.txt",header=T,skip=10,sep="\t",nrows=34892)

colnames(df0)

head(df0)

df1 = df0 %>% dplyr::select("年","月","緯度","経度","海域面積","海区番号","まさば平均卵密度","ごまさば平均卵密度","さば類平均水温","さば類平均塩分")
df1 = df1 %>% rename(year="年",month="月",Lat="緯度",Lon="経度",area="海域面積",area_no="海区番号",
                     chub="まさば平均卵密度",spotted="ごまさば平均卵密度",mean_SST="さば類平均水温",mean_salinity="さば類平均塩分")
df2 = df1 %>% 
  mutate(chub=if_else(is.na(chub),0,chub),spotted=if_else(is.na(spotted),0,spotted)) %>% # replace NA by 0
  mutate(lat = floor(Lat)+if_else(Lat %% 1 > 0, 0.5, 0.0),
         lon = floor(Lon)+if_else(Lon %% 1 > 0, 0.5, 0.0)) %>% #10進法に変換
  select(-Lon,-Lat) %>%
  select(year,month,lat,lon,area,area_no,chub,spotted,mean_SST,mean_salinity)

write.csv(df2,file="df_egg_saba2020.csv")


