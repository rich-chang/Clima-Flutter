import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double longitude;
  double latitude;

  void getLocationData() async {
    print("getLocation");
    WeatherModel wm = WeatherModel();
    var weatherData = await wm.getWeatherData();
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
