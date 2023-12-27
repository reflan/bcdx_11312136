class Mahasiswa {
  String? mhsNpm;
  String? mhsNama;
  String? mhsAlamat;
  String? mhsFakultas;
  String? mhsProdi;

  Mahasiswa({
    this.mhsNpm,
    this.mhsNama,
    this.mhsAlamat,
    this.mhsFakultas,
    this.mhsProdi,
  });

  factory Mahasiswa.fromJson(Map<String, dynamic> json) => Mahasiswa(
        mhsNpm: json['mhsNpm'],
        mhsNama: json['mhsNama'],
        mhsAlamat: json['mhsAlamat'],
        mhsFakultas: json['mhsFakultas'],
        mhsProdi: json['mhsProdi'],
      );

  Map<String, dynamic> toJson() => {
        'mhsNpm': this.mhsNpm,
        'mhsNama': this.mhsNama,
        'mhsAlamat': this.mhsAlamat,
        'mhsFakultas': this.mhsFakultas,
        'mhsProdi': this.mhsProdi,
      };
}
