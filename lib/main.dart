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

  Map<String, dynamic> data;
  List<dynamic> userData;
  List<dynamic> userDatap;
  var userData1;
  var userData2;

  Future getData() async{
    var url = Uri.parse("http://www.omdbapi.com/?i=tt3896198&apikey=7d05796f");
    var response = await http.get(url);
    data = json.decode(response.body);


    setState(() {
      //userData = data[];
      userData1 = data["Title"];
      userData2 = data["Rated"];
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
      body: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage("https://m.media-amazon.com/images/M/MV5BNjM0NTc0NzItM2FlYS00YzEwLWE0YmUtNTA2ZWIzODc2OTgxXkEyXkFqcGdeQXVyNTgwNzIyNzg@._V1_SX300.jpg"),
            ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                    "${userData1}"
                    "${userData2}"
                ),
              ),
            ],
        ),
      );
  }
}



