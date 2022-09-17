import 'files/game.dart';
import 'files/dictionary.dart';

void main() {
  HangMan.play();
}

class HangMan {
  static var dictionary = new Dictionary();
  static var game = new Game();

  static void play() async {
    String keyword = await dictionary.makeRandomWord();
    game.run(keyword);
  }
}
