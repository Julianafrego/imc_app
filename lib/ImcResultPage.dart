import 'package:flutter/material.dart';
import 'package:imc_app/main.dart';
import './colors.dart';


class ImcResultPage extends StatelessWidget {
  final double imc;
  final String name;
  final String message;

  const ImcResultPage(
      {super.key,
      required this.imc,
      required this.name,
      required this.message});

  @override
  Widget build(BuildContext context) {
    String imcRound = imc.toStringAsFixed(2);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.azulFundo,
        title: const Center(
          child: Text(
            'BMI Calculator',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors
              .white, // Muda a cor da seta de voltar, que é um icon do appbar
        ),
      ),
      body: Container(
        color: MyColors.azulFundo,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 30),
                  child: const Text(
                    'Your Result',
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ),
              Flexible(
                flex: 4,
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(' $name ',
                          style: const TextStyle(
                              color: MyColors.verde, fontSize: 30)),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          ' $imcRound ',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 60),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        alignment: Alignment.topCenter,
                        child: Text(' $message ',
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyApp(),
                      ),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: MyColors.rosa,
                    alignment: Alignment.center,
                    child: const Text(
                      'RE-CALCULATE',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
