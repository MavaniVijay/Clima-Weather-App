import 'package:clima_app/location_Screen.dart';
import 'package:clima_app/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }
  //use it http data in http package add

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SpinKitDoubleBounce(
            size: 100,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

//Exceptiob Handling and use it the try and catch

//Sample Programme in  learn

// class LoginPage1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     String mystring = "abc";
//     double mystringdouble;
//     try {
//       mystringdouble = double.parse(mystring);
//     } catch (e) {
//       print(e);
//       //Exception Handling try and catch in flutter
//       return Scaffold(
//         body: Container(
//           margin: EdgeInsets.all(mystringdouble ?? 30), //conditional operators use it.
//           color: Colors.green,
//         ),
//       );
//     }
//   }
// }

//Data Jsondecode data
// var longi = jsonDecode(data)["coord"]["lon"];
//var Description = jsonDecode(data)["weather"][0]["icon"];

// var main = jsonDecode(data)["main"]["temp_min"];
// var cloud = jsonDecode(data)["clouds"]["all"];
// var sys = jsonDecode(data)["sys"]["sunset"];
// print(main);
// print(cloud);
// print(sys);
