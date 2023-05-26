import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int available_space = 0;

  Future<void> fetchData() async {
    var url = Uri.parse('http://192.168.137.1:8000/api/call'); // Replace with your API endpoint
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        // Process the received data here
        print(responseData['count']['data']);
         setState(() {
          available_space = responseData['count']['data']; // Update the variable within setState()
        });
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        backgroundColor: Colors.white,
        title: Text("Home", style: TextStyle(color: Color(0xFF10053F)),),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Text("Friday, 26", style: TextStyle(fontSize: 20, color: Colors.grey),),
            ],),
            Expanded(child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Lottie.asset('assets/car.json')
              //("https://assets5.lottiefiles.com/packages/lf20_70jmbzgx.json"),
            )),
            Text(available_space.toString(), style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: Color(0xFF10053F)),),
            SizedBox(height: 10,),
            Text("Available", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),),
            SizedBox(height: 100,),
            GestureDetector(
        onTap: () {
          fetchData();
        },
        child: Container(
          width: 300,
          height: 70,
          decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Color(0xFF10053F),
          ),
          child: Center(child: Text("Check Parking Slot", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),),
            ),
        ),
      ),
            // SizedBox(
            //   child: Lottie.asset('/assets/parking.json'),
            //   height: double.infinity / 2,
            //   width: double.infinity,
            // )
          ],
        ),
      ),
    );
  }
}