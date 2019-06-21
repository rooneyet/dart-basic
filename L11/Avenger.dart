import 'CaptainAmerica.dart';
import 'Thanos.dart';
import 'Thor.dart';
import 'dart:convert' as JSON;
import 'package:http/http.dart' as http;

abstract class Avenger {
  static String name;
  static String sexual;
  Avenger.forExtendConstructor(
      {String name = "Avenger", String sexual = "Unkown"}) {
    name = name;
    sexual = sexual;
  }
  static void showInfo() {
    print('------ Info ------');
    print('Name: $name');
    print('Sexual: $sexual');
  }

  factory Avenger(
      {String type, String name = "Avenger", String sexual = "Unkown"}) {
    dynamic avenger;
    switch (type) {
      case Avengers.Thanos:
        avenger = Thanos(name: name, sexual: sexual);
        break;
      case Avengers.Thor:
        avenger = Thor(name: name, sexual: sexual);
        break;
      case Avengers.CaptainAmerica:
        avenger = CaptainAmerica(name: name, sexual: sexual);
        break;
    }
    return avenger;
  }
  // add more named constructor function here

  void doSkill();
}

class Avengers {
  static const String Thanos = 'Thanos';
  static const String CaptainAmerica = 'Captain America';
  static const String Thor = 'Thor';
  // add more function here

  static getFileNameFromUrl(url) {
    List<String> json = url.toString().split("/");
    json = json[json.length - 1].toString().split(".");
    return json[0];
  }

  static Future<dynamic> fetchAvenger(String url) async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        // If server returns an OK response, parse the JSON
        Map<String, dynamic> json = JSON.jsonDecode((response.body));
        var name = json["Avenger"]["name"];
        var sexual = json["Avenger"]["sexual"];
        //print(json);
        print('Avenger');
        print('name: $name');
        print('sexual: $sexual');
        return json;
      } else {
        // If that response was not OK, throw an error.
        print('Failed to load post');
      }
    } catch (e) {
      print(e);
    }
  }
}
