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
      List<String> aux = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "ñ", "o", "p", "q", "r", "t", "u", "v", "w", "x", "y", "z"];
    String s = String.fromCharCode(c);
      if(!aux.contains(s.toLowerCase()))
      {
        s = "*"
      }
    print(s);
    return s;
  }
}