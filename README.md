
# 🌤️ Weather Forecast App

Welcome! 👋 This app is a showcase of my Flutter development skills.  
I’m still working on some parts, but here’s what’s already implemented. I hope you enjoy it! 😊

---

## ✅ Functionalities

- 🔍 Search for a city
- 🌡️ Display current weather: temperature, humidity, wind speed
- 📅 3-day weather forecast with highs/lows and general conditions
- ⭐ Favorite cities with a dedicated view
- 💾 Persist favorites locally
- 🗑️ Remove saved city weather
- ❌ Proper error handling (in progress)
- 📶 Load previous weather data offline
- 🎨 Basic visual decorations added

---

## 🔗 Base URL & Endpoints

- **Base URL**: [api.weatherapi.com](https://api.weatherapi.com/v1/)
- `/current.json`
- `/forecast.json`

---

## 🧱 Architecture

```
Presenter/
    ├── Screen         # Pages used in the app
    ├── State (BLoC)   # State management
    └── Widget         # Shared widgets

Domain/
    ├── Usecase        # Usecases for app logic
    ├── Params         # Parameters for usecases
    └── Abstract Repo  # Repository interfaces

Data/
    ├── Model          # Data models
    ├── Impl Repo      # Repository implementations
    ├── Impl Datasource# Data source implementations
    └── Abstract DS    # Data source interfaces
```

---

## 📴 Offline Module

> 💡 Turn off your internet connection to trigger the offline module.  
A modal will appear allowing access to previously saved weather data.

---

## 🧰 Libraries Used

- `flutter_bloc`
- `dio`
- `flutter_modular`
- `dartz`
- `sqlite`

---

## 🖼️ Weather Forecast App Images

### 📁 Folder Structure
- Modules:  
  ![Structure Modules](https://i.ibb.co/K5y9BqK/structre-folders.png)

- Core:  
  ![Core Folder](https://i.ibb.co/QpZwjcr/core-folder.png)

- Shared:  
  ![Shared Folder](https://i.ibb.co/RYt24zN/shared-folder.png)

### 📄 Pages

| Welcome Page | Weather Page | Forecast Page 1 | Forecast Page 2 |
| :----------: | :----------: | :-------------: | :-------------: |
| ![Welcome](https://i.ibb.co/N7GCyVD/home-page.png) | ![Weather](https://i.ibb.co/FDB9Lyy/weather-page.png) | ![Forecast 1](https://i.ibb.co/gJSb9Z7/forecast-1.png) | ![Forecast 2](https://i.ibb.co/YQcG34j/forecast-2.png) |

| Internet Detect Modal | Offline Page | Offline Saved Cities | |
| :-------------------: | :----------: | :-------------------: | :--: |
| ![Detect](https://i.ibb.co/CbxThJD/internet-detect.png) | ![Offline Page](https://i.ibb.co/0CTr3mK/offline-page.png) | ![Saved Offline](https://i.ibb.co/db24Yty/offline-saved-city.png) | |

---

## 👨‍💻 Developer

Just me — connect with me on [LinkedIn](https://www.linkedin.com/in/renanvolpe/)!  
Thanks for checking out the app. 😄

