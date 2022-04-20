import 'package:btt/loginPage.dart';
import 'package:btt/signupPage.dart';
import 'package:flutter/material.dart';

class landingPage2 extends StatefulWidget {
  late String person;

  landingPage2({required this.person});

  @override
  State<landingPage2> createState() => _landingPage2State();
}

class _landingPage2State extends State<landingPage2> {
  void initState() {
    super.initState();
    widget.person;
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
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => login_page(
                                  person: widget.person,
                                )));
                      },
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
                            'Login',
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
            ),
            Row(
              children: [
                Expanded(
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => signup_page(
                              person: widget.person,
                            ),
                          ),
                        );
                      },
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
            ),
          ],
        ),
      ),
    );
  }
}
