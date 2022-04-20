import 'package:flutter/material.dart';
class item extends StatefulWidget {
  late String location;
  String text;
   item({required this.location, required this.text});
  @override
  State<item> createState() => _itemState();
}

class _itemState extends State<item> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 90,
      height: 90,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 2, color: Colors.brown),
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.brown,
              offset: Offset(
                1,
                1,
              ),
              blurRadius: 2,
              spreadRadius: 2,
            )
          ]),
      child: Column(
        children: [
          Flexible(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.location),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              child: Center(
                child: Text(
                  widget.text,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.orange.shade900,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
