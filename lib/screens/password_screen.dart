import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_strength_checker/logic/bloc/password_bloc.dart';
import 'package:password_strength_checker/logic/password_checks.dart';
import 'package:password_strength_checker/widgets/widgets.dart';

class PasswordScreen extends StatefulWidget {
  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  @override
  void initState() {
    passwordCheck.validatePassword('');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _strength = 0.0;
    List<String> _err = [];

    return Material(
      child: SafeArea(
        child: Container(
          color: Theme.of(context).backgroundColor,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 20.0,
            ),
            child: BlocProvider(
                create: (context) => PasswordBloc(),
                child: BlocBuilder<PasswordBloc, PasswordState>(
                  builder: (context, state) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                PASSWORD_STRENGTH_TEXT,
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 44,
                                ),
                              ),
                              Text(
                                PASSWORD_STRENGTH_TEXT_BOTTOM,
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 44,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        TextField(
                          onChanged: (value) => {
                            BlocProvider.of<PasswordBloc>(context).add(
                              ValidatePassword(password: value),
                            )
                          },
                          onSubmitted: (value) => {
                            BlocProvider.of<PasswordBloc>(context).add(
                              ValidatePassword(password: value),
                            )
                          },
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 30.0,
                              horizontal: 15.0,
                            ),
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                            labelText: PASSWORD_INPUT_TEXT,
                          ),
                        ),
                        BlocListener<PasswordBloc, PasswordState>(
                          listener: (context, state) {
                            if (state is WeakPassword) {
                              _strength = state.strength;
                              _err = state.error;
                            }
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 15.0,
                              ),
                              PasswordStrengthMeter(
                                strength: _strength,
                              ),
                              SizedBox(
                                height: 35.0,
                              ),
                              Text(
                                _err.length > 0
                                    ? ''
                                    : ERROR_TITLE_TEXT.toUpperCase(),
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 25,
                                ),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              ErrorTile(errors: _err),
                            ],
                          ),
                        )
                      ],
                    );
                  },
                )),
          ),
        ),
      ),
    );
  }
}
