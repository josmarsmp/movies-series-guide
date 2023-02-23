import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/sign_in_controller.dart';
import '../controller/state/sign_in_state.dart';
import 'widgets/submit_button.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignInController>(
      create: (_) => SignInController(
        const SignInState(
          fetching: false,
          password: '',
          username: '',
        ),
        authenticationRepository: context.read(),
      ),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              child: Builder(
                builder: (context) {
                  final SignInController controller = context.watch();
                  return AbsorbPointer(
                    absorbing: controller.state.fetching,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onChanged: (text) {
                            controller.onUsernameChanged(text);
                          },
                          decoration: const InputDecoration(
                            hintText: 'Username',
                          ),
                          validator: (text) {
                            text = text?.trim() ?? '';

                            if (text.isEmpty) {
                              return 'Invalid username';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onChanged: (text) {
                            controller.onPasswordChanged(text);
                          },
                          decoration: const InputDecoration(
                            hintText: 'Password',
                          ),
                          validator: (text) {
                            text = text?.replaceAll(' ', '') ?? '';

                            if (text.length < 4) {
                              return 'Password must be at least 4 characters length';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        const SubmitButton()
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
