## weather_app

# Tasks
## City Search Functionality:
- Users should be able to search for a city. (check)
- Display current weather data (temperature, humidity, wind speed, etc.) for the searched city. (check)
## Weather Forecast:
- Show a 7-day weather forecast for the selected city, including temperature highs and lows, and general weather conditions. (check)
## Favorite Cities:
- Users should be able to mark cities as "Favorites" and view them in a dedicated screen.(check)
- Persist the list of favorite cities locally.(check)
- Remove the city weather that was saved locally
## Error Handling:
- Implement proper error handling for scenarios like failed API calls, empty search results, and invalid city names.
## Offline Support:
- Ensure the app can load previously viewed weather data when offline.
## UI/UX Feature
- Get some decoration from any site and apply in app weather

# Features App
- Public API: api.weatherapi.com
- Base Url: [api.weatherapi.com](https://api.weatherapi.com/v1/)
    ## endpoints:
    - /current.json
    - /forecast.json
## Clean Arch
    - Presenter:
        - 
    - Domain
        -
    - Data
        -

## Libs:
- BLoC
- Dio
- Flutter Modular
- DartZ
- SQLite
