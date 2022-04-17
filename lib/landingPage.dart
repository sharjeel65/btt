import 'package:btt/loginPage.dart';
import 'package:btt/signupPage.dart';
import 'package:flutter/material.dart';
class landingPage extends StatefulWidget {
  const landingPage({Key? key}) : super(key: key);

  @override
  State<landingPage> createState() => _landingPageState();
}

class _landingPageState extends State<landingPage> {
  void _navigatetosignup(){
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => signup_page()));
  }
  void _navigatetologin(){
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => login_page()));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            stops: [
              0.0097,
              0.83,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFf4d462),
              Color(0xFFf58c24),
            ],
          )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 80, 0, 0),
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/1.png'),
                          )),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Center(
                    child: GestureDetector(
                      onTap: _navigatetologin,
                      child: Container(
                        margin: EdgeInsets.only(top: 30),
                        width: 340,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            border: Border.all(color: Colors.orange),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.orange,
                                offset: const Offset(
                                  1.0,
                                  1.0,
                                ),
                                blurRadius: 0.5,
                                spreadRadius: 0.2,
                              ),
                            ]),
                        child: Center(
                          child: (Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.orange,
                            ),
                          )),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Center(
                    child: GestureDetector(
                      onTap: _navigatetosignup,
                      child: Container(
                        margin: EdgeInsets.only(top: 30),
                        width: 340,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(color: Colors.white),
                          color: Colors.transparent,
                        ),
                        child: Center(
                          child: (Text(
                            'Register Now',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
