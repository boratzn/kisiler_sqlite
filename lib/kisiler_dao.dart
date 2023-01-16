import 'package:kisiler_sqlite/database_helper.dart';
import 'package:kisiler_sqlite/kisiler.dart';

class KisilerDao {
  Future<List<Kisiler>> tumKisiler() async {
    var db = await DatabaseHelper.accessDatabase();

    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM kisi");

    return List.generate(
      maps.length,
      (index) {
        var satir = maps[index];

        return Kisiler(
            kisi_id: satir["kisi_id"],
            kisi_ad: satir["kisi_ad"],
            kisi_yas: satir["kisi_yas"]);
      },
    );
  }

  Future<void> kisiEkle(String kisi_ad, int kisi_yas) async {
    var db = await DatabaseHelper.accessDatabase();

    var bilgiler = Map<String, dynamic>();
    bilgiler["kisi_ad"] = kisi_ad;
    bilgiler["kisi_yas"] = kisi_yas;

    await db.insert("kisi", bilgiler);
  }

  Future<void> kisiSil(int kisi_id) async {
    var db = await DatabaseHelper.accessDatabase();

    await db.delete("kisi", where: "kisi_id = ?", whereArgs: [kisi_id]);
  }

  Future<void> kisiGuncelle(int kisi_id, String kisi_ad, int kisi_yas) async {
    var db = await DatabaseHelper.accessDatabase();

    var bilgiler = Map<String, dynamic>();
    bilgiler["kisi_ad"] = kisi_ad;
    bilgiler["kisi_yas"] = kisi_yas;

    await db
        .update("kisi", bilgiler, where: "kisi_id = ?", whereArgs: [kisi_id]);
  }

  Future<int> kayitKontrol(String kisi_ad) async {
    var db = await DatabaseHelper.accessDatabase();

    List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT count(*) AS sonuc FROM kisi WHERE kisi_ad = '$kisi_ad'");

    return maps[0]["sonuc"];
  }

  Future<Kisiler> kisiGetir(int kisi_id) async {
    var db = await DatabaseHelper.accessDatabase();

    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM kisi WHERE kisi_id = '$kisi_id'");

    var satir = maps[0];

    return Kisiler(
        kisi_id: satir["kisi_id"],
        kisi_ad: satir["kisi_ad"],
        kisi_yas: satir["kisi_yas"]);
  }

  Future<List<Kisiler>> kisiAra(String aramaKelimesi) async {
    var db = await DatabaseHelper.accessDatabase();

    List<Map<String, dynamic>> maps = await db
        .rawQuery("SELECT * FROM kisi WHERE kisi_ad like '%$aramaKelimesi%'");

    return List.generate(maps.length, (index) {
      var satir = maps[index];

      return Kisiler(
          kisi_id: satir["kisi_id"],
          kisi_ad: satir["kisi_ad"],
          kisi_yas: satir["kisi_yas"]);
    });
  }

  Future<List<Kisiler>> rastgele2kisiGetir() async {
    var db = await DatabaseHelper.accessDatabase();

    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM kisi ORDER BY RANDOM() LIMIT 2");

    return List.generate(maps.length, (index) {
      var satir = maps[index];

      return Kisiler(
          kisi_id: satir["kisi_id"],
          kisi_ad: satir["kisi_ad"],
          kisi_yas: satir["kisi_yas"]);
    });
  }
}
