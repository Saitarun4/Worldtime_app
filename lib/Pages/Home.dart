import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};
  @override
  Widget build(BuildContext context) {
    data= data.isNotEmpty ? data: ModalRoute.of(context).settings.arguments;
    print(data);
    String bgImage = data['isDaytime']?'assets/daytime.jpg':'assets/nighttime.jpg';
    Color textColor=data['isDaytime']? Colors.black : Colors.white;
    Color cardColor=data['isDaytime']? Colors.white : Colors.black;

    return Scaffold(
      backgroundColor: Colors.white,
      
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('$bgImage'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
            child:Padding(
              padding: const EdgeInsets.fromLTRB(20.0,100.0,20.0,20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton.icon(onPressed: () async{
                    dynamic result =await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data={
                        'location':result['location'],
                        'time':result['time'],
                        'flag':result['flag'],
                        'isDaytime':result['isDaytime'],
                      };
                    });
                    }, icon: Icon(Icons.edit_location,color: textColor,), label: Text('Edit Location',style: TextStyle(color: textColor,fontWeight: FontWeight.bold),)),
                  Divider(
                    color: textColor,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/${data['flag']}',
                        height: 60.0,
                        width: 40.0,
                      ),
                      VerticalDivider(
                        width: 20.0,
                        color: textColor,
                      ),
                      Text(
                          data['location'],
                          style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                          ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 100.0,
                  ),
                  Card(
                    color: textColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        data['time'],
                        style: TextStyle(
                          letterSpacing: 2.0,
                          fontSize: 50.0,
                          color: cardColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }
}
