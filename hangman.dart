import 'game.dart';
import 'dictionary.dart';

void main() {
  HangMan.play();
}

class HangMan {
  static var dictionary = new Dictionary();
  static var game = new Game();

  static void play() {
    String keyword = dictionary.makeRandomWord();
    game.run(keyword);
  }
}
