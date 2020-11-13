part of 'password_bloc.dart';

@immutable
abstract class PasswordState {}

class PasswordInitial extends PasswordState {}

class StrongPassword extends PasswordState {
  final String success;
  final double strength;

  StrongPassword({this.success, this.strength});
}

class WeakPassword extends PasswordState {
  final List<String> error;
  final double strength;

  WeakPassword({this.error, this.strength});
}
