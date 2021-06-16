class Stok {
  String id;
  String nama;
  String jenis;
  String jumlah;
  String foto;

  Stok({
    this.id,
    this.nama,
    this.jenis,
    this.jumlah,
    this.foto,
  });

  factory Stok.fromMap(Map<String, dynamic> map) => Stok(
        id: map['id'],
        nama: map['nama'],
        jenis: map['jenis'],
        jumlah: map['jumlah'],
        foto: map['foto'],
      );

  Map<String, dynamic> toMap() => {
        'id': this.id,
        'nama': this.nama,
        'jenis': this.jenis,
        'jumlah': this.jumlah,
        'foto': this.foto,
      };
}
