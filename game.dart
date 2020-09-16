import 'status.dart';
import 'input.dart';
import 'renderer.dart';
import 'txtprocessor.dart';

class Game {
  static const MAX_MISTAKES = 10;

  var gameStatus = Status.playing;
  String inputLetter;
  var renderer = new Renderer(MAX_MISTAKES);
  var letterTrialList = new List<String>();
  int mistakeCounter = 0;
  String guessedLetters;
  String missedLetters;
  String keyword;

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
   * para que salga del game loop.
   */
  void update_game() {
    if (!TxtProcessor.isNewLetterInList(inputLetter, letterTrialList)) return;
    letterTrialList.add(inputLetter);
    if (!TxtProcessor.isLetterInWord(inputLetter, keyword)) mistakeCounter++;
    guessedLetters = TxtProcessor.guessedLetters(
        keyword, letterTrialList); // ~ "b u _ _ s e _ e"
    gameStatus = (mistakeCounter < MAX_MISTAKES) ? Status.playing : Status.lost;
    missedLetters =
        TxtProcessor.missedLetters(keyword, letterTrialList); // ~ "a i t"
  }

  void render_game() {
    renderer.drawGame(mistakeCounter, missedLetters, guessedLetters);
  }

  void clean_up() {
    if (gameStatus == Status.lost) renderer.drawFailure();
    if (gameStatus == Status.won) renderer.drawSuccess();
  }
}
