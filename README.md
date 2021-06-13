# Cryptorpice

This is an *R package*. To install this *package* in **RStudio** run this command:

```
devtools::install_github("fradeca01/cryptoprice")
```

This package can be used to retrieve the historical price of a cryptoccurency. For example:

```
library(cryptoprice)

btcId = get_token_id("btc")
btcPrice = get_token_price(btcId, 90, "daily")
```
