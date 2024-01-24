import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meuconsumo/src/presentation/controllers/page_controller.dart';

class DistanceComponent extends StatelessWidget {
  final GastoController gastoController;
  final Size screenSize;

  const DistanceComponent(
      {Key? key, required this.gastoController, required this.screenSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        width: screenSize.width,
        height: screenSize.height / 5,
        color: Colors.white,
        child: Column(
          children: [
            const Text("Distancia percorrida:"),
            const SizedBox(
              height: 10,
            ),
            TextField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^([\d.]+)?$')),
                ],
                onChanged: (value) {
                  gastoController.distPercorrida = value;

                  gastoController.calculoGastoMedio();
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    suffixText: 'Km',
                    label: Text(
                      "Distancia",
                      style: TextStyle(color: Colors.black),
                    ),
                    hintText: "Digite aqui a distancia percorrida",
                    border: OutlineInputBorder())),
          ],
        ));
  }
}
