import 'package:flutter/material.dart';
import 'dart:convert';

class HomePageThree extends StatefulWidget {
  @override
  _HomePageThreeState createState() => _HomePageThreeState();
}

class _HomePageThreeState extends State<HomePageThree> {
  int customDay = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("LOCAL JSON"),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 8,
              child: FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString('local_json/salaah_times.json'),
                builder: (context, snapshot) {
                  //Decode JSON
                  var myData = json.decode(snapshot.data.toString());
                  return ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text("Date: " + myData["May"][customDay]["Date"]),
                            Text("Fajr: " + myData["May"][customDay]["Fajr"]),
                            Text("Zuhr: " + myData["May"][customDay]["Zuhr"]),
                            Text("Asr: " + myData["May"][customDay]["Asr"]),
                          ],
                        ),
                      );
                    },
                    itemCount: 1,
                  );
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: RaisedButton(
                  child: Text("Change Data"),
                  color: Colors.blue,
                  onPressed: () {
                    setState(() {
                      customDay = customDay == 0 ? 2 : 0;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
