import 'package:btt/landingPage2.dart';
import 'package:flutter/material.dart';

class landingPage1 extends StatefulWidget {
  const landingPage1({Key? key}) : super(key: key);

  @override
  State<landingPage1> createState() => _landingPage1State();
}

class _landingPage1State extends State<landingPage1> {
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
                            builder: (context) => landingPage2(
                              person: 'customer',
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
                            'Customer',
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
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => landingPage2(
                              person: 'driver',
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
                            'Driver',
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
