class Kisiler {
  int? kisi_id;
  String? kisi_ad;
  int? kisi_yas;

  Kisiler({
    this.kisi_id,
    this.kisi_ad,
    this.kisi_yas,
  });

  @override
  String toString() =>
      'kisi_id: $kisi_id, kisi_ad: $kisi_ad, kisi_yas: $kisi_yas';
}
