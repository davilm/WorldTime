import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getData() async {
    Response response =
        // await get('http://worldtimeapi.org/api/timezone/America/Fortaleza');
        await get('http://worldtimeapi.org/api/timezone/Europe/Berlin');

    Map data = jsonDecode(response.body);
    // print(response.body);

    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(0, 3);
    print(datetime);
    // print(offset);

    DateTime now = DateTime.parse(datetime);
    // print(now);

    now = now.add(Duration(hours: int.parse(offset)));
    print(now);
    // print(now.toLocal());
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('loading screen'),
    );
  }
}
