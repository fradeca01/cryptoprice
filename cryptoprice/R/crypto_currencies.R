#' Get Token Id
#'
#' This function can be used to get an id which can be used in get_token_price() method.
#' @param symbol The cryptocurrency symbol in lowercase
#' @return The cryptocurrency ID
#' @examples
#' btcID = get_token_id("btc");
#' bnbID = get_token_id("bnb");
#' @export
get_token_id = function(symbol){
  x = symbol
  dplyr::filter(coinList,symbol == x)$id
}

#' Get Token Price
#'
#' This function can be used to get the price in time of a cryptocurrency.
#' @param id The cryptocurrency id, get it with get_token_id() method
#' @param days The days in the past since you want to get the data.
#' @param interval "daily" or "hourly", note that chosing "hourly" the max days returned are 90
#' @return A tibble containing the cryptocurrency history
#' @examples
#' btc = get_token_price("bitcoin");
#' bnb = get_token_price("binance-coin");
#' @export
get_token_price = function(id, days, interval){

  `%>%` = dplyr::`%>%`

  URL = paste("https://api.coingecko.com/api/v3/coins/",
              id,
              "/market_chart?vs_currency=usd&days=",
              days,"&interval=",
              interval,
              sep = "" )

  res = httr::GET(URL)

  a = jsonlite::fromJSON(rawToChar(res$content))$prices
  colnames(a) = c("timestamp", "price")

  price_table = dplyr::as_tibble(a)
  price_table = price_table %>%
    dplyr::mutate(timestamp = timestamp / 1000) %>%
    dplyr::mutate(dateTime = lubridate::as_datetime(timestamp), date = lubridate::as_date(dateTime), hour = as.POSIXlt(dateTime)$hour) %>%
    dplyr::select(dateTime, date, hour, price) %>%
    dplyr::arrange(dateTime)

  return(price_table)
}
