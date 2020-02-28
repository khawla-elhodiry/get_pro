import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
void main() async{
  List data = await getData();
  runApp(new MaterialApp(
      title: 'get ',
      home:new Scaffold(
      appBar: AppBar(
      title: new Text ('groups')
  )
  ,
  body: new Center(
  child:new ListView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext context, int Position){
        return new ListTile(
          title:new Text("${data[Position]['name']}",style: TextStyle(
            color: Colors.blue,
            fontSize: 22,
          ),)
          ,
          leading: new Text("${data[Position]['id']}",style: TextStyle(
            color: Colors.blue,
            fontSize: 22,
          ),),
        );
      }
  )
  )
      )
  )
  );
}
Future <List> getData() async{
  String url = 'http://cet.ahmad.ly/api/groups';
  http.Response r= await http.get(url);
  return json.decode(r.body);
}