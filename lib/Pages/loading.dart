import 'package:flutter/material.dart';
import 'package:worldtime_app/Services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with TickerProviderStateMixin{
  void getWorldTime() async{
  WorldTime instance = WorldTime(location:'Kolkata',url:'Asia/Kolkata',flag: 'india.png');
  await instance.getTime();
  Navigator.pushReplacementNamed(context, '/home',arguments:{
   'location':instance.location,
    'time':instance.time,
    'flag':instance.flag,
    'isDaytime':instance.isDaytime,
  });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:  SpinKitDoubleBounce(
          color: Colors.lightBlue[800],
          size: 80.0,
        )
      ),
    );
  }
}
