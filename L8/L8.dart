import 'dart:async';
import '../L6/Avenger.dart';
import '../L6/Gadget.dart';
import '../L6/Spiderman.dart';
import '../L6/CaptainAmerica.dart';
import '../L6/Thanos.dart';
import '../L6/Hulk.dart';
import '../L6/Spiderman.dart';
import '../L6/Thor.dart';
const STREAM_CLOSE_TIMEOUT = 4;
const AVENGER_GO_TIMEOUT = 1;
Future<List<dynamic>> transformAvengers(List<dynamic> avengers) async {
 List<dynamic> transformedAdvengers = [];
 // Triển khai kịch bản tại đây 
 // Dùng  StreamController, StreamSubscription...
 // start todo
 // ...
 // end todo
 StreamController controller = StreamController();
 StreamSubscription cription = controller.stream.listen((data){
    print(data.runtimeType.toString());

 });
 for(int i = 0; i<avengers.length; i ++) { 
   await Future.delayed(Duration(seconds: AVENGER_GO_TIMEOUT));
   if(avengers[i].hasGadget()){
 controller.sink.add(avengers[i]);
   }
 }

 return transformedAdvengers;
}

// Liệt kê avengers đã qua đường hầm lượng tử
void showAvengers(List<dynamic> transformedAvengers){
    
}
List<dynamic> avengers = [
 Thanos(
   name:'Củ khoai tím',
   sexual:'Male',
   gadget:Gadget('Găng tay vô cực 6 đá')
 ),
 Thor(
   name:'Thần Sét',
   sexual:'Male'
 ),
 CaptainAmerica(
   name:'Lớp trưởng Mỹ',
   sexual:'Male',
   gadget:Gadget('Supper Khiên')
 ),
 Spiderman(
   name:'Người Nhện',
   sexual:'Male',
   gadget:Gadget('Tơ Nhện')
 ),
 Hulk(
   name:'Khổng Lồ Xanh',
   sexual:'Male',
   gadget:Gadget('Cú đấm')
 ),
];
void main()  {
 transformAvengers(avengers).then((transformedAvengers) { 
    showAvengers(transformedAvengers);
 });

}
