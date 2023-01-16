import 'package:flutter/material.dart';
import 'package:kisiler_sqlite/kisiler.dart';
import 'package:kisiler_sqlite/kisiler_dao.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> kisileriGoster() async {
    var liste = await KisilerDao().tumKisiler();

    for (Kisiler k in liste) {
      print("**************************");
      print(k.toString());
    }
  }

  Future<void> ekle() async {
    await KisilerDao().kisiEkle("Sedat", 37);
  }

  Future<void> sil() async {
    await KisilerDao().kisiSil(5);
  }

  Future<void> kisiGetir() async {
    var kisi = await KisilerDao().kisiGetir(1);
    print(kisi.toString());
  }

  Future<void> kayitKontrol() async {
    int sonuc = await KisilerDao().kayitKontrol("Sedatx");
    print("Veritabanında Sedat sayısı : $sonuc");
  }

  Future<void> kisiArama() async {
    var sonuc = await KisilerDao().kisiAra("or");

    for (var kisi in sonuc) {
      print(kisi.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    //ekle();
    //kayitKontrol();
    //sil();
    //kisileriGoster();
    //kisiGetir();
    kisiArama();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
    );
  }
}
