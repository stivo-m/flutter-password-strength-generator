import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:password_strength_checker/logic/password_checks.dart';

part 'password_event.dart';
part 'password_state.dart';

class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  PasswordBloc() : super(PasswordInitial());

  @override
  Stream<PasswordState> mapEventToState(
    PasswordEvent event,
  ) async* {
    if (event is ValidatePassword) {
      double strength = passwordCheck.validatePassword(event.password);
      if (strength < 90) {
        yield WeakPassword(
          error: passwordCheck.err,
          strength: strength,
        );
      } else {
        yield StrongPassword(strength: strength, success: '');
      }
    }
  }
}
