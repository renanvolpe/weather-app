const locationMock = {
  "location": {
    "name": "Sao Jose Dos Campos",
    "region": "Sao Paulo",
    "country": "Brazil",
    "lat": -23.18,
    "lon": -45.88,
    "tz_id": "America/Sao_Paulo",
    "localtime_epoch": 1726496950,
    "localtime": "2024-09-16 11:29"
  }
};

const currentMock = {
  "current": {
    "last_updated_epoch": 1726496100,
    "last_updated": "2024-09-16 11:15",
    "temp_c": 21.2,
    "temp_f": 70.2,
    "is_day": 1,
    "condition": {"text": "Partly cloudy", "icon": "//cdn.weatherapi.com/weather/64x64/day/116.png", "code": 1003},
    "wind_mph": 9.2,
    "wind_kph": 14.8,
    "wind_degree": 202,
    "wind_dir": "SSW",
    "pressure_mb": 1021.0,
    "pressure_in": 30.15,
    "precip_mm": 0.08,
    "precip_in": 0.0,
    "humidity": 78,
    "cloud": 25,
    "feelslike_c": 21.2,
    "feelslike_f": 70.2,
    "windchill_c": 20.3,
    "windchill_f": 68.6,
    "heatindex_c": 20.3,
    "heatindex_f": 68.6,
    "dewpoint_c": 16.1,
    "dewpoint_f": 61.1,
    "vis_km": 10.0,
    "vis_miles": 6.0,
    "uv": 6.0,
    "gust_mph": 10.6,
    "gust_kph": 17.0
  }
};

const sjcMock = {...locationMock, ...currentMock};
