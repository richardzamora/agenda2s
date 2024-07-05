import 'package:agds/tokens/text_style.dart';
import 'package:agenda2/ui/helpers/responsive_widget.dart';
import 'package:flutter/material.dart';
import 'package:agds/agds.dart';

class LoginPage extends StatefulWidget {
  static String routeName = '/login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                        child: TextFormField(
                          style: AgTextStyle.ralewayStyle.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AgColors.secondaryColor(context),
                            fontSize: 12.0,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.email),
                            ),
                            contentPadding: const EdgeInsets.only(top: 16.0),
                            hintText: 'Enter Email',
                            hintStyle: AgTextStyle.ralewayStyle.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AgColors.secondaryColor(context)
                                  .withOpacity(0.5),
                              fontSize: 12.0,
                            ),
                          ),
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
                        child: TextFormField(
                          style: AgTextStyle.ralewayStyle.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AgColors.secondaryColor(context),
                            fontSize: 12.0,
                          ),
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.show_chart),
                            ),
                            prefixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.lock),
                            ),
                            contentPadding: const EdgeInsets.only(top: 16.0),
                            hintText: 'Enter Password',
                            hintStyle: AgTextStyle.ralewayStyle.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AgColors.secondaryColor(context)
                                  .withOpacity(0.5),
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ),
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
                          onTap: () {},
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
}
