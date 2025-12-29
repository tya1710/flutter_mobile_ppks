class Panen {
  int? id;
  String tanggal;
  double berat;
  double harga;
  double upah;

  Panen({
    this.id,
    required this.tanggal,
    required this.berat,
    required this.harga,
    required this.upah,
  });

  factory Panen.fromMap(Map<String, dynamic> map) {
    return Panen(
      id: map['id'],
      tanggal: map['tanggal'],
      berat: map['berat'],
      harga: map['harga'],
      upah: map['upah'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tanggal': tanggal,
      'berat': berat,
      'harga': harga,
      'upah': upah,
    };
  }
}
