# sky_cast

### Important Note
I will provide the `.env` file separately.


## API USED
- OpenWeatherMap

## Approach
1. **Clean Architecture**: Sep`arated the project into Domain, Data, and Presentation layers.  
2. **Domain Layer**: Created `WeatherEntity`, `ForecastEntity`, and `TemperatureVO` with unit tests to ensure core logic works.  
3. **Data Layer**: Implemented `CurrentWeatherRepoImpl` using a remote source, mapping DTOs to entities, with error handling via `ErrorWrapper`.  
4. **Use Cases**: Created `GetCurrentWeatherUseCase` to fetch current weather from the repository, with unit tests.  
5. **State Management**: Used Riverpod for managing state in a scalable and maintainable way across the app.  
6. **Testing**: Used `mocktail` to mock dependencies and `flutter_test` for assertions.  
7. **Location Feature**: Used `geolocator` to fetch user location for current weather queries. Permissions handled appropriately.  
8. **Assumptions**:  
   - API returns data in standard OpenWeatherMap JSON format.  
   - Temperature is stored internally in Kelvin.  
   - Date/time is in UNIX timestamp in seconds.



### Core Functionality (Mandatory)
1. **City Selection/Search Screen**: Users can type a city name and trigger a search for its weather data.
2. **Current Weather Display Screen**: Shows:
   - City Name
   - Current Temperature (with Celsius/Fahrenheit/Kelvin toggle)
   - Weather Condition and corresponding icon
   - Forecast:
     - Hourly forecast every 3 hours for the current day
     - Daily forecast for the next 3–5 days with Date, Time, Temperature, and Weather Condition icons
3. **Weather API Integration**: Used OpenWeatherMap for fetching current weather and forecast data.
4. **Error Handling & Loading States**: 
   - Display user-friendly error messages
   - Retry option for network errors

### Enhancements Implemented
1. **State Management**: Used Riverpod for managing state in a clean and scalable way.
2. **Unit Tests**: Wrote unit tests for:
   - Domain entities (`WeatherEntity`, `ForecastEntity`, `TemperatureVO`)
   - Repository (`CurrentWeatherRepoImpl`)
   - Use Case (`GetCurrentWeatherUseCase`)
3. **Dynamic UI Theming**: Background changes based on current weather condition.
4. **Geolocation**: Used `geolocator` to fetch the user's current location and display its weather on app start. Permissions handled appropriately.
