import 'package:geolocator/geolocator.dart';

class LocationService {
  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      print(position);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch(e) {
      print(e);
    }
  }

}