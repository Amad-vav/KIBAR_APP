import 'package:cloud_firestore/cloud_firestore.dart';

// Model untuk menyimpan profil bisnis & status verifikasi UMKM[cite: 1, 2]
class UmkmModel {
  final String id; // ID dokumen UMKM di Firestore
  final String userId; // ID pengguna pemilik usaha (terhubung ke UserModel)
  final String namaUsaha; // Nama toko / usaha UMKM
  final String pemilikUsaha; // Nama lengkap pemilik usaha
  final String
  kategoriUsaha; // Kategori bidang usaha (Kuliner, Retail, Kriya, dll)[cite: 2]
  final String alamatUsaha; // Alamat fisik usaha
  final String?
  googleMapsUrl; // Tautan lokasi di Google Maps (opsional)[cite: 2]
  final String ktpUrl; // Tautan gambar KTP di Firebase Storage[cite: 1, 2]
  final String
  fotoUsahaUrl; // Tautan gambar foto usaha di Firebase Storage[cite: 1, 2]
  final String statusVerifikasi; // Status pendaftaran akun: PENDING, ACTIVE, atau REJECTED[cite: 1, 2]
  final String? catatanPenolakan; // Catatan dari Admin jika status verifikasi REJECTED[cite: 1]
  final DateTime? createdAt; // Waktu pengajuan pendaftaran

  UmkmModel({
    required this.id,
    required this.userId,
    required this.namaUsaha,
    required this.pemilikUsaha,
    required this.kategoriUsaha,
    required this.alamatUsaha,
    this.googleMapsUrl,
    required this.ktpUrl,
    required this.fotoUsahaUrl,
    required this.statusVerifikasi,
    this.catatanPenolakan,
    this.createdAt,
  });

  // Membaca data mentah dari Firestore dan mengubahnya menjadi Objek UmkmModel
  factory UmkmModel.fromMap(Map<String, dynamic> map, String id) {
    return UmkmModel(
      id: id,
      userId: map['userId'] ?? '',
      namaUsaha: map['namaUsaha'] ?? '',
      pemilikUsaha: map['pemilikUsaha'] ?? '',
      kategoriUsaha: map['kategoriUsaha'] ?? '',
      alamatUsaha: map['alamatUsaha'] ?? '',
      googleMapsUrl: map['googleMapsUrl'],
      ktpUrl: map['ktpUrl'] ?? '',
      fotoUsahaUrl: map['fotoUsahaUrl'] ?? '',
      statusVerifikasi: map['statusVerifikasi'] ?? 'PENDING',
      catatanPenolakan: map['catatanPenolakan'],
      createdAt: map['createdAt'] != null
          ? (map['createdAt'] as Timestamp).toDate()
          : null,
    );
  }

  // Mengubah Objek UmkmModel menjadi Map untuk dikirim ke Firestore
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'namaUsaha': namaUsaha,
      'pemilikUsaha': pemilikUsaha,
      'kategoriUsaha': kategoriUsaha,
      'alamatUsaha': alamatUsaha,
      'googleMapsUrl': googleMapsUrl,
      'ktpUrl': ktpUrl,
      'fotoUsahaUrl': fotoUsahaUrl,
      'statusVerifikasi': statusVerifikasi,
      'catatanPenolakan': catatanPenolakan,
      'createdAt': createdAt != null
          ? Timestamp.fromDate(createdAt!)
          : FieldValue.serverTimestamp(),
    };
  }
}
