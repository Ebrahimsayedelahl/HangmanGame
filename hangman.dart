import 'dart:io';
import 'dart:math';

void main() {
  print('Welcome to Hangman Game!');
  print('Try to guess the word.');

  List<String> words = ['apple', 'banana', 'orange', 'pear', 'melon'];

  Random random = Random();
  int randomIndex = random.nextInt(words.length);
  String randomWord = words[randomIndex];

  int remainingAttempts = 6;
  List<String> guessedLetters = [];

  while (remainingAttempts > 0) {
    print('\nWord: ${getMaskedWord(randomWord, guessedLetters)}');
    print('Attempts Remaining: $remainingAttempts');
    print('Guessed Letters: ${guessedLetters.join(', ')}');

    print('Enter a letter:');
    String input = stdin.readLineSync()!.toLowerCase();

    if (input.length != 1 || !input.contains(RegExp(r'[a-z]'))) {
      print('Invalid input. Please enter a single letter.');
      continue;
    }

    if (guessedLetters.contains(input)) {
      print('You already guessed that letter. Try again.');
      continue;
    }

    guessedLetters.add(input);

    if (randomWord.contains(input)) {
      print('Correct guess!');
      if (isWordGuessed(randomWord, guessedLetters)) {
        print('Congratulations! You guessed the word: $randomWord');
        break;
      }
    } else {
      print('Wrong guess!');
      remainingAttempts--;
      if (remainingAttempts == 0) {
        print('Game Over! You ran out of attempts.');
        print('The word was: $randomWord');
        break;
      }
    }
  }
}

String getMaskedWord(String word, List<String> guessedLetters) {
  String maskedWord = '';
  for (int i = 0; i < word.length; i++) {
    String letter = word[i];
    if (guessedLetters.contains(letter)) {
      maskedWord += letter;
    } else {
      maskedWord += '_';
    }
    maskedWord += ' ';
  }
  return maskedWord.trim();
}

bool isWordGuessed(String word, List<String> guessedLetters) {
  for (int i = 0; i < word.length; i++) {
    if (!guessedLetters.contains(word[i])) {
      return false;
    }
  }
  return true;
}
