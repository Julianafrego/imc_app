import 'package:flutter/material.dart';
import './colors.dart';
import 'alturaSilde.dart';
import 'generoButton.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: MyColors.azulFundo,
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue.shade900,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          // Cada GeneroButton ocupará metade do espaço disponível
          Flexible(
            child: GenderSelectionScreen(),
          ),

         const Flexible(
            child: Row(children: [
              Expanded(
                child: AlturaSlider(),
              ),
            ]),
          ),
          const Flexible(child: Row()),
          TextButton(
              style: const ButtonStyle(),
              onPressed: () {},
              child: Text(
                'oi',
              ))
        ],
      ),
    );
  }
}


