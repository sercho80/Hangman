import 'dart:io';
import 'dart:convert';
import 'dart:async';

class Dictionary {
  /*
   * #1. Se puede tener:
   * (1) una lista de palabras fija
   * (2) un fichero de texto con las palabras
   *     p.ej. descargado de https://random-word-api.herokuapp.com/all
   * (3) acceso a un service REST que devuelva una palabra aleatoria
   *     p.ej. https://random-word-api.herokuapp.com/word
   * La palabra devuelta debe ser aleatoria. @sercho80
   */
  void main() {
    print(makeRandomWord());
  }

  Future<String> aleatoria() async {
    String palabra = "";
    Uri zelda = Uri.parse("https://random-word-api.herokuapp.com/word");
    HttpClientRequest req = await new HttpClient().getUrl(zelda);
    HttpClientResponse res = await req.close();
    Stream dec = res.transform(utf8.decoder);
    await for (var l in dec) {
      palabra += l;
    }
    return palabra.substring(2, palabra.length - 2);
  }

  String makeRandomWord() {
    String palabra = "";
    aleatoria().then((value) => palabra = value);
    return palabra;
  }
}