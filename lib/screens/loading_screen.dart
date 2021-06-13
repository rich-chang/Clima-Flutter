import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const String apiKey = '1e72f5a0c48844a09ba5f2202930470c';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double longitude;
  double latitude;

  void getLocationData() async {
    print("getLocation");
    LocationService ls = LocationService();
    await ls.getCurrentLocation();

    NetworkHelper networkHelp = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${ls.latitude}&lon=${ls.longitude}&units=metric&appid=$apiKey');
    var weatherData = await networkHelp.getData();

    //Future.delayed(Duration(milliseconds: 0), () {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
    //});
  }

  @override
  void initState() {
    // TODO: implement deactivate
    super.initState();
    print("initState");
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    print("build");

    return Scaffold(
      body: Center(
          child: SpinKitDoubleBounce(
        color: Colors.white,
        size: 100.0,
      )),
    );
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("deactivate");
  }
}
