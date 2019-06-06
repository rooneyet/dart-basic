import '../L6/Avenger.dart';
import '../L6/Gadget.dart';

class Thor extends Avenger {
  String name;
  String sexual;
  Gadget gadget;
  Thor._sing(this.name, this.sexual, this.gadget)
      : super(name: name, sexual: sexual, gadget: gadget) {}
  static final Thor one = new Thor._sing('Thor', 'Male', null);
  factory Thor({String name, String sexual}) => one;

  @override
  void doSkill() {}
}

void main() {
  Thor thor = Thor(name: 'Thần Sét', sexual: 'Male');
  Thor thorFake = Thor(name: 'Thần Sét Fakebede', sexual: 'Female');
  thor.showInfo();
  thorFake.showInfo();
  print("Thor can't be fake: ${thor == thorFake}");
}
