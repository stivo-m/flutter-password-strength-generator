part of 'password_bloc.dart';

@immutable
abstract class PasswordEvent {}

class ValidatePassword extends PasswordEvent {
  final String password;

  ValidatePassword({this.password});
}
