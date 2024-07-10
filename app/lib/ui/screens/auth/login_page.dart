import 'package:agds/tokens/text_style.dart';
import 'package:agenda2/domain/gateway/auth_gateway.dart';
import 'package:agenda2/ui/helpers/responsive_widget.dart';
import 'package:agenda2/ui/screens/auth/login_interface.dart';
import 'package:agenda2/ui/screens/auth/login_presenter.dart';
import 'package:flutter/material.dart';
import 'package:agds/agds.dart';

class LoginPage extends StatefulWidget {
  static String routeName = '/login';
  const LoginPage({
    required this.authGateway,
    required this.onLoginSuccess,
    Key? key,
  }) : super(key: key);

  final AuthGateway authGateway;
  final VoidCallback onLoginSuccess;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginInterface {
  late LoginPresenter presenter;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    presenter = LoginPresenter(widget.authGateway, this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AgColors.surfaceColor(context),
      body: SizedBox(
        height: height,
        width: width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ResponsiveWidget.isLargeScreen(context)
                ? Expanded(
                    child: Container(
                      height: height,
                      color: AgColors.primaryColor(context),
                      child: Center(
                        child: Text(
                          'Agenda2',
                          style: AgTextStyle.ralewayStyle.copyWith(
                            fontSize: 48.0,
                            color: AgColors.inverseSurfaceColor(context),
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
            Expanded(
              child: Container(
                height: height,
                margin: EdgeInsets.symmetric(
                    horizontal: ResponsiveWidget.isSmallScreen(context)
                        ? height * 0.032
                        : height * 0.12),
                color: AgColors.surfaceColor(context),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: height * 0.2),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Let’s',
                              style: AgTextStyle.ralewayStyle.copyWith(
                                fontSize: 25.0,
                                color: AgColors.primaryColor(context),
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            TextSpan(
                              text: ' Sign In 👇',
                              style: AgTextStyle.ralewayStyle.copyWith(
                                fontWeight: FontWeight.w800,
                                color: AgColors.secondaryColor(context),
                                fontSize: 25.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      Text(
                        'Hey, Enter your details to get sign in \nto your account.',
                        style: AgTextStyle.ralewayStyle.copyWith(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          color: AgColors.inverseSurfaceColor(context),
                        ),
                      ),
                      SizedBox(height: height * 0.064),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          'Email',
                          style: AgTextStyle.ralewayStyle.copyWith(
                            fontSize: 12.0,
                            color: AgColors.secondaryColor(context),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6.0),
                      Container(
                        height: 50.0,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: AgColors.surfaceColor(context),
                        ),
                        child: AgTextFormField(
                          controller: emailController,
                          hintText: "Enter email",
                          prefixIcon: Icons.email,
                        ),
                      ),
                      SizedBox(height: height * 0.014),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          'Password',
                          style: AgTextStyle.ralewayStyle.copyWith(
                            fontSize: 12.0,
                            color: AgColors.secondaryColor(context),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6.0),
                      Container(
                          height: 50.0,
                          width: width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: AgColors.surfaceColor(context),
                          ),
                          child: AgTextFormField(
                            obscureText: true,
                            controller: passwordController,
                            prefixIcon: Icons.lock,
                            hintText: 'Enter Password',
                          )),
                      SizedBox(height: height * 0.03),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot Password?',
                            style: AgTextStyle.ralewayStyle.copyWith(
                              fontSize: 12.0,
                              color: AgColors.primaryColor(context),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.05),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            String email = emailController.value.text;
                            String password = passwordController.value.text;
                            if (_validate(email, password)) {
                              presenter.onLogin(email, password);
                            } else {
                              print('show errors');
                            }
                          },
                          borderRadius: BorderRadius.circular(16.0),
                          child: Ink(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 70.0, vertical: 18.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              color: AgColors.primaryColor(context),
                            ),
                            child: Text(
                              'Sign In',
                              style: AgTextStyle.ralewayStyle.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AgColors.inverseSurfaceColor(context),
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _validate(email, password) {
    return true;
  }

  @override
  void hideLoading() {
    // TODO: implement hideLoading
  }

  @override
  void showLoading() {
    // TODO: implement showLoading
  }

  @override
  void onLoginSuccess() {
    widget.onLoginSuccess();
  }

  @override
  void showError(appError) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: Column(
                children: [
                  Text(appError.message ?? ''),
                  Text('Code: ${appError.errorCode}'),
                ],
              ),
            ));
  }
}
