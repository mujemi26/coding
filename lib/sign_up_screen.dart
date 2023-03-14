import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'main.dart';



class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<StatefulWidget> createState() => _SignupscreenState();


}

class _SignupscreenState extends State<Signupscreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    super.dispose();

  }


  Future<void> signUp(BuildContext context) async {
    if (passwordConfirm()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => HomeScreen()),
      );
    }
  }
  passwordConfirm() {
    if (_passwordController.text.trim() ==
        _confirmpasswordController.text) {
      return true;
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('passwords do not match'),
          content: Text('Please check your passwords and try again.'),
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

  void openSigninscreen() {
    Navigator.of(context).pushReplacementNamed('Loginscreen');
  }
  bool _isMisrInsurancePressed = false;
  bool _isNextcareInsurancePressed = false;
  bool _isArabMisrInsurancePressed = false;
  bool _isAXAInsurancePressed = false;

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
                    'SIGN UP',
                    style: TextStyle(
                        fontSize: 40, fontWeight: FontWeight.bold),
                  ),

                  // substitle
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Welcome! Here you can sign up',
                    style: TextStyle(fontSize: 15, color: Colors.lightBlueAccent),
                  ),
                  SizedBox(
                    height: 50,
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Name',
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                      height: 10
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
                      height: 10
                  ),

                  //Confirm password textfield

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: _confirmpasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Confirm Password',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                      height: 10
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 16.0, right: 10.0),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _isMisrInsurancePressed = true;
                                _isNextcareInsurancePressed = false;
                                _isArabMisrInsurancePressed = false;
                                _isAXAInsurancePressed = false;

                              });
                            },
                            child: Text('Misr Insurance'),
                            style: ElevatedButton.styleFrom(
                              primary:
                              _isMisrInsurancePressed ? Colors.blue : Colors.black,
                              elevation: _isMisrInsurancePressed ? 8.0 : 2.0,
                              animationDuration: Duration.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _isMisrInsurancePressed = false;
                              _isNextcareInsurancePressed = true;
                              _isArabMisrInsurancePressed = false;
                              _isAXAInsurancePressed = false;

                            });
                          },
                          child: Text('Nextcare Insurance'),
                          style: ElevatedButton.styleFrom(
                            primary: _isNextcareInsurancePressed ? Colors.blue : Colors.black,
                            elevation: _isNextcareInsurancePressed ? 8.0 : 2.0,
                            animationDuration: Duration.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _isMisrInsurancePressed = false;
                              _isNextcareInsurancePressed = false;
                              _isArabMisrInsurancePressed = true;
                              _isAXAInsurancePressed = false;

                            });
                          },
                          child: Text('Arab Misr Insurance'),
                          style: ElevatedButton.styleFrom(
                            primary:
                            _isArabMisrInsurancePressed ? Colors.blue : Colors.black,
                            elevation: _isArabMisrInsurancePressed ? 8.0 : 2.0,
                            animationDuration: Duration.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                        ),
                        SizedBox(width: 10),
                        Padding(
                          padding: EdgeInsets.only(right: 16.0),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _isMisrInsurancePressed = false;
                                _isNextcareInsurancePressed = false;
                                _isArabMisrInsurancePressed = false;
                                _isAXAInsurancePressed = true;
                              });
                            },
                            child: Text('AXA Insurance'),
                            style: ElevatedButton.styleFrom(
                              primary: _isAXAInsurancePressed ? Colors.blue : Colors.black,
                              elevation: _isAXAInsurancePressed ? 8.0 : 2.0,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  SizedBox(
                      height: 10
                  ),

                  //sign in button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: ElevatedButton(
                      onPressed: () => signUp(context),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        primary: Colors.blue[700],
                        padding: EdgeInsets.all(16),
                      ),
                      child: Center(
                        child: Center(child: Text('sign up',
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

                      Text ('Already a member?',style: TextStyle(fontSize: 15,  fontWeight: FontWeight.bold)),
                      GestureDetector(
                          onTap: openSigninscreen,
                          child: Text('  Sign in here',style: TextStyle(fontSize: 15, color: Colors.green[900], fontWeight: FontWeight.bold))
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