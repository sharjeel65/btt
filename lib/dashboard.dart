import 'package:btt/dashboardItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
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
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.orange.shade200,
          Colors.orange.shade900,
        ],
      )),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange.shade300,
          title: Center(child: Text("Welcome to BTT")),
          leading: GestureDetector(
            onTap: () {
              /* Write listener code here */
            },
            child: Icon(
              Icons.menu, // add custom icons also
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Container(
              width: 350,
              height: 150,
              margin: EdgeInsets.fromLTRB(30, 30, 0, 0),
              decoration: BoxDecoration(
                  color: Colors.orange.shade200, borderRadius: BorderRadius.circular(6)),
              child: Center(
                child: Text(
                  'Advertisment',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.orangeAccent.shade700,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade200,
                      border: Border(
                          right: BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                          bottom: BorderSide(
                            color: Colors.white,
                            width: 4,
                          )),
                    ),
                    child: Center(
                      child: Text(
                        'HOME',
                        style: TextStyle(
                          color: Colors.orange.shade900,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
                    decoration: BoxDecoration(
                        border: Border(
                            left: BorderSide(
                              color: Colors.white,
                              width: 2,
                            ),
                            bottom: BorderSide(
                              color: Colors.white,
                              width: 4,
                            )),
                        color: Colors.orange.shade200),
                    child: Center(
                      child: Text(
                        'Driver',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.orange.shade900,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                item(location: 'assets/images/bus.png', text: 'Bus Schedule'),
                item(location: 'assets/images/seat.png', text: 'Book Seats'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                item(location: 'assets/images/place.png', text: 'Live Location'),
                item(location: 'assets/images/tickets.png', text: 'Buy Tickets'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                item(location: 'assets/images/fare.png', text: 'Fare'),
                item(location: 'assets/images/route.png', text: 'Route Map'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
