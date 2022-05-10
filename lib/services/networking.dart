import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  Locator userLocation;
  String _apiKey = '33a118c38add3c2588a10e11dd3809b9';

  void getLocation() async {
    userLocation = Locator();
    await userLocation.getLocation();
    userLocation.latitude != null ? print('Location getting worked!')
        : print('Location getting did not work.');
    print(userLocation.latitude);
    print(userLocation.longitude);
  }

  void getWeatherData() async {
    getLocation();
    Uri url = Uri.parse('https://api.openweathermap.org/data/2.5/weather'
        '?lat=${userLocation.latitude}&lon=${userLocation.longitude}'
        '&appid=$_apiKey');
    http.Response response = await http.get(url);
    var data = response.body;
    var decodedData = jsonDecode(data);

    print(data);
    print(decodedData);
  }
}