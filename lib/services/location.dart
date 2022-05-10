import 'package:geolocator/geolocator.dart';

class Locator {
  double latitude;
  double longitude;

  void getLocation() async {
    try {
      await Geolocator.requestPermission();
      Position position = await Geolocator
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      longitude = position.longitude;
      latitude = position.latitude;
    } catch (e) {
      print(e);
    }
  }
}