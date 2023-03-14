import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'main.dart';
import 'reservation_page.dart';
import 'dart:convert' show json;
import 'dart:io';





class Saudihospital extends StatefulWidget {
  const Saudihospital({Key? key}) : super(key: key);

  @override
  _SaudihospitalState createState() => _SaudihospitalState();
}

class _SaudihospitalState extends State<Saudihospital> {
  Future<String> loadJsonFromAssets() async {
    return await rootBundle.loadString('assets/data.json');
  }

  void main() async {
    String jsonData = await loadJsonFromAssets();
    final jsonResult = json.decode(jsonData);
    // Do something with the JSON data...

  }
  double? price;

  @override
  void initState() {
    super.initState();
    fetchPrice();
  }

  Future<void> fetchPrice() async {
    final jsonData = await rootBundle.loadString('assets/data.json');
    final data = json.decode(jsonData);
    final saudiGermanHospitalCairo = data['Saudi German Hospital Cairo'];
    final echo = saudiGermanHospitalCairo['Ultrasound']; // use square brackets here
    setState(() {
      price = echo['Price'];
    });
  }



  Future<bool> _onWillPop() async {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomeScreen()),
            (Route<dynamic> route) => false);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop, // Set the callback function
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('CareConnect'),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text(
                    'Saudi German Hospital',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  margin:  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            ' Magnetic resonance imaging (MRI)  ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            '   Time available:  ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Price: $price ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                            ),
                          ),

                          SizedBox(height: 5),
                          Text(
                            '   Insurance discount:  ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                            ),
                          ),
                          SizedBox(height: 20),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return ReservationPage();
                                  },
                                ),
                              );
                            },
                            child: Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ReservationPage()));
                                },
                                child: Text('Reservation'),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ' endoscopy ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '   Time available:  ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                            ),

                          ),
                          SizedBox(height: 5),
                          Text(
                            '   Insurance discount:  ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                            ),
                          ),
                          SizedBox(height: 20),

                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Center(
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text('Reservation'),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}