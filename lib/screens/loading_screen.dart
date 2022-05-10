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
    getWeatherData();
  }

  void getWeatherData() {
    NetworkHelper networkHelper = NetworkHelper();
    networkHelper.getWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  getWeatherData();
                },
                child: Text('Get Weather Data'),
              ),
            ),
            const SpinKitSpinningLines(
              color: Colors.white,
              size: 150.0,
            ),
          ],
        ),
      ),
    );
  }
}
