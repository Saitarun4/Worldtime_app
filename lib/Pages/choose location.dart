import 'package:flutter/material.dart';
import 'package:worldtime_app/Services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  void updateTime(index) async{
    WorldTime instance =locations[index];
    await instance.getTime();
    Navigator.pop(context,{
      'location':instance.location,
      'time':instance.time,
      'flag':instance.flag,
      'isDaytime':instance.isDaytime,
    });
  }

  List <WorldTime> locations =[
    WorldTime(url: 'Asia/Kolkata',location: 'Kolkata',flag: 'india.png'),
    WorldTime(url: 'Europe/London',location: 'London',flag: 'united-kingdom.png'),
    WorldTime(url: 'Australia/Melbourne',location: 'Melbourne',flag: 'australia.png'),
    WorldTime(url: 'Asia/Bangkok',location: 'Bangkok',flag: 'thailand.png'),
    WorldTime(url: 'Europe/Istanbul',location: 'Istanbul',flag: 'turkey.png'),
    WorldTime(url: 'America/New_York',location: 'New_York',flag: 'united-states.png'),
    WorldTime(url: 'Africa/Nairobi',location: 'Nairobi',flag: 'kenya.png'),
  ];

  @override
  Widget build(BuildContext context) {
    print('build function ran');
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.black,
          title: Text('CHOOSE LOCATION',style: TextStyle(color: Colors.white),),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
          child: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.symmetric(vertical:5.0 ,horizontal:5.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: Colors.black54)
                  ),
                  child: Card(
                    color: Colors.transparent,
                    elevation: 0.0,
                    child: ListTile(
                      onTap: (){
                        updateTime(index);
                      },
                      title: Text(locations[index].location,style: TextStyle(fontWeight: FontWeight.w500,)),
                      leading: Image.asset('assets/${locations[index].flag}'),
                      ),
              ),
                ),
                  );
            },
          ),
        ),

    );
  }
}
