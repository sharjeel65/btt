import 'package:btt/dashboardItem.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);
  @override
  State<dashboard> createState() => _dashboardState();
}

List imagesbyurl = [
  'https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1169&q=80',
  'https://images.unsplash.com/photo-1509749837427-ac94a2553d0e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
  'https://images.unsplash.com/photo-1570125909232-eb263c188f7e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80',
  'https://images.unsplash.com/photo-1570125909517-53cb21c89ff2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
];

class _dashboardState extends State<dashboard> {
  SliderPlugin(images) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        enlargeCenterPage: true,
        onPageChanged: (position, reason) {
          print(reason);
          print(CarouselPageChangedReason.controller);
        },
        enableInfiniteScroll: false,
      ),
      items: images.map<Widget>((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(i))));
          },
        );
      }).toList(),
    );
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
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(6)),
              child: Center(
                child: SliderPlugin(imagesbyurl),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                      decoration: BoxDecoration(
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
                         ),
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
            ),
            Container(
              color: Colors.white24,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      item(
                          location: 'assets/images/bus.png',
                          text: 'Bus Schedule'),
                      item(
                          location: 'assets/images/seat.png',
                          text: 'Book Seats'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      item(
                          location: 'assets/images/place.png',
                          text: 'Live Location'),
                      item(
                          location: 'assets/images/tickets.png',
                          text: 'Buy Tickets'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      item(location: 'assets/images/fare.png', text: 'Fare'),
                      item(
                          location: 'assets/images/route.png',
                          text: 'Route Map'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
