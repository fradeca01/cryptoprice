URL = "https://api.coingecko.com/api/v3/coins/list?include_platform=false"

res = httr::GET(URL)
coinList = dplyr::as_tibble(jsonlite::fromJSON(rawToChar(res$content)))


