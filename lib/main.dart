import 'package:flutter/material.dart';
import 'package:imc_app/imcCalculator.dart';
import './colors.dart';
import 'alturaSilde.dart';
import 'generoButton.dart';
import 'addWidget.dart';
import './ImcResultPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora IMC',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: MyColors.azulFundo,
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue.shade900,
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      home: const MyHomePage(title: 'BMI Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int weight = 20;
  int height = 20;

  // Função para atualizar o peso
  void updateWeight(int newWeight) {
    setState(() {
      weight = newWeight;
    });
  }

  void updateHeight(int newWeight) {
    setState(() {
      height = newWeight;
    });
  }

  void calculateIMC() {
    double imc = ImcCalculator().calculateIMC(height, weight);
    Map<String, String> result = ImcCalculator().getImcMessage(imc);

    String name = result['name'] ?? 'Unknown';
    String message = result['message'] ?? 'No message available';

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ImcResultPage(imc: imc, name: name, message: message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.azulFundo,
        title: Center(
          child: Text(
            widget.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: GenderSelection(),
          ),
          Flexible(
              child: AlturaSlider(
            onHeightChanged: updateHeight,
          )),
          Flexible(
            child: WeightAgeSelection(
              onWeightChanged: updateWeight, // Passa o callback para o peso
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: (MediaQuery.of(context).size.width) * 0.1,
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(MyColors.rosa),
              ),
              onPressed: calculateIMC,
              child: const Text(
                'Calculate',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
