## 令和元 (2019) 年度ゴマサバ太平洋系群の資源評価　補足資料3のコード
* ゴマサバの卵密度は2018年に急増したが，この増加はマサバ卵が混在することでゴマサバの卵密度が過大推定されている可能性があった
* そのため，2018年以降の卵密度データはチューニング指数として使用できなかった
* このマサバ・ゴマサバ卵の誤同定問題を解決するために，VASTを用いた産卵量指標値の標準化を行った
  * "マサバ卵が多いとゴマサバ卵の採集率が高くなる"と考え，マサバの卵密度をcatchability covariateに入れた
  * 年と月の交互作用をoverdispersion configに入れた
* その結果，2018年のゴマサバ卵の急増は下方修正された．また，マサバの卵密度を考慮した推定産卵量指標値を用いると，資源量推定値のレトロバイアスが大きく改善された．

## コードの詳細
* estimation
  * vastのコード．catchability covariateや年と月の交互作用の入れ方の参考になる
* figures
  * 補足資料の図を作成するために用いたコード