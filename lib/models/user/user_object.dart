import 'package:equatable/equatable.dart';

import 'user_data.dart';

class UserObject extends Equatable {
  final int? code;
  final String? message;
  final UserData? data;

  const UserObject({this.code, this.message, this.data});

  factory UserObject.fromJson(Map<String, dynamic> json) => UserObject(
        code: json['code'] as int?,
        message: json['message'] as String?,
        data: json['data'] == null
            ? null
            : UserData.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'message': message,
        'data': data?.toJson(),
      };

  @override
  List<Object?> get props => [code, message, data];
}
