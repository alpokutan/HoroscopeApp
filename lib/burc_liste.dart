import 'package:burc/burc_detay.dart';
import 'package:burc/models/burc.dart';
import 'package:flutter/material.dart';
import 'package:burc/utils/Strings.dart';

class BurcListesi extends StatelessWidget {
  static List<burc> tumBurclar;

  @override
  Widget build(BuildContext context) {
    tumBurclar = veriKaynaginiHazirla();
    return Scaffold(
      appBar: AppBar(
        title: Text("Burc Rehberi"),
      ),
      body: listeyiHazirla(),
    );
  }

  List<burc> veriKaynaginiHazirla() {
    List<burc> burclar = [];

    for (int i = 0; i < 12; i++) {
      String kucukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + "${i + 1}.png"; //koc->koc1.png
      String buyukResim = Strings.BURC_ADLARI[i].toLowerCase() +
          "_buyuk" +
          "${i + 1}.png"; //Koc->koc_buyuk1.png

      burc eklenecekBurc = burc(
          Strings.BURC_ADLARI[i],
          Strings.BURC_TARIHLERI[i],
          Strings.BURC_GENEL_OZELLIKLERI[i],
          kucukResim,
          buyukResim);
      burclar.add(eklenecekBurc);
    }
    return burclar;
  }

  Widget listeyiHazirla() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return tekSatirBurc(context, index);
      },
      itemCount: tumBurclar.length,
    );
  }

  Widget tekSatirBurc(BuildContext context, int index) {
    burc oanListeyeEklenenBurc = tumBurclar[index];
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          onTap: ()=> Navigator.pushNamed(context, "/burcDetay/$index"),
          //onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>BurcDetay())),
          leading: Image.asset(
            "images/" + oanListeyeEklenenBurc.burcKucukResim,
            width: 64,
            height: 64,
          ),
          title: Text(
            oanListeyeEklenenBurc.burcAdi,
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: Colors.pink.shade500),
          ),
          subtitle:Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
            oanListeyeEklenenBurc.burcTarihi,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.black),
        ),
          ),
          trailing: Icon(Icons.arrow_forward_ios, color: Colors.pinkAccent,),
        ),
      ),
    );
  }
}
