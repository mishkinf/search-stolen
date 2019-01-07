# search-stolen
A script to help you search for items that were stolen from you

## Instructions:

### 1. Install gem dependencies
```bundle install```

### 3. Edit the items to search for inside of search_stolen.rb
### 4. Edit the ZIP_CODE, LATITUDE and LONGITUDE data to match your own location

### 5. Open a terminal and run one of the following commands
```
> ruby search_stolen.rb craigslist
> ruby search_stolen.rb facebook
> ruby search_stolen.rb offerup
> ruby search_stolen.rb ebay 10

# Command Line Interface:
> ruby search_stolen.rb <website> <miles from location to search>
```

## Recommended Usage:
Start searching closer to your geographic location and fan outwards by increasing the miles from your current location to cast a wider net