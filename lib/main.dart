import 'dart:js';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List data = [];
  Future _getPosts() async {
    final serviceUrl = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    final response = await http.get(serviceUrl);
    setState(() {
      data = json.decode(response.body.toString());
    });
  }

  @override
  void initState() {
    super.initState();
    this._getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Test App',
        home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text("test_app"),
            ),
            drawer: Drawer(
              child: ListView(
                children: [
                  Stack(
                    children: [
                      Image.asset('assets/images/img1.jpg'),
                      Positioned(
                        left: 110,
                        top: 10,
                        child: Center(
                          child: Container(
                            height: 70,
                            width: 70,
                            child: Image.asset('assets/images/profile.png'),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 40,
                        top: 80,
                        child: Center(
                          child: Text(
                            'Mir Md. Mosarof Hossan Showrav',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 90,
                        top: 100,
                        child: Center(
                          child: Text(
                            'Flutter Developer',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            body: ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text(data[index]['title'][0]),
                      ),
                      title: Text(data[index]['title']),
                      subtitle: Text(
                        data[index]['body'],
                        textAlign: TextAlign.justify,
                      ),
                    )
                  ],
                );
              },
            )));
  }
}
