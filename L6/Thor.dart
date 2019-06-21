import 'Avenger.dart';
import 'Gadget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;
import 'dart:async';


class Thor extends Avenger {
  // ================= Start Singeton design pattern =================
  static String _name;
  static String _sexual;
  static Gadget _gadget;
  static final Thor _instance = Thor._privateConstructor(name: _name, sexual: _sexual, gadget: _gadget);
  Thor._privateConstructor({String name, String sexual, Gadget gadget})
      : super(name: name, sexual: sexual, gadget: gadget);
  factory Thor({String name, String sexual, Gadget gadget}) {
    _name = name;
    _sexual = sexual;
    _gadget = gadget;
    return _instance;
  }
  // ================= End Singeton design pattern =================

  void findGadget() async{
    if(_gadget == null){
      var name = await fetchMjolnir();
      if(name != null){
        super.gadget = Gadget(name["Gadget"]);
        super.showInfo();
      }      
    }
  }
  Future<dynamic> fetchMjolnir() async {
  try {
     final response =
      await http.get('https://blogspotscraping.herokuapp.com/mjolnir.json');
    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      print('Fetched hammer');
      return JSON.jsonDecode((response.body));
    } else {
      // If that response was not OK, throw an error.
      print('Failed to load post');
    }
  } catch (e) {
    print(e);
  }
 
}
  @override
  void doSkill() {
    print(
        '''                                                                                          
                                                         .:+ssso+++oo+.                             
                                                      `-+shhhyhyyhsoshh+.                           
                                                    .:osyhyhsyhyo+++++shh+`                         
                                                 `./oyyhyyysys+////////+shh/`                       
                                               `-/syyyyyyyyo/////////////+shy:`                     
                                             .:+oshyyyyyo//////:/::://::://+yhs:                    
                                           ./oyyyyyyys+/:::/:/:::::::::/::://oyhs-                  
                                           /shyyyss+::::::::::::::::://:::::::/oyho-                
                                           /+yyss+:-::::::::::::::::::/::::/::::/ohho.              
                                           //s+/::/::::::::::::::::/://:::::::::::/ohh+.            
                                           /sy+:-:::::::-::::::::::::///::::::::::::/shh+.          
                                           /+sso+::-:::::-::::::::::::::::::::::::::::/shh+.        
                                           :+/osoo/--:::::::::::::::::::::/:::::::::::::/shy/.      
                                           `+-:/oso+/:-:::::::::::::::::://///////::::::::/shy/`    
                                            `.-::+sso/:--::::::::::::::::://////////::/:::::+yhy/`  
                                              `-:::+sso+:::::::::::::::/:::///////////::::/:::+yhy: 
                                                .::::+sso+/:://:::::/://///:////////////:::////+ydd`
                                                 `-:::/ossso//:/::://////////////////////////oyhmmy 
                                                   -////syysso/::///////////////////++/+++oshdmdmmo 
                                                    .+ymdyyyyss+////////++//////////++++oshmdmmmmm/ 
                                                  `:ymdydmmdhyyyso////////++/////////+oyddmmmddmmd. 
                                                `/ydyshNNNNNdyoyysso////////+++/+/++oydmmmdmmmmdo.  
                                              .+hdddmNNNNNdy+/+osyyyso////+//+++++sydmmmmmddmd+.    
                                           `:ymmhhdNNNNmh:``-/+ossyyyso+/++++/++syddmmdddmmh/`      
                                         .+hdhydmNNNmmo-     `+yyyyyyyyys++++oshmdddmmdmmy/`        
                                      `-ohhhmmNNmNNh+`         -shhyyyyyyysoyhddmmmddmmy-`          
                                    `:ymmdmdmNNNmy:              :yhyssshhdddmdmdmdmdo.             
                                  .+ddhyhNNNNmmo.                  /ssoooyhhhhhhdmd+.               
                                .shhyhmNNNmNh/`                     `/osyhhyhhyso:`                 
                             `:ydddmNmNNNms-`                         `---:://-.`                   
                           .odmhyhmNNNmho.                                                          
                        `:shyyymNNNmNh:`                                                            
                      ./yhyhdmNNNNmo-`                                                              
                    -oddhhddNNNNh+.                                                                 
                 `:ydsssmNNNNmy:`                                                                   
               .+yyyodmNNNNmo-`                                                                     
            `-+hhssdmNNNNh+.                                                                        
          `/ydsoshNNNNdy:`                                                                          
        .+yshohmNNNmdo.`                                                                            
     `:ohdyydmNNNmh/.                                                                               
   `/ydysymNNNNds:`                                                                                 
  /hdyyhmmmNNdo.             ````````  ` `    ````     ````         `````         ```````           
  .oydmNNNmy/`              .//:::.`+--:-:`   ../`     `-`/`     `-:-...--.``     `-./----```       
  `/sdNNms-`                `.   .``/   `.    ``/`      .`:     `::`     `..`.     .`/   `.`:       
  /: `:+.                        .`./         ``:.````````:    ``/         . :`    ``/    `.+       
  /:`                            .`./         ` /-.......`:    ``:         ``:.    ``/    ./.       
  :+o:`                          .`./         ``/`      `.:    .`-`        `.+`    ``/  .`:`        
   o+sy:`                        .`./         ``/`      `-:    `...`      `-+.     ` /  `-`.`       
   `y:-sy.                       ``-/         `-/.      .::`     .---.`..-:-`     `.-:.`  ....`     
    -h` :y`                      `.-/`        `..`     ``.``       `.....`        `...``   `-.-.`   
     /y`-N-                     `.-:-.`                                                      .---.  
      o:+N:                                                                                         
       ``-`                                                                                        
    ''');
  }
}
