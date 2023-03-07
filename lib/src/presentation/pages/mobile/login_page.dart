import 'package:app_hris/services/app_route_name_mobile.dart';
import 'package:app_hris/src/presentation/bloc/auth/auth_bloc.dart';
import 'package:app_hris/utils/app_color.dart';
import 'package:app_hris/utils/app_format_text.dart';
import 'package:app_hris/utils/app_validator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final _tcEmail = TextEditingController();
final _tcPassword = TextEditingController();
final _formKey = GlobalKey<FormState>();
bool _isVisible = true;

class _LoginPageState extends State<LoginPage> {
  @override
  void dispose() {
    _tcEmail.dispose();
    _tcPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider<AuthBloc>(
      create: (_) => AuthBloc()..add(AuthSetupEvent()),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoginErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.errorMsg,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                backgroundColor: Colors.red,
                duration: const Duration(milliseconds: 900),
              ),
            );
          }

          if (state is AuthLoginSuccessState) {
            context.goNamed(AppRouteNameMobile.home);
          }
        },
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 35),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: size.width,
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/images/logo.png",
                            filterQuality: FilterQuality.high,
                            width: 225,
                          ),
                        ),
                        TextFormField(
                          controller: _tcEmail,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.next,
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.emailAddress,
                          style: GoogleFonts.poppins(
                            color: Colors.black54,
                          ),
                          inputFormatters: [
                            AppLowerCaseTxt(),
                          ],
                          validator: (value) => AppValidator.checkEmail(value!),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            hintText: "johndoe@example.com",
                            hintStyle: GoogleFonts.poppins(
                              color: Colors.black54,
                              fontSize: 16,
                            ),
                            label: Text(
                              "Email",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _tcPassword,
                          obscureText: _isVisible,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.next,
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.emailAddress,
                          style: GoogleFonts.poppins(
                            color: Colors.black54,
                          ),
                          inputFormatters: [
                            AppLowerCaseTxt(),
                          ],
                          validator: (value) =>
                              AppValidator.checkFieldPass(value!),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            hintText: "********",
                            hintStyle: GoogleFonts.poppins(
                              color: Colors.black54,
                              fontSize: 16,
                            ),
                            label: Text(
                              "Password",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                              ),
                            ),
                            suffixIcon: GestureDetector(
                              onTap: (() {
                                setState(() {
                                  _isVisible = !_isVisible;
                                });
                              }),
                              child: Icon(
                                !_isVisible
                                    ? CupertinoIcons.eye
                                    : CupertinoIcons.eye_slash,
                                color: Colors.black54,
                                size: 18,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                              child: Checkbox(
                                value: false,
                                onChanged: (val) {},
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              "Remember me",
                              style: GoogleFonts.poppins(
                                color: colorPrimaryDark,
                                fontSize: 12,
                              ),
                            ),
                            const Spacer(),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Forgot Password",
                                style: GoogleFonts.poppins(
                                  color: colorPrimaryDark,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
                  if (state is AuthLoadingState) {
                    return Container(
                      width: double.infinity,
                      height: size.height,
                      color: Colors.transparent,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 35),
                          width: 50,
                          height: 50,
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const CircularProgressIndicator(
                            color: Colors.black26,
                          ),
                        ),
                      ),
                    );
                  }

                  return const SizedBox();
                }),
              ],
            ),
            bottomNavigationBar: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 18),
                  width: size.width,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorPrimaryDark,
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(
                            AuthLoginEvent(_tcEmail.text, _tcPassword.text));
                      }
                    },
                    child: Text(
                      "signin".tr(),
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 18),
                  width: size.width,
                  height: 50,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: colorPrimaryDark,
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Sign Up",
                      style: GoogleFonts.poppins(
                        color: colorPrimaryDark,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
