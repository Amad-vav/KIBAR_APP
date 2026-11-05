import 'package:cloud_firestore/cloud_firestore.dart';

// Model untuk data lamaran bantuan dari Anak IT ke proyek UMKM[cite: 1, 2]
class CollaborationRequestModel {
  final String id; // ID lamaran
  final String projectId; // ID proyek yang dilamar
  final String pelamarId; // ID akun pelamar (Anak IT)
  final String namaPelamar; // Nama pelamar
  final String keahlian; // Skills pelamar (Flutter, PHP, Design, dll)
  final String pesankomitmen; // Alasan/pesan penawaran bantuan
  final String status; // Status lamaran: PENDING, ACCEPTED (Diterima), REJECTED
  final DateTime? createdAt; // Tanggal lamaran diajukan

  CollaborationRequestModel({
    required this.id,
    required this.projectId,
    required this.pelamarId,
    required this.namaPelamar,
    required this.keahlian,
    required this.pesankomitmen,
    required this.status,
    this.createdAt,
  });

  // Konversi data Firestore ke Objek CollaborationRequestModel
  factory CollaborationRequestModel.fromMap(
    Map<String, dynamic> map,
    String id,
  ) {
    return CollaborationRequestModel(
      id: id,
      projectId: map['projectId'] ?? '',
      pelamarId: map['pelamarId'] ?? '',
      namaPelamar: map['namaPelamar'] ?? '',
      keahlian: map['keahlian'] ?? '',
      pesankomitmen: map['pesankomitmen'] ?? '',
      status: map['status'] ?? 'PENDING',
      createdAt: map['createdAt'] != null
          ? (map['createdAt'] as Timestamp).toDate()
          : null,
    );
  }

  // Konversi Objek CollaborationRequestModel ke Map Firestore
  Map<String, dynamic> toMap() {
    return {
      'projectId': projectId,
      'pelamarId': pelamarId,
      'namaPelamar': namaPelamar,
      'keahlian': keahlian,
      'pesankomitmen': pesankomitmen,
      'status': status,
      'createdAt': createdAt != null
          ? Timestamp.fromDate(createdAt!)
          : FieldValue.serverTimestamp(),
    };
  }
}
