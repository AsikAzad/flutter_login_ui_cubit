import 'package:equatable/equatable.dart';

class UserData extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? token;

  const UserData({this.id, this.name, this.email, this.token});

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json['Id'] as int?,
        name: json['Name'] as String?,
        email: json['Email'] as String?,
        token: json['Token'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'Id': id,
        'Name': name,
        'Email': email,
        'Token': token,
      };

  @override
  List<Object?> get props => [id, name, email, token];
}
