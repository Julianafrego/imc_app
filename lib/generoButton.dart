import 'package:flutter/material.dart';
import 'package:imc_app/colors.dart';

class GenderSelectionScreen extends StatefulWidget {
  @override
  _GenderSelectionScreenState createState() => _GenderSelectionScreenState();
}

class _GenderSelectionScreenState extends State<GenderSelectionScreen> {
  String? selectedGender; // Variável para armazenar o gênero selecionado

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
          Row(
            children: [
              Expanded(
                child: GeneroButton(
                  iconData: Icons.male,
                  label: 'Male',
                  isSelected: selectedGender == 'Male',
                  onSelected: () {
                    setState(() {
                      selectedGender =
                          'Male'; // Define 'Male' como o gênero selecionado
                    });
                  },
                ),
              ),
              Expanded(
                child: GeneroButton(
                  iconData: Icons.female,
                  label: 'Female',
                    isSelected: selectedGender == 'Female',
                  onSelected: () {
                    setState(() {
                      selectedGender =
                          'Female'; // Define 'Female' como o gênero selecionado
                    });
                  },
                ),
              ),
            ],
          ),
        
    );
  }
}

class GeneroButton extends StatefulWidget {
  final IconData iconData; // Ícone a ser exibido
  final String label; // Rótulo do ícone
  final VoidCallback onSelected;
  final bool isSelected;

  const GeneroButton({
    super.key,
    required this.iconData,
    required this.label,
    required this.onSelected,
    required this.isSelected,
  });

  @override
  State<GeneroButton> createState() => _GeneroButtonState();
}

class _GeneroButtonState extends State<GeneroButton> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
        onTap: () {
          setState(() {
            isSelected = !isSelected;
          });
          widget.onSelected();
        },
        child: Container(
          margin: const EdgeInsets.all(5.0),
          height: screenHeight * 0.2,
          decoration: BoxDecoration(
            color: widget.isSelected 
              ? MyColors.azulButtonPress // Cor quando o botão está selecionado
              : MyColors.azulButtonNoPress,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Centraliza o conteúdo
            children: [
              Icon(
                widget.iconData, // Usando o ícone passado como parâmetro
                size: 50,
                color: MyColors.branco,
              ),
              const SizedBox(height: 8), // Espaço entre o ícone e o rótulo
              Text(
                widget.label, // Usando o rótulo passado como parâmetro
                style: const TextStyle(
                  color: MyColors.branco,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ));
  }
}
