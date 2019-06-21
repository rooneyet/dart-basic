// import file here
import './Thor.dart';
import './Avenger.dart';
import './CaptainAmerica.dart';
import './Thanos.dart';
import 'dart:convert' as JSON;
import 'package:http/http.dart' as http;

abstract class Avenger {
  String name;
  String sexual;
  Avenger.forExtendConstructor(
      {String name = "Avenger", String sexual = "Unkown"}) {
    this.name = name;
    this.sexual = sexual;
  }
  void showInfo() {
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

const List<String> urlAvengers = [
  'https://blogspotscraping.herokuapp.com/avengers/Thor.json',
  'https://blogspotscraping.herokuapp.com/avengers/Thanos.json',
  'https://blogspotscraping.herokuapp.com/avengers/CaptainAmerica.json',
];

Future<dynamic> fetchAvenger(String url) async {
  try {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      Map<String, dynamic> json = JSON.jsonDecode((response.body));
      var avenger = json["Avenger"];
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

createAvengers(List<String> urlAvengers) {
  // todo
  // forced call default factory constructor
  for (var i = 0; i < urlAvengers.length; i++) {
    String type = Avengers.getFileNameFromUrl(urlAvengers[i]);
    dynamic avenger; 
    Avengers.fetchAvenger(urlAvengers[i]).then(avenger);
    switch (type) {
      // case Avengers.Thanos:
      //   Thanos(
      //     name: avenger["Avenger"]["name"],
      //     sexual: avenger["Avenger"]["sexual"],
      //   );
      //   break;
       case "Thanos":
        Thanos(
            name: avenger["Avenger"]["name"],
            sexual: avenger["Avenger"]["sexual"]);
        break;
         case "Thanos":
        Thor(
            name: avenger["Avenger"]["name"],
            sexual: avenger["Avenger"]["sexual"]);
        break;
         case "Thanos":
        CaptainAmerica(
            name: avenger["Avenger"]["name"],
            sexual: avenger["Avenger"]["sexual"]);
        break;
    }
      //Avenger.showInfo();
  }
}

void main() async {
  print(
      '============ L11.2 - Call Default Factory Constructor Orderly ============');
  print(
      '============ L11.1 - Call Named factory constructor create any avenger ============');
  // todo
  await fetchAvenger(urlAvengers.elementAt(0));
  await fetchAvenger(urlAvengers.elementAt(1));
  print('------------------------------------------------');
  await fetchAvenger(urlAvengers.elementAt(2));
}
