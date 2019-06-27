import 'dart:io';
import 'dart:math';

void switchboard() {
  stdout.write('Nhấn phím 1 : nghe tiếng việt\n');
  stdout.write('Nhấn phím 2 : gặp tổng viên\n');
  stdout.write('Nhấn phím 3 : để nghe lại\n');
  stdout.write('Nhấn số: ');
  var key = stdin.readLineSync();
  switch (key) {
    case '1':
      stdout.write('nghe tiếng việt\n');
      break;
    case '2':
      stdout.write('gặp tổng viên\n');
      break;
    case '3':
      stdout.write('để nghe lại\n');
      break;
    default:
  }
}

inputNumber() {
  var key = stdin.readLineSync();
  return key;
}

printResult(key) {
  switch (key) {
    case '1':
      stdout.write('nghe tiếng việt\n');
      break;
    case '2':
      stdout.write('gặp tổng viên\n');
      break;
    case '3':
      stdout.write('để nghe lại\n');
      break;
    default:
  }
}

void showmenu() {
  stdout.write('Nhấn phím 1 : nghe tiếng việt\n');
  stdout.write('Nhấn phím 2 : gặp tổng viên\n');
  stdout.write('Nhấn phím 3 : để nghe lại\n');
  stdout.write('Nhấn số: ');
}

void numberArray() {
  List<int> numbers = [5, 3, 1, 4, 2];
  var rng = new Random();
  int index = rng.nextInt(5);
  print("numbers[$index]: ${numbers[index]}");
}

void numberArrayString() {
  // var numbers = int.parse('12345');
  // var rng = new Random();
  // int index = rng.nextInt(5);
  // assert(numbers is int);
  // print("numbers[$index]: ${numbers.toString()}");
  int a = 1;
  int b = 2;
  int c = 3;
  int d = 4;
  int e = 5;
  print('$a,$b,$c,$d,$e');
}

void main() {
  switchboard();
  //showmenu();
  //printResult(inputNumber());
  numberArray();
//  numberArrayString();
}
