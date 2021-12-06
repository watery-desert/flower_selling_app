import 'package:equatable/equatable.dart';

class AuthUser extends Equatable {
  const AuthUser({
    required this.email,
    required this.userID,
    required this.name,
  });

  final String userID;
  final String? email;
  final String? name;

  /// Empty user which represents an unauthenticated user.
  static const empty = AuthUser(
    email: '',
    userID: '',
    name: '',
  );

  @override
  List<Object?> get props => [
        email,
        userID,
        name,
      ];
}
