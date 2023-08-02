import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import '../../../providers/page_key_provider.dart';
import '../../../widgets/busy_button.dart';
import '../../../widgets/text_input/orange_text_form_field.dart';
import '../view_model/sign_in_page_view_model.dart';

class SignInPageView extends StatelessWidget {
  const SignInPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignInPageViewModel>.reactive(
      viewModelBuilder: () => SignInPageViewModel(),
      builder: (
        BuildContext context,
        SignInPageViewModel model,
        Widget? child,
      ) {
        final TextEditingController emailController = TextEditingController();
        final TextEditingController passwordController =
            TextEditingController();
        final BrownTextFormField emailField = BrownTextFormField(
          controller: emailController,
          labelText: 'Email',
          keyboardType: TextInputType.emailAddress,
          validator: model.validateEmail,
        );
        final BrownTextFormField passwordField = BrownTextFormField(
          controller: passwordController,
          labelText: 'Password',
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
          validator: model.validatePassword,
        );
        final List<BrownTextFormField> logInFormFields = [
          emailField,
          passwordField,
        ];

        return ResponsiveBuilder(builder: (context, sizingInformation) {
          return SingleChildScrollView(
            child: Align(
              alignment: Alignment.topCenter,
              child: AnimatedContainer(
                constraints: sizingInformation.isDesktop
                    ? const BoxConstraints(maxWidth: 1200)
                    : BoxConstraints(
                        maxWidth: sizingInformation.screenSize.width,
                      ),
                duration: const Duration(milliseconds: 60),
                padding: sizingInformation.isDesktop
                    ? const EdgeInsets.symmetric(horizontal: 90)
                    : const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sign In',
                      style: Theme.of(context).textTheme.displaySmall,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Don\'t have an account?',
                        style: Theme.of(context).textTheme.bodyLarge,
                        children: [
                          TextSpan(
                            text: ' Sign Up',
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: Theme.of(context).primaryColor,
                                    ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Provider.of<PageKeyProvider>(context,
                                        listen: false)
                                    .key = '/signup';
                              },
                          ),
                        ],
                      ),
                    ),
                    ...logInFormFields,
                    BusyButton(
                      title: 'Sign In',
                      busy: model.isBusy,
                      onPressed: () {
                        model.signIn(
                          context: context,
                          email: emailController.text,
                          password: passwordController.text,
                        );
                      },
                    ),
                  ].map(
                    (item) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 9),
                        child: item,
                      );
                    },
                  ).toList(),
                ),
              ),
            ),
          );
        });
      },
    );
  }
}
