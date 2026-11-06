import 'package:cloud_firestore/cloud_firestore.dart';

// Model untuk menyimpan satu item pesan chat antara UMKM dan pelamar[cite: 1, 2]
class ChatModel {
  final String id; // ID unik pesan chat
  final String projectId; // ID proyek tempat berlangsungnya diskusi
  final String pengirimId; // User ID yang mengirim pesan
  final String penerimaId; // User ID yang menerima pesan
  final String pesan; // Isi teks pesan obrolan
  final DateTime timestamp; // Waktu saat pesan dikirim

  ChatModel({
    required this.id,
    required this.projectId,
    required this.pengirimId,
    required this.penerimaId,
    required this.pesan,
    required this.timestamp,
  });

  // Konversi data pesan Firestore ke Objek ChatModel
  factory ChatModel.fromMap(Map<String, dynamic> map, String id) {
    return ChatModel(
      id: id,
      projectId: map['projectId'] ?? '',
      pengirimId: map['pengirimId'] ?? '',
      penerimaId: map['penerimaId'] ?? '',
      pesan: map['pesan'] ?? '',
      // Ambil waktu pesan dikirim, atau gunakan waktu saat ini jika null
      timestamp: map['timestamp'] != null
          ? (map['timestamp'] as Timestamp).toDate()
          : DateTime.now(),
    );
  }

  // Konversi Objek ChatModel ke Map untuk dikirim ke Firestore
  Map<String, dynamic> toMap() {
    return {
      'projectId': projectId,
      'pengirimId': pengirimId,
      'penerimaId': penerimaId,
      'pesan': pesan,
      'timestamp': Timestamp.fromDate(timestamp),
    };
  }
}
