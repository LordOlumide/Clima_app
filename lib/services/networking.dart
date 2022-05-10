import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  Locator userLocation;
  String _apiKey = '33a118c38add3c2588a10e11dd3809b9';

  void getLocation() async {
    userLocation = Locator();
    await userLocation.getLocation();
    userLocation.latitude != null
        ? print('Location getting worked!')
        : print('Location getting did not work.');
    print(userLocation.latitude);
    print(userLocation.longitude);
  }

  void getWeatherData() async {
    await getLocation();

    Uri dummyUri = Uri.parse('https://api.openweathermap.org/data/2.5/weather'
        '?lat=7.1891891891891895&lon=5.175825758563295'
        '&appid=33a118c38add3c2588a10e11dd3809b9');

    Uri url = Uri.parse('https://api.openweathermap.org/data/2.5/weather'
        '?lat=${userLocation.latitude}&lon=${userLocation.longitude}'
        '&appid=$_apiKey');
    http.Response response = await http.get(dummyUri);

    var data = response.body;
    var decodedData = jsonDecode(data);

    print(decodedData);
    print(dummyData);
  }
}

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
    'temp': 298.49,
    'feels_like': 299.17,
    'temp_min': 298.49,
    'temp_max': 298.49,
    'pressure': 1008,
    'humidity': 80,
    'sea_level': 1008,
    'grnd_level': 971
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
