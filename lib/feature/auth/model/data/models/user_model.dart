import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String uid;
  final String email;
  final String displayName;
  final DateTime createdAt;

  const UserModel({
    required this.uid,
    required this.email,
    required this.displayName,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] as String,
      email: json['email'] as String,
      displayName: json['displayName'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  factory UserModel.fromFirebaseUser({
    required String uid,
    required String email,
    String? displayName,
  }) {
    return UserModel(
      uid: uid,
      email: email,
      displayName: displayName ?? 'User',
      createdAt: DateTime.now(),
    );
  }

  @override
  List<Object> get props => [uid, email, displayName, createdAt];
}
