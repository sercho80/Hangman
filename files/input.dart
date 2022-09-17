import 'dart:io';

class Input {
  /*
   * #2. Controlar que el byte leido es una letra.
   * Sino, devolver un caracter que luego se procese,
   * para no ser tratado como una letra valida.
   * Por ejemplo, en isNewLetterInList que devuelva falso. @acasadomdam1
   */
  static String readLetter() {
    stdin.echoMode = false;
    stdin.lineMode = false;
    stdout.write("Letra: ");
    int c = stdin.readByteSync(); // 10=Enter, 27=Esc
    RegExp exp = new RegExp(r'^[a-zA-Z]+$');
    String s = String.fromCharCode(c);
    if (!exp.hasMatch(s)) {
      s = "*";
    }
    return s;
  }
}
