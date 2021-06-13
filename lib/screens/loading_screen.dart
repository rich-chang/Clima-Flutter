import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';

const String apiKey = '1e72f5a0c48844a09ba5f2202930470c';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double longitude;
  double latitude;

  void getLocationData () async {
    print("getLocation");
    LocationService ls = LocationService();
    await ls.getCurrentLocation();
    longitude = ls.longitude;
    latitude = ls.latitude;

    NetworkHelper networkHelp = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    var weatherData = networkHelp.getData();
    /*
    var long = weatherData['coord']['lon'];
    var weatherDesc = weatherData['weather'][0]['description'];
    var id = weatherData['weather'][0]['id'];
    var temp = weatherData['main']['temp'];
    var city = weatherData['name'];
    print(long);
    print(weatherDesc);
    print(id);
    print(temp);
    print(city);
      */
  }

  @override
  void initState() {
    // TODO: implement deactivate
    super.initState();
    print("initState");
  }

  @override
  Widget build(BuildContext context) {
    print("build");

    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            getLocationData();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("deactivate");
  }
}
