import 'dart:convert'; // para decodificar o json
import 'package:flutter/services.dart' show rootBundle; //para acessor os arquivos armazenados

class ImcCalculator {
  Future<String> getImcMessage(double imc) async {
    final String response = await rootBundle.loadString('assets/imc_results.json');
    final data = await json.decode(response);

    String resultMessage = "";

    if (imc < 18.5) {
      resultMessage = data['imc_results'][0]['message'];
    } else if (imc >= 18.5 && imc < 24.9) {
      resultMessage = data['imc_results'][1]['message'];
    } else if (imc >= 25 && imc < 29.9) {
      resultMessage = data['imc_results'][2]['message'];
    } else {
      resultMessage = data['imc_results'][3]['message'];
    }

    return resultMessage;
  }
}
