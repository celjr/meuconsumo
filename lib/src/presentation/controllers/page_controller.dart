import 'package:flutter/material.dart';

class GastoController {
  final valorGasolina = ValueNotifier<String>('1');
  final consumoMedio = ValueNotifier<String>('1');
  var gastoMedio = ValueNotifier<String>('0');
  String distPercorrida = '0';

  calculoGastoMedio() {
    double result =
        (double.parse(distPercorrida) / double.parse(consumoMedio.value)) *
            double.parse(valorGasolina.value);

    gastoMedio.value = result.toString();
  }
}
