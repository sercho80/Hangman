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
    var letra[] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "ñ", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "Ñ", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    var i = 0;
    while(i < letra.length){
      if(letra[i] == initGuessed){
        return true;// stub
      }else{
        i++;
      }
    }
    return false;
  }

  /*
   * #4. Comprobar si una letra está en una palabra. @ocontrerasjdam1
   */
  static bool isLetterInWord(String letter, String word) {
    if(word.contains(letter))
    {
      return true;
    }
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
    for (int i = 0; i < letterTrialList.length; i++) {
      if (!isLetterInWord(letterTrialList[i], keyword)) {
        missedLetters = "$missedLetters ${letterTrialList[i]}";
      }
    }
    return missedLetters;
  }
}
