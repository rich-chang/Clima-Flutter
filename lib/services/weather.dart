import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const String apuUrl = 'https://api.openweathermap.org/data/2.5/weather';
const String apiKey = '';

class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelp = NetworkHelper(
        '$apuUrl?q=$cityName&units=metric&appid=$apiKey');
    var weatherData = await networkHelp.getData();

    return weatherData;
  }

  Future<dynamic> getWeatherData() async {
    LocationService ls = LocationService();
    await ls.getCurrentLocation();

    NetworkHelper networkHelp = NetworkHelper(
        '$apuUrl?lat=${ls.latitude}&lon=${ls.longitude}&units=metric&appid=$apiKey');
    var weatherData = await networkHelp.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
