import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;
  Position position;

  Future<void> getCurrentLocation() async {
    try{
      LocationPermission permission = await requestPermission();
      // LocationPermission permission = await checkPermission();
      position = await GeolocatorPlatform.instance
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
      print(position);
    } catch(e) {
      print(e);
    }
  }
}