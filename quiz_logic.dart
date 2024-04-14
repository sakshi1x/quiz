// quiz_logic.dart
import 'dart:io';
import 'mcqs.dart';

class Quiz {
  int score = 0;

  void startQuiz() {
    for (int i = 0; i < mcqs.length; i++) {
      print('Question ${i + 1}: ${mcqs[i]['question']}');
      for (int j = 0; j < mcqs[i]['options'].length; j++) {
        print('${j + 1}. ${mcqs[i]['options'][j]}');
      }
      stdout.write('Enter your answer (1-${mcqs[i]['options'].length}): ');
      int? userInput = int.tryParse(stdin.readLineSync() ?? '');
      if (userInput != null && userInput >= 1 && userInput <= mcqs[i]['options'].length) {
        String selectedOption = mcqs[i]['options'][userInput - 1];
        if (selectedOption == mcqs[i]['correctAnswer']) {
          score++;
        }
      }
      print('Correct answer: ${mcqs[i]['correctAnswer']}');
      print('-----------------------------------');
    }
    print('\nYour final score is: $score out of ${mcqs.length}');
  }
}
