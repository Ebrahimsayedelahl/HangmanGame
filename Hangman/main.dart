import 'dart:io';
import 'dart:math';

void main() {
  print('Welcome to Hangman Game!');
  print('Try to guess the word.');

  List<String> fruits = [
    'apple',
    'banana',
    'orange',
    'pear',
    'melon',
    'strawberry'
  ];
  List<String> jobs = [
    'doctor',
    'teacher',
    'artist',
    'chef',
    'pilot',
    'nurse',
    'programmer',
    'engineer'
  ];
  List<String> sports = [
    'football',
    'basketball',
    'tennis',
    'volleyball',
    'swimming',
    'gymnastics'
  ];
  List<String> animals = [
    'cat',
    'dog',
    'lion',
    'monkey',
    'tiger',
    'snake',
    'elephant'
  ];

  List<List<String>> allLists = [fruits, jobs, sports, animals];
  Random random = Random();
  int randomListIndex = random.nextInt(allLists.length);
  List<String> randomList = allLists[randomListIndex];

  if (randomList == fruits) {
    print('Category: Fruits');
  } else if (randomList == jobs) {
    print('Category: Jobs');
  } else if (randomList == sports) {
    print('Category: Sports');
  } else if (randomList == animals) {
    print('Category: Animals');
  }

  int randomIndex = random.nextInt(randomList.length);
  String randomElement = randomList[randomIndex];
  // print(randomElement); // Uncomment this line to display the random word (for testing purposes)

  int remainingAttempts = 7;
  List<String> charList =
      List<String>.generate(randomElement.length, (_) => '-');

  while (remainingAttempts > 0) {
    print('\nWord: ${charList.join(' ')}');
    print('Enter a letter:');
    String input = stdin.readLineSync()!.toLowerCase();

    bool isCorrectGuess = false;
    for (int i = 0; i < randomElement.length; i++) {
      if (input == randomElement[i]) {
        charList[i] = input;
        isCorrectGuess = true;
      }
    }

    if (isCorrectGuess) {
      print('Correct guess!');
      if (!charList.contains('-')) {
        print('Congratulations! You won!');
        break;
      }
    } else {
      print('Wrong guess!');
      remainingAttempts--;
      if (remainingAttempts == 6) {
        print('''
        _______
        |     |
        |
        |
        |
        |
        ''');
      } else if (remainingAttempts == 5) {
        print('''
        _______
        |     |
        |     O
        |
        |
        |
        ''');
      } else if (remainingAttempts == 4) {
        print('''
        _______
        |     |
        |     O
        |     |
        |
        |
        ''');
      } else if (remainingAttempts == 3) {
        print('''
        _______
        |     |
        |     O
        |    /|
        |
        |
        ''');
      } else if (remainingAttempts == 2) {
        print('''
        _______
        |     |
        |     O
        |    /|\\
        |
        |
        ''');
      } else if (remainingAttempts == 1) {
        print('''
        _______
        |     |
        |     O
        |    /|\\
        |    /
        |
        ''');
      } else {
        print('''
        _______
        |     |
        |     O
        |    /|\\
        |    / \\
        |
        ''');
      }

      if (remainingAttempts == 0) {
        print('Game Over! You ran out of attempts.');
        print('The word was: $randomElement');
        break;
      }
    }
  }
}
