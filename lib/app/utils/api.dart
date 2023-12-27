class Api {
  static const _host = "http://192.168.232.57/api_mobile2";
  static String _mahasiswa = "$_host/mahasiswa";

  // mahasiswa
  static String getMahasiswa = "$_mahasiswa/view.php";
  static String addMahasiswa = "$_mahasiswa/add.php";
  static String updateMahasiswa = "$_mahasiswa/update.php";
  static String deleteMahasiswa = "$_mahasiswa/delete.php";
}
