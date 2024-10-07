# Weather Forecast App

Hello, welcome to my code
Its an app to test my abilities using flutter in diferent ways to make an APP \
There are some tasks to finish that im currently doing \
I hope you like the app :)


## Functionalities:
- Users should be able to search for a city. (check)
- Display current weather data (temperature, humidity, wind speed, etc.) for the searched city. (check)
- Show a 3-day weather forecast for the selected city, including temperature highs and lows, and general weather conditions. (check)
- Users should be able to mark cities as "Favorites" and view them in a dedicated screen.(check)
- Persist the list of favorite cities locally.(check)
- Remove the city weather that was saved locally
- Implement proper error handling for scenarios like failed API calls, empty search results, and invalid city names.(doing)
- Ensure the app can load previously viewed weather data when offline.(check)
- Get some decoration from any site and apply in app weather(check, buit its a basic style)

# Base Url & Endpoint
    - Base Url: [api.weatherapi.com](https://api.weatherapi.com/v1/)
    - /current.json
    - /forecast.json

## Architecture
    - Presenter:
        - Screen -> Pages used in app
        - State (BLoC) -> state management
        - Widget -> Widget shared in pages
    - Domain
        - Usecase -> Usecase for each call in app
        - Params -> Params used in functions
        - Abstract Repostirory -> repositories Abstracts
    - Data
        - Model -> The Data´s model
        - Impl Repostirory -> repository Implementation 
        - Impl Datasource -> Datasource Implementation
        - Abstract datasource -> datasource Abstracts

## Offline Module
- Turn off the internet of phone to go to Offline Module
- It will show a modal to go to offline saved waeather


## Some libs:
- BLoC
- Dio
- Flutter Modular
- DartZ
- SQLite

# Weather Forecast App Images

## Folder structure: 

- Structure modules:
 ![Alt Text](https://i.ibb.co/K5y9BqK/structre-folders.png) 
- Core:
 ![Alt Text](https://i.ibb.co/QpZwjcr/core-folder.png) 
- Shared:
 ![Alt Text](https://i.ibb.co/RYt24zN/shared-folder.png) 

## Pages:
- WelcomePage
![Alt Text](https://i.ibb.co/N7GCyVD/home-page.png) 
- WeatherPage
![Alt Text](https://i.ibb.co/FDB9Lyy/weather-page.png) 
- ForecastPage(1)
![Alt Text](https://i.ibb.co/gJSb9Z7/forecast-1.png) 
- ForecastPage(2)
![Alt Text](https://i.ibb.co/YQcG34j/forecast-2.png) 
- Offline Model detect
![Alt Text](https://i.ibb.co/CbxThJD/internet-detect.png) 
- Offline Model detect
![Alt Text](https://i.ibb.co/0CTr3mK/offline-page.png) 
- Offline Model detect
![Alt Text](https://i.ibb.co/db24Yty/offline-saved-city.png) 

# Developers 
- Just me, connect with me on LinkedIn :)
- [linkedin - Renan Volpe](https://www.linkedin.com/in/renanvolpe/)





