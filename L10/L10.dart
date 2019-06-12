abstract class Avenger {
  String name;
  String sexual;
  Avenger({String name, String sexual}) {
    this.name = name;
    this.sexual = sexual;
  }

  factory Avenger.avg(String type, String name, String sexual) {
    switch (type) {
      case 'Thor':
        return new Thor(name: name, sexual: sexual);
      case 'Captain':
        return new CaptainAmerica(name: name, sexual: sexual);
      default:
        return null;
    }
  }

  void showInfo() {
    print('========= Basic info ==========');
    print('Name: $name');
    print('Sexual: $sexual');
  }
}

void main() {
  // Thor thorFactoryMade =
  //     Avenger(type: Avengers.Thor, name: 'Thor Factorymade', sexual: 'Male');
  Thor thorHomeMade = Thor(name: 'Thor Homemade', sexual: 'Male');
 // thorFactoryMade.showInfo();
  thorHomeMade.showInfo();
}

class Thor extends Avenger {
  String name;
  String sexual;
  Thor({String name, String sexual}) : super(name: name, sexual: sexual);
}

class CaptainAmerica extends Avenger {
  String name;
  String sexual;
  CaptainAmerica({String name, String sexual})
      : super(name: name, sexual: sexual);
}
