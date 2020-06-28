import 'package:flutter/material.dart';
import 'dart:convert';

class HomePageTwo extends StatefulWidget {
  @override
  _HomePageTwoState createState() => _HomePageTwoState();
}

class _HomePageTwoState extends State<HomePageTwo> {
  String newData = "Patient A";

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
                    .loadString('local_json/patients.json'),
                builder: (context, snapshot) {
                  //Decode JSON
                  var myData = json.decode(snapshot.data.toString());
                  print(myData);
                  return ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text("Name: " + myData[newData]["name"]),
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
                      newData =
                          newData == "Patient A" ? "Patient B" : "Patient A";
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
