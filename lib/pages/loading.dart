import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loading extends StatefulWidget {
  const loading({super.key});

  @override
  State<loading> createState() => _loadingState();
}

class _loadingState extends State<loading> {
  void setupWorldTime() async {
    //instance of worldtime class with named parameters
    WorldTime instance =
        WorldTime(location: 'London', flag: 'uk.png', url: 'Europe/London');

    //call the class method to initialize an object and have to wait
    //before going ahead of code we add future return type so we can use it
    //get the informations of the specified location
    await instance.getTime();

    //Navigator.pushNamed(context, '/home'); this pushes home screen on loading screen
    //we dont want to keep loading screen on so do this:
    //argument for sending location,time,flag values to home screen
    //ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDateTime': instance.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    //call the function when widget is first created
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: const Center(
        child: SpinKitRing(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
