import 'package:coding/sign_up_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'home_screen.dart';
import 'package:coding/saudi_hospital.dart';
import 'reservation_page.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import 'sucess.dart';





void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp ({Key?key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        'homescreen':(context) => const HomeScreen(),
        'signupScreen':(context) => const Signupscreen(),
        'Loginscreen':(context) => const HomePage(),
        'saudiHospital' :(context) => const Saudihospital (),
        'reservation' :(context) => ReservationPage(),
        'Confrim reservation' :(context) => SuccessPage(),

      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    )..forward();
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => HomePage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.lightBlue],
          ),
        ),
        child: Center(
          child: ScaleTransition(
            scale: _animation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 250,
                  height: 250,
                  child: Image.asset('image/blac.png'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}


class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  Future<void> signIn(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => HomeScreen()),
      );
    } on FirebaseAuthException catch (e) {
      // Handle sign in errors
      if (e.code == 'user-not-found') {
        // User not found
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('User not found'),
            content: Text('Please check your email and try again.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      } else if (e.code == 'wrong-password') {
        // Wrong password
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Wrong password'),
            content: Text('Please check your password and try again.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }
  void openSignupscreen() {
    Navigator.of(context).pushReplacementNamed('signupScreen');
  }


  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.lightBlue],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //image
                  Image.asset(
                      'image/blac.png',
                      height: 150),
                  SizedBox(height: 20),

                  //text

                  Text(
                    'SIGN IN',
                    style: TextStyle(
                        fontSize: 40, fontWeight: FontWeight.bold),
                  ),

                  // substitle
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Your health is important, treat it with love and care',
                    style: TextStyle(fontSize: 15, color: Colors.lightBlue),
                  ),
                  SizedBox(
                    height: 50,
                  ),



                  //email textfield
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                      height: 10
                  ),

                  //password textfield

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                      height: 15
                  ),

                  //sign in button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: ElevatedButton(
                      onPressed: () => signIn(context),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        primary: Colors.blue[700],
                        padding: EdgeInsets.all(16),
                      ),
                      child: Center(
                        child: Center(child: Text('sign in',
                            style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)
                        ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                      height: 25
                  ),

                  //text sign in

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[

                      Text ('Not yet a member?',style: TextStyle(fontSize: 15,  fontWeight: FontWeight.bold)),
                      GestureDetector(
                          onTap: openSignupscreen,
                          child: Text('  Sign up now',style: TextStyle(fontSize: 15, color: Colors.green[900], fontWeight: FontWeight.bold))
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class Auth extends StatelessWidget {
  const Auth ({Key?key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return HomeScreen();
          } else {
            return HomePage();
          }
        }
        ),
      ),
    );
  }
}