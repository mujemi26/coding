import 'package:flutter/material.dart';
import 'sign_up_screen.dart';
import 'main.dart';
import 'package:coding/saudi_hospital.dart';


class HomeScreen extends StatelessWidget {

  const HomeScreen({Key? key}) : super(key: key);

  void saudiHospital(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('saudiHospital');
  }
  void openSigninscreen(BuildContext context) { // added context parameter
    Navigator.of(context).pushReplacementNamed('Loginscreen');
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, routes: {
      'saudiHospital' :(context) => const Saudihospital (),
    },
        home: Scaffold(
            appBar: AppBar(
              title: Text(
                'CareConnect',
              ),
              centerTitle: true,
            ),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.account_circle_outlined,
                          color: Colors.white,
                        ),
                        SizedBox(width: 10),
                        Text(
                          ' user',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.access_time_filled),
                    title: Text('Your reservation'),
                    onTap: () {
                      // Do something when the settings item is pressed
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.account_balance_wallet),
                    title: Text('Payment'),
                    onTap: () {
                      // Do something when the settings item is pressed
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                    onTap: () {
                      // Do something when the settings item is pressed
                    },
                  ),

                  ListTile(
                    leading: Icon(Icons.help),
                    title: Text('Help'),
                    onTap: () {
                      // Do something when the help item is pressed
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text('Log out'),
                    onTap: () => openSigninscreen(context), // Changed here
                  ),
                ],
              ),
            ),
            body: Container(
                color: Colors.grey[200],
                child: SingleChildScrollView(
                  child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                          ),
                          child: Column(
                              children: [
                                SizedBox(height: 20),
                                Text(
                                  'Your health is our First priority',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  margin: EdgeInsets.only(top: 30, bottom: 0),
                                  width: MediaQuery.of(context).size.width,
                                  height: 40,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white,
                                        blurRadius: 1.0,
                                        spreadRadius: 1.0,
                                      )
                                    ],
                                  ),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "search here...",
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                      ),
                                      prefixIcon: Icon(
                                        Icons.search,
                                        size: 25,
                                      ),
                                    ),
                                  ),
                                ),
                              ]
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.only(right: 290),
                          child: Column(
                            children: [
                              Text(
                                'Categories',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: 55,
                                  height: 55,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: ClipOval(
                                    child: Image.asset('image/brain.png'),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text('Brain'),
                              ],
                            ),
                            SizedBox(width: 15),
                            Column(
                              children: [
                                Container(
                                  width: 55,
                                  height: 55,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: ClipOval(
                                    child: Image.asset('image/hea.png'),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text('Heart'),
                              ],
                            ),
                            SizedBox(width: 15),
                            Column(
                              children: [
                                Container(
                                  width: 55,
                                  height: 55,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: ClipOval(
                                    child: Image.asset('image/eye.png'),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text('Eye'),
                              ],
                            ),
                            SizedBox(width: 15),
                            Column(
                              children: [
                                Container(
                                  width: 55,
                                  height: 55,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: ClipOval(
                                    child: Image.asset('image/dentail.png'),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text('Dental'),
                              ],
                            ),
                            SizedBox(width: 15),
                            Column(
                              children: [
                                Container(
                                  width: 55,
                                  height: 55,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: ClipOval(
                                    child: Image.asset('image/ear.png'),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text('Ear'),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 40),
                        Container(
                          padding: EdgeInsets.only(right: 150),
                          child: Column(
                            children: [
                              Text(
                                'Recommended Hospitails',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Card(
                            child: SingleChildScrollView(
                                child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset('image/saudi.png', width: 80, height: 80),
                                          SizedBox(width: 20),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              GestureDetector(
                                                onTap: () => saudiHospital(context) ,
                                                child:  Text(
                                                  ' Saudi German Hospital  ',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                '     Taha Hussein Rd, Huckstep, El Nozha, Cairo Governorate ',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Image.asset('image/asema.png', width: 80, height: 80),
                                          SizedBox(width: 20),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                ' Al Assema Hospital  ',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                  '   15 Ahmed Samy El-Sayed, Ad Doqi, Dokki, Giza Governorate  ',
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 10,
                                                  )
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                          children: [
                                            Image.asset('image/cairo.png', width: 80, height: 80),
                                            SizedBox(width: 20),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  ' Cairo Specialised Hospital  ',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                SizedBox(height: 5),
                                                Text(
                                                    '   4 Abou Ebaid El Bakry St. Off Ghernata St Roxy, Heliopolis  ',
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 10,
                                                    )
                                                )
                                              ],
                                            )
                                          ]
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Image.asset('image/air.png', width: 80, height: 80),
                                          SizedBox(width: 20),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '  Air Force General Hospital  ',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                  '     El-Abaseya, El Weili, Cairo Governorate  ',
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 10,
                                                  )
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ]
                                )
                            )
                        )
                      ]
                  ),
                )
            )
        )
    );
  }
}