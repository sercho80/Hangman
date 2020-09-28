class TxtProcessor {
  static String initGuessed(String keyword) {
    var guessedLetters = "";
    for (int i = 0; i < keyword.length; i++) {
      guessedLetters = "_ $guessedLetters";
    }
    return guessedLetters;
  }

  /*
   * #3. Se está probando una nueva letra? está en la lista de intentos?
   * Si la letra no está en [a-z] o [A-Z] será falso.
   * No es sensitivo a mayúsculas y minúsculas, la 'a' y la 'A' son igual. @InigoAguirre
   */
  static bool isNewLetterInList(String letter, List<String> letterTrialList) {
    return true; // stub
  }

  /*
   * #4. Comprobar si una letra está en una palabra. @ocontrerasjdam1
   */
  static bool isLetterInWord(String letter, String word) {
    return false; // stub
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

    for(int i = 0 ; i < keyword.length ; i++)
    {
      for(int j = 0 ; j < letterTrialList.length ; j++)
      {
        if(letterTrialList[j] == keyword(i))
        {
          resul += keyword(i) + " ";
        } 
        else
        {
          resul += "_ ";
        }
        
      }
    }
    resul = resul.substring(0, resul.length - 1);
    
    
    return resul;
  }

  /*
   * #6. Las letras que están en la lista pero no en la palabra clave
   * deben aparecer separadas por un espacio.
   * Ej. Si keyword = "bullseye" y la lista es ["a","b","i","s","t","e","u"]
   * devolverá "a i t" @sercho80
   */
  static String missedLetters(String keyword, List<String> letterTrialList) {
    var missedLetters = "";
    // stub (está mal, incorpora todas las letras, era para ver cambios)
    for (int i = 0; i < letterTrialList.length; i++) {
      missedLetters = "$missedLetters ${letterTrialList[i]}";
    }
    return missedLetters;
  }
}
