import 'dart:convert';

import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void getLocation () async {
    print("getLocation");
    LocationService ls = LocationService();
    await ls.getCurrentLocation();
    print(ls.longitude);
    print(ls.latitude);
  }

  void getWeatherData() async {
    var url = Uri.parse('https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22');
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      var decodeData = jsonDecode(data);

      var long = decodeData['coord']['lon'];
      var weatherDesc = decodeData['weather'][0]['description'];
      var id = decodeData['weather'][0]['id'];
      var temp = decodeData['main']['temp'];
      var city = decodeData['name'];
      
      print(long);
      print(weatherDesc);
      print(id);
      print(temp);
      print(city);
    } else {
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    // TODO: implement deactivate
    super.initState();
    print("initState");
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    getWeatherData();

    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            //Get the current location
            getLocation();
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
