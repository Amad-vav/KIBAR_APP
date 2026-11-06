import 'package:cloud_firestore/cloud_firestore.dart';

// Model untuk postingan proyek/kebutuhan IT dari UMKM[cite: 1, 2]
class ProjectPostModel {
  final String id; // ID postingan proyek
  final String umkmId; // ID UMKM pembuat postingan
  final String namaUsaha; // Nama usaha pembuat postingan
  final String judulProyek; // Judul masalah/kebutuhan IT (misal: "Aplikasi Kasir POS")[cite: 1, 2]
  final String deskripsiMasalah; // Penjelasan rincian masalah usaha[cite: 1, 2]
  final String kategoriUsaha; // Jenis usaha (Kuliner, Jasa, dll)[cite: 2]
  final String kategoriIT; // Kategori bidang IT yang dibutuhkan (Web POS, UI/UX, dll)[cite: 2]
  final String kompensasiNonMateri; // Imbalan non-finansial (Sertifikat, makan siang, produk gratis)[cite: 1, 2]
  final String
  tingkatUrgensi; // Tingkat mendesak (Rendah, Sedang, Tinggi)[cite: 1]
  final int views; // Hitungan jumlah tayangan/pembaca postingan[cite: 1, 3]
  final String status; // Status proyek: OPEN, TAKEN (Disetujui), atau DONE (Selesai)[cite: 2]
  final DateTime? createdAt; // Tanggal posting dibuat

  ProjectPostModel({
    required this.id,
    required this.umkmId,
    required this.namaUsaha,
    required this.judulProyek,
    required this.deskripsiMasalah,
    required this.kategoriUsaha,
    required this.kategoriIT,
    required this.kompensasiNonMateri,
    required this.tingkatUrgensi,
    this.views = 0,
    required this.status,
    this.createdAt,
  });

  // Konversi data Firestore ke Objek ProjectPostModel
  factory ProjectPostModel.fromMap(Map<String, dynamic> map, String id) {
    return ProjectPostModel(
      id: id,
      umkmId: map['umkmId'] ?? '',
      namaUsaha: map['namaUsaha'] ?? '',
      judulProyek: map['judulProyek'] ?? '',
      deskripsiMasalah: map['deskripsiMasalah'] ?? '',
      kategoriUsaha: map['kategoriUsaha'] ?? '',
      kategoriIT: map['kategoriIT'] ?? '',
      kompensasiNonMateri: map['kompensasiNonMateri'] ?? '',
      tingkatUrgensi: map['tingkatUrgensi'] ?? 'Sedang',
      views: map['views'] ?? 0,
      status: map['status'] ?? 'OPEN',
      createdAt: map['createdAt'] != null
          ? (map['createdAt'] as Timestamp).toDate()
          : null,
    );
  }

  // Konversi Objek ProjectPostModel ke Map Firestore
  Map<String, dynamic> toMap() {
    return {
      'umkmId': umkmId,
      'namaUsaha': namaUsaha,
      'judulProyek': judulProyek,
      'deskripsiMasalah': deskripsiMasalah,
      'kategoriUsaha': kategoriUsaha,
      'kategoriIT': kategoriIT,
      'kompensasiNonMateri': kompensasiNonMateri,
      'tingkatUrgensi': tingkatUrgensi,
      'views': views,
      'status': status,
      'createdAt': createdAt != null
          ? Timestamp.fromDate(createdAt!)
          : FieldValue.serverTimestamp(),
    };
  }
}
