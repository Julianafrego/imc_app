import 'package:flutter/material.dart';
import 'package:imc_app/colors.dart'; // Certifique-se que a importação de cores esteja correta

class WeightAgeSelection extends StatefulWidget {

    final ValueChanged<int> onWeightChanged; // Callback para o peso
     
    const WeightAgeSelection({super.key, required this.onWeightChanged});
  @override
  _WeightAgeSelectionState createState() => _WeightAgeSelectionState();
}

class _WeightAgeSelectionState extends State<WeightAgeSelection> {
  // Variável para armazenar o gênero selecionado

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Addwidget(weightAge: 'WEIGHT', valorInicial: 20, onValueChanged:  widget.onWeightChanged),
          ),
          Expanded(
            child: Addwidget(weightAge: 'AGE', valorInicial: 20,  onValueChanged: (age) {
            },),
          ),
        ],
      ),
    );
  }
}

class Addwidget extends StatefulWidget {
  final String weightAge;
  final ValueChanged<int> onValueChanged; // Callback para enviar o valor
  final int valorInicial;
  
  const Addwidget({super.key, required this.weightAge, required this.valorInicial, required this.onValueChanged});
  

  @override
  State<Addwidget> createState() => _AddwidgetState();
}

class _AddwidgetState extends State<Addwidget> {
   late int valor;

  @override
  void initState() {
    super.initState();
    valor = widget.valorInicial; // Inicializa com o valor inicial 20
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: MyColors.azulButtonNoPress,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.weightAge,
            style: const TextStyle(
                fontSize: 14, color: MyColors.branco), // Estilo do texto
          ),
          Text(
            '$valor',
            style: const TextStyle(
                fontSize: 40, color: MyColors.branco), // Estilo do texto
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularAddButton(
                icon: Icons.remove, // Ícone de subtração
                onPressed: () {
                  setState(() {
                    if (valor > 0) {
                      valor--;
                       widget.onValueChanged(valor); // Chama a função callback
                    }
                  });
                },
                
              ),
              const SizedBox(width: 10), // Espaço entre os botões
              CircularAddButton(
                icon: Icons.add, // Ícone de adição
                onPressed: () {
                  setState(() {
                    if (valor > 0) {
                      valor++;
                       widget.onValueChanged(valor); // Chama a função callback
                    }
                  });
                },
            
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CircularAddButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;

  const CircularAddButton(
      {super.key, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: MyColors.cinza,
        ),
        child: Center(
          child: Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}
