import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/services/networking.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  final dynamic locationWeather;
  LocationScreen({this.locationWeather});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int temperature;
  String conditionEmoji;
  String message;
  String cityName;

  dynamic locationWeather;

  void setToErrorScreen() {
    temperature = 0;
    message = 'Internet Error';
    cityName = 'Err';
    conditionEmoji = 'Error';
  }

  void updateUi(weatherData) {
    setState(() {
      if (weatherData != null) {
        double temp = weatherData['main']['temp'];
        temperature = temp.toInt();

        WeatherModel weatherModel = WeatherModel();
        int conditionInt = weatherData['weather'][0]['id'];
        conditionEmoji = weatherModel.getWeatherIcon(conditionInt);
        message = weatherModel.getMessage(temperature);
        cityName = weatherData['name'];
      } else {
        setToErrorScreen();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    locationWeather = widget.locationWeather;
    updateUi(locationWeather);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      locationWeather = await NetworkHelper().getWeatherData();
                      updateUi(locationWeather);
                      // print('Current locationWeather updated');
                    },
                    child: Icon(
                      Icons.near_me,
                      color: Colors.white,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      dynamic inputCity = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CityScreen()),
                      );
                      if (inputCity == null) return;
                      dynamic weatherData =
                          await NetworkHelper().getCityWeather(inputCity);
                      // print(weatherData);
                      updateUi(weatherData);
                    },
                    child: Icon(
                      Icons.location_city,
                      color: Colors.white,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$conditionEmoji',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$cityName: $message.",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// weatherData['temperature'] = datasetToBeUsed['main']['temp'];
// weatherData['condition'] = datasetToBeUsed['weather'][0]['id'];
// weatherData['cityName'] = datasetToBeUsed['name'];
