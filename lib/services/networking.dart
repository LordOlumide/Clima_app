import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  Locator userLocation;
  String _apiKey = '33a118c38add3c2588a10e11dd3809b9';

  void getLocation() async {
    userLocation = Locator();
    await userLocation.getLocation();
  }

  Future<Map> getWeatherData() async {
    await getLocation();

    Uri url = Uri.parse('https://api.openweathermap.org/data/2.5/weather'
        '?lat=${userLocation.latitude}&lon=${userLocation.longitude}'
        '&appid=$_apiKey&units=metric');
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      var data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      print(response.statusCode);
      return {
        'temperature': '--',
        'condition': '--',
        'cityName': 'Error',
      };
    }
  }

  // Dummy Data for tests without internet connection

  Uri dummyUri = Uri.parse('https://api.openweathermap.org/data/2.5/weather'
      '?lat=7.1891891891891895&lon=5.175825758563295'
      '&appid=33a118c38add3c2588a10e11dd3809b9&units=metric');

  Map dummyData = {
    'coord': {'lon': 5.1758, 'lat': 7.1892},
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
    'sys': {'country': 'NG', 'sunrise': 1652160182, 'sunset': 1652204905},
    'timezone': 3600,
    'id': 2350841,
    'name': 'Akure',
    'cod': 200
  };
}
