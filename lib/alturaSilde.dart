import 'package:flutter/material.dart';
import './colors.dart';
class AlturaSlider extends StatefulWidget {
  const AlturaSlider({super.key});

  @override
  State<AlturaSlider> createState() => _AlturaSliderState();
}

class _AlturaSliderState extends State<AlturaSlider> {
  double _currentSliderValue = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: const EdgeInsets.all(5.0), 
        
        decoration: BoxDecoration(
          color: MyColors.azulButtonNoPress, 
          borderRadius: BorderRadius.circular(10), 
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'HEIGHT',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${_currentSliderValue.toStringAsFixed(0)} ',
                  style: const TextStyle(
                    color: MyColors.branco,
                    fontSize: 50,
                  ),
                ),
                const Baseline(
                  baseline: 40, 
                  baselineType: TextBaseline.alphabetic,
                  child: Text(
                    'cm',
                    style: TextStyle(
                      color: MyColors.roxoletras,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            Slider(
              value: _currentSliderValue,
              min: 10,
              max: 250,
              label: _currentSliderValue.toString(),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}