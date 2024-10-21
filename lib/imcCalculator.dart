
class ImcCalculator {
  
 double calculateIMC(int height, int weight) {
    return weight / ((height / 100) * (height / 100)); // antes de calcular converte altura para metros
  }

Map<String, String> getImcMessage(double imc) {
  if (imc < 16) {
    return {
      "name": "Severe Thinness",
      "message": "You are severely underweight. It's crucial to consult a healthcare professional to address your nutritional needs."
    };
  } else if (imc >= 16 && imc < 16.9) {
    return {
      "name": "Moderate Thinness",
      "message": "You are moderately underweight. Consider focusing on a balanced diet to improve your health."
    };
  } else if (imc >= 17 && imc < 18.5) {
    return {
      "name": "Mild Thinness",
      "message": "You are mildly underweight. It may be beneficial to increase your caloric intake and monitor your diet."
    };
  } else if (imc >= 18.6 && imc < 24.9) {
    return {
      "name": "Normal Weight",
      "message": "Congratulations! You are at a healthy weight. Maintain a balanced diet and regular exercise."
    };
  } else if (imc >= 25 && imc < 29.9) {
    return {
      "name": "Overweight",
      "message": "You are overweight. It's recommended to adopt a healthier lifestyle with diet and physical activity to manage your weight."
    };
  } else if (imc >= 30 && imc < 34.9) {
    return {
      "name": "Obesity Class I",
      "message": "You are in the first class of obesity. It is advisable to consult a healthcare professional to discuss weight loss strategies."
    };
  } else if (imc >= 35 && imc < 39.9) {
    return {
      "name": "Obesity Class II",
      "message": "You are severely obese. It's important to seek medical guidance for effective weight management."
    };
  } else {
    return {
      "name": "Obesity Class III",
      "message": "You are morbidly obese. Immediate intervention is necessary, including consulting a healthcare provider for personalized treatment options."
    };
  }
}
}

 
 
