class TxtProcessor {
  static String initGuessed(String keyword) {
    var guessedLetters = "";
    for (int i = 0; i < keyword.length; i++) {
      guessedLetters += "_ ";
    }
    return guessedLetters;
  }

  /*
   * #3. Se está probando una nueva letra? está en la lista de intentos?
   * Si la letra no está en [a-z] o [A-Z] será falso.
   * No es sensitivo a mayúsculas y minúsculas, la 'a' y la 'A' son igual. @InigoAguirre
   */
  static bool isNewLetterInList(String letter, List<String> letterTrialList) {
    RegExp exp = new RegExp(r'^[a-zA-Z]+$');
    return exp.hasMatch(letter) &&
        !letterTrialList.contains(letter.toUpperCase());
  }

  /*
   * #4. Comprobar si una letra está en una palabra. @ocontrerasjdam1
   */
  static bool isLetterInWord(String letter, String word) {
    bool a = word.contains(letter.toUpperCase());
    return a;
  }

  /*
   * #5. Las letras de la lista que estén en la palabra clave
   * deben ser representadas en las posiciones que aparecen en ella.
   * Si una letra no está en la lista se representará con guión bajo.
   * Entre las letras y los guiones hay un espacio para formatearlo.
   * Ej. Si keyword = "bullseye" y la lista es ["a","b","i","s","t","e","u"]
   * devolverá "b u _ _ s e _ e" @acasadomdam1
   */
  static String guessedLetters(String keyword, List<String> letterTrialList) {
    String resul = "";
    for (String letter in keyword.split("")) {
      if (letterTrialList.contains(letter.toUpperCase())) {
        resul += letter.toUpperCase() + " ";
      } else {
        resul += "_ ";
      }
    }
    return resul.substring(0, resul.length - 1);
  }

  /*
   * #6. Las letras que están en la lista pero no en la palabra clave
   * deben aparecer separadas por un espacio.
   * Ej. Si keyword = "bullseye" y la lista es ["a","b","i","s","t","e","u"]
   * devolverá "a i t" @sercho80
   */
  static String missedLetters(String keyword, List<String> letterTrialList) {
    var missedLetters = "";
    for (String letter in letterTrialList) {
      if (!isLetterInWord(letter, keyword)) {
        missedLetters += "${letter} ";
      }
    }
    return missedLetters;
  }
}
