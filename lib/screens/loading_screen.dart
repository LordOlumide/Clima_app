import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getWeatherDataAndPushToLocationScreen();
  }

  Future<Map> getWeatherDataAndPushToLocationScreen() async {
    NetworkHelper networkHelper = NetworkHelper();
    Map<dynamic, dynamic> weatherData = await networkHelper.getWeatherData();
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => LocationScreen(locationWeather: weatherData,)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: const SpinKitSpinningLines(
          color: Colors.white,
          size: 200.0,
        ),
      ),
    );
  }
}
