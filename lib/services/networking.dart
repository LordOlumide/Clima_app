import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:clima/auth/keys.dart';

class NetworkHelper {
  Locator userLocation;
  String openWeatherMapsUrl = 'https://api.openweathermap.org/data/2.5/weather';

  void getCurrentLocation() async {
    userLocation = Locator();
    await userLocation.getLocation();
  }

  Future<dynamic> getCityWeather(String inputCity) async {
    Uri url = Uri.parse('$openWeatherMapsUrl?q=$inputCity'
        '&appid=${Keys.apiKey}&units=metric');

    dynamic weatherData = await getResponse(url: url);
    return weatherData;
  }

  Future<dynamic> getWeatherData() async {
    await getCurrentLocation();

    Uri url = Uri.parse('$openWeatherMapsUrl?lat=${userLocation.latitude}'
        '&lon=${userLocation.longitude}'
        '&appid=${Keys.apiKey}&units=metric');

    dynamic weatherData = await getResponse(url: url);
    return weatherData;
  }

  Future<dynamic> getResponse({Uri url}) async {
    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        var data = response.body;
        var decodedData = jsonDecode(data);
        return decodedData;
      } else {
        // print(response.statusCode);
        return;
      }
    } catch (e) {
      // print(e.toString());
      return;
    }
  }

  Map dummyData = {
    'coord': {'lon': 28.3443, 'lat': 28.3999},
    'weather': [
      {
        'id': 804,
        'main': 'Clouds',
        'description': 'overcast clouds',
        'icon': '04d'
      }
    ],
    'base': 'stations',
    'main': {
      'temp': 24.28,
      'feels_like': 24.98,
      'temp_min': 24.28,
      'temp_max': 24.28,
      'pressure': 1010,
      'humidity': 85,
      'sea_level': 1010,
      'grnd_level': 972
    },
    'visibility': 10000,
    'wind': {'speed': 0.88, 'deg': 246, 'gust': 2.68},
    'clouds': {'all': 100},
    'dt': 1652203446,
    'sys': {'country': 'Wakanda', 'sunrise': 1652160182, 'sunset': 1652204905},
    'timezone': 3600,
    'id': 2350841,
    'name': 'Hundefi',
    'cod': 200
  };
}
