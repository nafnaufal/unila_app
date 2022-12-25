import 'package:http/http.dart';
import 'dart:convert';

class DataMahasiswa{
  late String id_peserta_didik;
  late String id_reg_pd;
  late String program_studi;
  late String npm;
  late String nama_mahasiswa;
  late String id_prodi;
  late String periode_masuk;
  late String semester_sekarang;
  late String ips;
  late String ipk;
  late String total_sks;
  late String status;
  DataMahasiswa(
    this.id_peserta_didik,
    this.id_reg_pd,
    this.program_studi,
    this.npm,
    this.nama_mahasiswa,
    this.id_prodi,
    this.periode_masuk,
    this.semester_sekarang,
    this.ips,
    this.ipk,
    this.total_sks,
    this.status,
  );

  DataMahasiswa.fromJson(Map<String, dynamic> json) {
    id_peserta_didik = json['id_peserta_didik'];
    id_reg_pd = json['id_reg_pd'];
    program_studi = json['program_studi'];
    npm = json['NPM'];
    nama_mahasiswa = json['nama_mahasiswa'];
    id_prodi = json['id_prodi'];
    periode_masuk = json['periode_masuk'];
    semester_sekarang = json['semester_sekarang'];
    ips = json['ips'];
    ipk = json['ipk'];
    total_sks = json['total_sks'];
    status = json['status'];
  }
}