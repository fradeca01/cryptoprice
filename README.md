# Cryptorpice

This is an *R package*. 
***
To install this *package* in **R** run this command:

```
devtools::install_github("fradeca01/cryptoprice")
```

This package can be used to retrieve the historical price of a cryptoccurency. For example:

```
library(cryptoprice)

btcId = get_token_id("btc")
btcPrice = get_token_price(btcId, 90, "daily")
```
Note: *This package works through CoinGecko API. This API has a limit of 100 calls/minute*
