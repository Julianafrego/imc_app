import 'package:flutter/material.dart';
import './colors.dart';
class AlturaSlider extends StatefulWidget {

  final ValueChanged<int> onHeightChanged; 

  const AlturaSlider({super.key, required this.onHeightChanged});

  @override
  State<AlturaSlider> createState() => _AlturaSliderState();
}

class _AlturaSliderState extends State<AlturaSlider> {
  double currentSliderValue = 100;

  @override
  Widget build(BuildContext context) {
    return Container(
        
        margin: const EdgeInsets.only(right: 5.0, left: 5.0, bottom: 5.0), 
          
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
                  '${currentSliderValue.toStringAsFixed(0)} ',
                  style: const TextStyle(
                     fontWeight: FontWeight.bold,
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
              value: currentSliderValue,
              min: 10,
              max: 250,
              label: currentSliderValue.toString(),
              onChanged: (double value) {
                setState(() {
                  currentSliderValue = value;
                  widget.onHeightChanged(currentSliderValue.round());
                });
              },
            ),
          ],
        ),
      );
  }
}