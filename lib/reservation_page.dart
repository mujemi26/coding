import 'package:coding/sucess.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'main.dart';
import 'dart:async';
import 'saudi_hospital.dart';



class ReservationPage extends StatefulWidget {
  @override
  _ReservationPageState createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  bool isCashEnabled = false;
  bool isVisaEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CareConnect'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(// Aligns the child to the top center
            child: Column(

              children: [
                SizedBox(height: 30),
                Text(
                  '  Personnel information', // Your text here
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20), // Add a sized box here
                Container(
                  decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Your Name',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8), // Add a sized box here
                Container(
                    decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Birth day',
                            )
                        )
                    )
                ),
                SizedBox(height: 8), // Add a sized box here
                Container(
                    decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Phone number',
                            )
                        )
                    )
                ),
                SizedBox(height: 40),
                Center(
                  child: Container(
                    padding: EdgeInsets.only(left: 22),
                    child: Column(
                      children: [
                        Text(
                          'Reservation information',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20), // Add a sized box here
                Container(
                    decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Day/Month/Year',
                            )
                        )
                    )
                ),
                SizedBox(height: 8), // Add a sized box here
                Container(
                    decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'HH:MM   PM/AM',
                            )
                        )
                    )
                ),
                SwitchListTile(
                  title: Text('Cash'),
                  value: isCashEnabled,
                  onChanged: (value) {
                    setState(() {
                      isCashEnabled = value;
                      isVisaEnabled = !value; // toggle visa based on cash value
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Visa'),
                  value: isVisaEnabled,
                  onChanged: (value) {
                    setState(() {
                      isVisaEnabled = value;
                      isCashEnabled = !value; // toggle cash based on visa value
                    });
                  },
                ),
                SizedBox(height: 20,),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SuccessPage()));
                      },
                      child: Text('Confrim reservation'),
                    ),
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}