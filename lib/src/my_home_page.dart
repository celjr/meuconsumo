import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _valorGasolina = ValueNotifier<String>('0');

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
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    children: const [
                      Text("Distancia percorrida:"),
                      SizedBox(
                        height: 10,
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
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text("Preço da gasolina"),
                    ValueListenableBuilder(
                      builder: (BuildContext _, value, __) {
                        return Slider(
                            label: _valorGasolina.value,
                            max: 10,
                            value: double.parse(_valorGasolina.value),
                            onChanged: (double value) {
                              _valorGasolina.value = value.toString();
                            });
                      },
                      valueListenable: _valorGasolina,
                    )
                  ],
                ),
              ),
            ),
            Flexible(
              child: Container(
                color: Colors.yellow,
              ),
            ),
            Flexible(
              child: Container(
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
