import 'package:covid/constants.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: kBoxColor,
        borderRadius: kBoxesRadius,
      ),
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: null, //TODO: Find the Country,
            child: Icon(Icons.search, color: Colors.grey),
          ),
          SizedBox(width: 15),
          Expanded(
            child: TextField(
              decoration: InputDecoration.collapsed(
                hintText: 'Search country...',
              ),
            ),
          )
        ],
      ),
    );
  }
}
