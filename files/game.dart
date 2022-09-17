import 'status.dart';
import 'input.dart';
import 'renderer.dart';
import 'txtprocessor.dart';

class Game {
  static const MAX_MISTAKES = 10;

  late String inputLetter;
  late String guessedLetters;
  late String missedLetters;
  late String keyword;
  var letterTrialList = <String>[];
  var renderer = new Renderer(MAX_MISTAKES);
  var gameStatus = Status.playing;
  int mistakeCounter = 0;

  void run(String keyword) {
    init(keyword);
    while (gameStatus == Status.playing) {
      process_input();
      update_game();
      render_game();
    }
    clean_up();
  }

  void init(keyword) {
    this.keyword = keyword;
    print("\x1B[2J\x1B[0;0H");
    guessedLetters = TxtProcessor.initGuessed(keyword);
    renderer.drawInit(guessedLetters);
  }

  void process_input() {
    inputLetter = Input.readLetter();
    print(
        "\x1B[2J\x1B[0;0H"); // Limpia terminal y coloca cursor en coord. (0,0)
  }

  /*
   * #8. Hay que comprobar si se ha ganado y
   * en ese caso actualizar el estado
   * para que salga del game loop. @InigoAguirre
   */
  void update_game() {
    if (guessedLetters.contains(inputLetter.toUpperCase()))
      print("Ya has adivinado esa letra :/");
    if (!TxtProcessor.isNewLetterInList(inputLetter, letterTrialList)) return;
    letterTrialList.add(inputLetter.toUpperCase());
    if (!TxtProcessor.isLetterInWord(inputLetter.toUpperCase(), keyword))
      mistakeCounter++;
    guessedLetters = TxtProcessor.guessedLetters(
        keyword, letterTrialList); // ~ "b u _ _ s e _ e"
    gameStatus = (mistakeCounter < MAX_MISTAKES) ? Status.playing : Status.lost;
    missedLetters =
        TxtProcessor.missedLetters(keyword, letterTrialList); // ~ "a i t"
    if (!guessedLetters.contains("_")) gameStatus = Status.won;
  }

  void render_game() {
    renderer.drawGame(mistakeCounter, missedLetters, guessedLetters);
  }

  void clean_up() {
    if (gameStatus == Status.lost) renderer.drawFailure(keyword);
    if (gameStatus == Status.won) renderer.drawSuccess(mistakeCounter);
  }
}
