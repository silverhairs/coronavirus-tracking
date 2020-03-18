import 'package:covid/components/search_bar.dart';
import 'package:covid/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Countries extends StatelessWidget {
  Countries({this.countriesList});
  final List countriesList;
  bool isPinned = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Affected Countries'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            child: SearchBar(),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: countriesList.length,
              itemBuilder: (context, index) {
                var country = countriesList[index];
                return Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: kBoxColor, borderRadius: kBoxesRadius),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            country['country'].toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22),
                            textAlign: TextAlign.center,
                          ),
                          IconButton(
                            icon: Icon(
                              FontAwesomeIcons.thumbtack,
                              color: isPinned ? Colors.blue : Colors.grey,
                            ),
                            onPressed: () {
                              isPinned = !isPinned;
                            },
                          )
                        ],
                      ),
                      SizedBox(height: 5),
                      Divider(color: Colors.white, thickness: .5),
                      SizedBox(height: 15),
                      Text('Total cases: ${country['cases']}',
                          style: TextStyle(fontSize: 18)),
                      Text('Today cases: ${country['todayCases']}',
                          style: TextStyle(fontSize: 18)),
                      Text('Total deaths: ${country['deaths']}',
                          style: TextStyle(fontSize: 18)),
                      Text('Today deaths: ${country['todayDeaths']}',
                          style: TextStyle(fontSize: 18)),
                      Text('Recovered: ${country['recovered']}',
                          style: TextStyle(fontSize: 18)),
                      Text('In critical state: ${country['critical']}',
                          style: TextStyle(fontSize: 18)),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
