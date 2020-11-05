import 'package:burc/burc_liste.dart';
import 'package:burc/models/burc.dart';
import 'package:flutter/material.dart';

class BurcDetay extends StatelessWidget {

  int gelenIndex;
  burc secilenBurc;
  BurcDetay(this.gelenIndex);

  @override
  Widget build(BuildContext context) {

    secilenBurc=BurcListesi.tumBurclar[gelenIndex];



    return Scaffold(
      primary:true,
      body: CustomScrollView(
        primary: true,
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            primary: true,
            backgroundColor: Colors.pinkAccent,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(secilenBurc.burcAdi+" Burcu ve Özellikleri"),
              background: Image.asset("images/"+secilenBurc.burcBuyukResim, fit:BoxFit.cover),
              centerTitle: true,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
              color:Colors.pink.shade50,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Text(secilenBurc.burcDetayi, style:TextStyle(fontSize: 18,color:Colors.black),
                ),
            ),
            ),
        ],
      ),

    );
  }
}
