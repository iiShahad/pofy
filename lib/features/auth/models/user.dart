// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String id;
  final String username;
  final String firstName;
  final String? middleName;
  final String? lastName;
  final String profilePic;
  final String? phoneNum;
  final String? country;
  final int profileViews;
  // final String subscription;
  final DateTime createdAt;
  UserModel({
    required this.id,
    required this.username,
    required this.firstName,
    this.middleName,
    this.lastName,
    required this.profilePic,
    this.phoneNum,
    this.country,
    required this.profileViews,
    required this.createdAt,
  });

  UserModel copyWith({
    String? id,
    String? username,
    String? firstName,
    String? middleName,
    String? lastName,
    String? profilePic,
    String? phoneNum,
    String? country,
    int? profileViews,
    DateTime? createdAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      username: username ?? this.username,
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      lastName: lastName ?? this.lastName,
      profilePic: profilePic ?? this.profilePic,
      phoneNum: phoneNum ?? this.phoneNum,
      country: country ?? this.country,
      profileViews: profileViews ?? this.profileViews,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'profilePic': profilePic,
      'phoneNum': phoneNum,
      'country': country,
      'profileViews': profileViews,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      username: map['username'] as String,
      firstName: map['first_name'] as String,
      middleName:
          map['middle_name'] != null ? map['middle_name'] as String : null,
      lastName: map['last_name'] != null ? map['last_name'] as String : null,
      profilePic: map['profile_pic'] as String,
      phoneNum:
          map['phone_number'] != null ? map['phone_number'] as String : null,
      country: map['country'] != null ? map['country'] as String : null,
      profileViews: map['profile_views'] as int,
      createdAt: DateTime.parse(map['created_at'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, username: $username, firstName: $firstName, middleName: $middleName, lastName: $lastName, profilePic: $profilePic, phoneNum: $phoneNum, country: $country, profileViews: $profileViews, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.username == username &&
        other.firstName == firstName &&
        other.middleName == middleName &&
        other.lastName == lastName &&
        other.profilePic == profilePic &&
        other.phoneNum == phoneNum &&
        other.country == country &&
        other.profileViews == profileViews &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        username.hashCode ^
        firstName.hashCode ^
        middleName.hashCode ^
        lastName.hashCode ^
        profilePic.hashCode ^
        phoneNum.hashCode ^
        country.hashCode ^
        profileViews.hashCode ^
        createdAt.hashCode;
  }
}
