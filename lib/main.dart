import 'package:burc/burc_detay.dart';
import  'package:flutter/material.dart';
import 'package:burc/burc_liste.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"Burc Rehberi",
      debugShowCheckedModeBanner: false,

      initialRoute: "/burcListesi",
      routes: {
        "/": (context)=>BurcListesi(),
        "/burcListesi":(context)=> BurcListesi(),
      },
      onGenerateRoute: (RouteSettings settings){
        List<String> pathElemanlari = settings.name.split("/"); // burcDetay/1
        if(pathElemanlari[1]== 'burcDetay'){
          return MaterialPageRoute(builder: (context)=>BurcDetay(int.parse(pathElemanlari[2])));
        }
        return null;
      },
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      //home:BurcListesi(),
    );
  }
}
