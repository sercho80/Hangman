import 'gallows.dart';

class Renderer {
  final int max_mistakes;

  Renderer(this.max_mistakes);

  void drawInit(guessed) {
    print("HANGMAN");
    print("");
    print(guessed);
  }

  /*
   * #7. Hay que representar correctamente la horca
   * teniendo en cuenta la clase Gallows. @ocontrerasjdam1
   */
  void drawGame(int mistakes, String missed, String guessed) {
    print(mistakes == 0
        ? "HANGMAN"
        : "Te quedan ${max_mistakes - mistakes} fallos.");
    print(Gallows.level[mistakes]);
    print(guessed);
    print("Falladas: $missed");
  }

  void drawSuccess(int mistakes) {
    print(mistakes == 0 ? "PERFECT!" : "¡HAS GANADO!");
  }

  void drawFailure(String keyword) {
    print("¡HAS PERDIDO!");
    print("La palabra era: ${keyword}");
  }
}
