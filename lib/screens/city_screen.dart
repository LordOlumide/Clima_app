import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String inputCity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 50.0,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.location_city),
                    hintText: 'Enter city name',
                  ),
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  onChanged: (input) {
                    inputCity = input;
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, inputCity);
                },
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.black.withOpacity(0.4)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
