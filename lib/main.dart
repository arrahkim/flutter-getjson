import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main(){
  runApp(new MaterialApp(
    title: "Get Json",
    home: new Home(
      // data: new List<String>.generate(300, (i) => "Ini data ke $i"),

      ),
  ));
}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List dataJson;
  Future<String> ambildata() async{
    http.Response hasil = await http.get(
      Uri.encodeFull("https://whitaaplikasi.com/demo/api/getAccountMembers.php"), headers: {
        "Accept": "application/json"
      }
    );

    this.setState((){
      dataJson = json.decode(hasil.body);
    });
  }

  @override
    void initState() {
      this.ambildata();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("GET Json"),
      ),

      body: new ListView.builder(
        itemCount: dataJson== null ? 0 : dataJson.length,
        itemBuilder: (context, i){
          return new Container(
            padding: new EdgeInsets.all(5.0),
              child: new Card(
                  child: new Container(
                    padding: new EdgeInsets.all(5.0),
                    child:  new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(dataJson[i]['id'], ),
                      new Text(dataJson[i]['nama']),
                      new Text(dataJson[i]['email'], ),
                      new Text(dataJson[i]['phone'], ),
                      new Text(dataJson[i]['company'], ),
                    ],
                  ) 
                )
            ),
          );
        },
      ),
    );
  }
}
