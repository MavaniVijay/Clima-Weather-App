import 'package:clima_app/location.dart';
import 'package:clima_app/networking.dart';

const apiKey =
    '61949f5e9b1373e6c38f8699f640482c'; //1. step api key is make and variable final use it
const openWeatherUrl = 'http://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper =
        NetworkHelper('$openWeatherUrl?q=$cityName&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getdata();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(//create a=the a object.
        //5. netwoek helper make object anc url past here and var make a variable in netwoek helper
        'openWeatherUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getdata();

    return weatherData;
  }
}

String getWeatherIcon(int condition) {
  if (condition < 300) {
    return '๐ฉ';
  } else if (condition < 400) {
    return '๐ง';
  } else if (condition < 600) {
    return 'โ๏ธ';
  } else if (condition < 700) {
    return 'โ๏ธ';
  } else if (condition < 800) {
    return '๐ซ';
  } else if (condition == 800) {
    return 'โ๏ธ';
  } else if (condition <= 804) {
    return 'โ๏ธ';
  } else {
    return '๐คทโ';
  }
}

String getMessage(int temp) {
  if (temp > 25) {
    return 'It\'s ๐ฆ time';
  } else if (temp > 20) {
    return 'Time for shorts and ๐';
  } else if (temp < 10) {
    return 'You\'ll need ๐งฃ and ๐งค';
  } else {
    return 'Bring a ๐งฅ just in case';
  }
}
