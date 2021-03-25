import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart'as http;

// http://www.omdbapi.com/?i=tt3896198&apikey=7d05796f

void main() => runApp(MaterialApp(
  home: MyApi(),
));

class MyApi extends StatefulWidget{
  @override
  _MyApi createState() => _MyApi();

}


class _MyApi extends State<MyApi>{

  Map data;
  List userData;
  var userData1;
  var userData2;

  Future getData() async{
    var url = Uri.parse("http://www.omdbapi.com/?i=tt3896198&apikey=7d05796f");
    http.Response response = await http.get(url);
    data = json.decode(response.body);

    setState(() {
      userData = data as List;
      userData1 = data["Title"];
      userData2 = data["imdbRating"];
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Api"),
        backgroundColor: Colors.brown,
      ),
      body: Container(
            width: 200.0,
            height: 250.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              color: Colors.redAccent,
            ),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(),
            ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                    "${userData[0]}, ${userData[16]}"
                ),
              ),
            ],
        ),
      ),
    );
  }
}



