import 'package:cloud_firestore/cloud_firestore.dart';

// Model untuk artikel edukasi digitalisasi bisnis yang tampil di Beranda[cite: 1, 2]
class EducationalContentModel {
  final String id; // ID artikel
  final String
  judul; // Judul artikel (contoh: "Manfaat Aplikasi Kasir")[cite: 1, 3]
  final String
  ringkasan; // Singkatan isi artikel untuk tampilan kartu/feed[cite: 1]
  final String isiKonten; // Seluruh teks artikel edukasi[cite: 2]
  final String bannerUrl; // Gambar banner/sampul artikel dari Firebase Storage
  final String kategori; // Kategori artikel (Kasir, Marketing, Keuangan, dll)
  final DateTime? createdAt; // Waktu artikel diterbitkan

  EducationalContentModel({
    required this.id,
    required this.judul,
    required this.ringkasan,
    required this.isiKonten,
    required this.bannerUrl,
    required this.kategori,
    this.createdAt,
  });

  // Konversi data artikel dari Firestore ke Objek EducationalContentModel
  factory EducationalContentModel.fromMap(Map<String, dynamic> map, String id) {
    return EducationalContentModel(
      id: id,
      judul: map['judul'] ?? '',
      ringkasan: map['ringkasan'] ?? '',
      isiKonten: map['isiKonten'] ?? '',
      bannerUrl: map['bannerUrl'] ?? '',
      kategori: map['kategori'] ?? '',
      createdAt: map['createdAt'] != null
          ? (map['createdAt'] as Timestamp).toDate()
          : null,
    );
  }

  // Konversi Objek EducationalContentModel ke Map Firestore
  Map<String, dynamic> toMap() {
    return {
      'judul': judul,
      'ringkasan': ringkasan,
      'isiKonten': isiKonten,
      'bannerUrl': bannerUrl,
      'kategori': kategori,
      'createdAt': createdAt != null
          ? Timestamp.fromDate(createdAt!)
          : FieldValue.serverTimestamp(),
    };
  }
}
