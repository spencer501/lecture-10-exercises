### Exercise 1: Get your favorite Band's bio from the Echonest API ###
library(jsonlite)

# Create a variable `api_key` that stores your api key
# Register your own API key here: https://developer.echonest.com/account/register
api_key <- 'Y0SBZBEY1KHGBJKVR'

# Create a variable that stores the name of your favorite artist
artist <- 'Trampled+by+turtles'

# Construct a seach query to hit the api.
# See documentation/examples: http://developer.echonest.com/docs/v4/artist.html#biographies
base <- 'http://developer.echonest.com/api/v4/artist/biographies?api_key='
search <- paste0(base, api_key, '&name=', artist, '&results=1')

# Use fromJSON to retrieve the results
results <- fromJSON(search)

# Get the text of the (first) biography available
bio <- results$response$biographies$text