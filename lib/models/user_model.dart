import 'package:cloud_firestore/cloud_firestore.dart';

// Model untuk menyimpan data dasar autentikasi pengguna KIBAR
class UserModel {
  final String uid; // ID unik pengguna dari Firebase Auth
  final String email; // Alamat email pengguna
  final String noWhatsapp; // Nomor WhatsApp pengguna
  final String role; // Peran pengguna: 'UMKM' atau 'ANAK_IT'
  final DateTime? createdAt; // Waktu pembuatan akun

  UserModel({
    required this.uid,
    required this.email,
    required this.noWhatsapp,
    required this.role,
    this.createdAt,
  });

  // MENGUBAH DATA DARI FIRESTORE KE FLUTTER:
  // Mengambil data mentah (Map/JSON) dari Firestore dan mengubahnya menjadi objek UserModel
  factory UserModel.fromMap(Map<String, dynamic> map, String id) {
    return UserModel(
      uid: id,
      email: map['email'] ?? '',
      noWhatsapp: map['noWhatsapp'] ?? '',
      role: map['role'] ?? 'UMKM',
      // Jika data waktu dari Firestore ada, ubah dari format Timestamp Firestore menjadi DateTime Dart
      createdAt: map['createdAt'] != null
          ? (map['createdAt'] as Timestamp).toDate()
          : null,
    );
  }

  // MENGUBAH DATA DARI FLUTTER KE FIRESTORE:
  // Mengubah objek UserModel di Flutter menjadi format Map (JSON) agar bisa disimpan ke Firestore
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'noWhatsapp': noWhatsapp,
      'role': role,
      // simpan waktu saat ini ke Firestore jika data waktu tidak diisi
      'createdAt': createdAt != null
          ? Timestamp.fromDate(createdAt!)
          : FieldValue.serverTimestamp(),
    };
  }
}
