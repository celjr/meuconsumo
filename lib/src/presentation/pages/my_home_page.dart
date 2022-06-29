import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meuconsumo/src/presentation/components/distance_component.dart';

import '../controllers/page_controller.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var gastoController;

  @override
  void initState() {
    super.initState();
    gastoController = GastoController();
  }

  calculoGastoMedio(
      double valorGasolina, double valorMedio, double distPercorrida) {
    double result = (distPercorrida / valorMedio) * valorGasolina;

    gastoController.gastoMedio.value = result.toString();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Container(
        height: screenSize.height,
        padding: const EdgeInsets.all(10),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(children: [
            DistanceComponent(
              screenSize: screenSize,
              gastoController: gastoController,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: screenSize.height / 5,
              child: Column(
                children: [
                  const Text("Preço da gasolina:"),
                  const SizedBox(height: 5),
                  ValueListenableBuilder(
                    valueListenable: gastoController.valorGasolina,
                    builder: (BuildContext _, value, __) {
                      return Column(
                        children: [
                          Text(
                            "R\$ ${double.parse(gastoController.valorGasolina.value).toStringAsFixed(2)}",
                            style: const TextStyle(fontSize: 20),
                          ),
                          Slider(
                              min: 1,
                              max: 12,
                              value: double.parse(
                                  gastoController.valorGasolina.value),
                              onChanged: (double value) {
                                gastoController.valorGasolina.value =
                                    value.toString();
                                gastoController.calculoGastoMedio();
                              }),
                        ],
                      );
                    },
                  )
                ],
              ),
            ),
            Container(
                padding: const EdgeInsets.all(10),
                height: screenSize.height / 5,
                child: Column(
                  children: [
                    const Text("Consumo Médio do Carro:"),
                    const SizedBox(height: 5),
                    ValueListenableBuilder(
                      builder: (BuildContext _, value, __) {
                        return Column(
                          children: [
                            Text(
                              "${double.parse(gastoController.consumoMedio.value).toStringAsFixed(2)} Km/L",
                              style: const TextStyle(fontSize: 20),
                            ),
                            Slider(
                                min: 1,
                                max: 40,
                                value: double.parse(
                                    gastoController.consumoMedio.value),
                                onChanged: (double value) {
                                  gastoController.consumoMedio.value =
                                      value.toString();
                                  gastoController.calculoGastoMedio();
                                }),
                          ],
                        );
                      },
                      valueListenable: gastoController.consumoMedio,
                    )
                  ],
                )),
            Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                height: screenSize.height / 5,
                child: Column(
                  children: [
                    const Text("Valor gasto é aproximadamente:"),
                    const SizedBox(height: 20),
                    ValueListenableBuilder(
                      builder: (BuildContext _, value, __) {
                        return Text(
                          "R\$ ${double.parse(gastoController.gastoMedio.value).toStringAsFixed(2)}",
                          style: const TextStyle(fontSize: 40),
                          softWrap: true,
                        );
                      },
                      valueListenable: gastoController.gastoMedio,
                    ),
                  ],
                )),
          ]),
        ),
      ),
    );
  }
}
