class Mahasiswa {
  String id;
  String nim;
  String nama;
  String jurusan;
  String foto;

  Mahasiswa({
    this.id,
    this.nim,
    this.nama,
    this.jurusan,
    this.foto,
  });

  factory Mahasiswa.fromMap(Map<String, dynamic> map) => Mahasiswa(
        id: map['id'],
        nim: map['nim'],
        nama: map['nama'],
        jurusan: map['jurusan'],
        foto: map['foto'],
      );

  Map<String, dynamic> toMap() => {
        'id': this.id,
        'nim': this.nim,
        'nama': this.nama,
        'jurusan': this.jurusan,
        'foto': this.foto,
      };
}
