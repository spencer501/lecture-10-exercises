### Exercise 1: Get your favorite Band's bio from the Echonest API ###
library(jsonlite)

# Create a variable `api_key` that stores your api key
# Register your own API key here: https://developer.echonest.com/account/register
api_key <- 'VKUDRIQRKIPBPZIGM'

# Create a variable that stores the name of your favorite artist
fav_artist <- 'Chance the Rapper'

# Substitute the spaces in your band-name with '+'s using the `gsub` function
fav_artist <- gsub(' ', '+', fav_artist)

# Construct a seach query to hit the api.
# See documentation/examples: http://developer.echonest.com/docs/v4/artist.html#biographies
base_url <- 'http://developer.echonest.com/api/v4/artist/biographies?api_key='
bio_query <- paste0(base_url, api_key, "&name=", fav_artist, '&format=json')

# Use fromJSON to retrieve the results
artist_data <- fromJSON(bio_query)

# Get the text of the (best) biography available
class(artist_data)
artist_data <- as.data.frame(artist_data)
bio <- artist_data$response.biographies.text[artist_data$response.biographies.site == 'last.fm']
