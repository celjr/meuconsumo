import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.white,
        child: Column(
          children: [
            Flexible(
              child: Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    children: const [
                      Text("Distancia percorrida:"),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              label: Text(
                                "Distancia",
                                style: TextStyle(color: Colors.black),
                              ),
                              hintText: "Digite aqui a distancia percorrida",
                              border: OutlineInputBorder())),
                    ],
                  )),
            ),
            Flexible(
              flex: 1,
              child: Container(
                color: Colors.pink,
              ),
            ),
            Flexible(
              child: Container(
                color: Colors.yellow,
              ),
            )
          ],
        ),
      ),
    );
  }
}
