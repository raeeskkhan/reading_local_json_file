import 'package:flutter/material.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //List data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("LOCAL JSON"),
      ),
      body: Container(
        child: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('local_json/person.json'),
            builder: (context, snapshot) {
              //Decode JSON
              var myData = json.decode(snapshot.data.toString());
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text("ID: " + myData[index]["id"]),
                        Text("Name: " + myData[index]["name"]),
                        Text("Gender: " + myData[index]["gender"]),
                      ],
                    ),
                  );
                },
                itemCount: 1,
              );
            },
          ),
        ),
      ),
    );
  }
}
