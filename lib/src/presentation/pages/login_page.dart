import 'package:app_hris/services/app_route_name.dart';
import 'package:app_hris/src/presentation/bloc/auth/auth_bloc.dart';
import 'package:app_hris/utils/app_color.dart';
import 'package:app_hris/utils/app_format_text.dart';
import 'package:app_hris/utils/app_validator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

final _authBloc = AuthBloc();

class _LoginPageState extends State<LoginPage> {
  @override
  void dispose() {
    _tcEmail.dispose();
    _tcPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            context.goNamed(AppRouteName.main);
          }
        },
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: colorPrimaryDark,
            body: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 35),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "welcome_to".tr(),
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: colorSecondary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Project-X.",
                            style: GoogleFonts.poppins(
                              fontSize: 26,
                              color: colorPrimary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Spacer(),
                          TextButton.icon(
                            style: ButtonStyle(
                              overlayColor:
                                  MaterialStateProperty.all(Colors.red),
                            ),
                            onPressed: () {},
                            icon: FaIcon(
                              FontAwesomeIcons.earthAsia,
                              color: colorSecondary,
                              size: 16,
                            ),
                            label: Text(
                              EasyLocalization.of(context)!
                                          .currentLocale
                                          .toString() ==
                                      "en_US"
                                  ? "EN"
                                  : "ID",
                              style: GoogleFonts.poppins(
                                color: colorSecondary,
                                fontSize: 12.5,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
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
                          hintText: "Email",
                          hintStyle: GoogleFonts.poppins(),
                          isDense: true,
                          fillColor: const Color.fromARGB(221, 255, 255, 255),
                          filled: true,
                          errorStyle: GoogleFonts.montserrat(
                            color: Colors.red,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                          prefixIcon: Icon(
                            CupertinoIcons.mail_solid,
                            color: Colors.grey.shade400,
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.red.shade400,
                              width: 1.5,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(172, 255, 255, 255),
                              width: 1.5,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(172, 255, 255, 255),
                              width: 0.4,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey.shade400,
                              width: 0.4,
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
                        textInputAction: TextInputAction.done,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.visiblePassword,
                        style: GoogleFonts.poppins(
                          color: Colors.black54,
                        ),
                        validator: (value) =>
                            AppValidator.checkFieldPass(value!),
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: GoogleFonts.poppins(),
                          isDense: true,
                          fillColor: const Color.fromARGB(221, 255, 255, 255),
                          filled: true,
                          errorStyle: GoogleFonts.montserrat(
                            color: Colors.red,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                          prefixIcon: Icon(
                            CupertinoIcons.lock_fill,
                            color: Colors.grey.shade400,
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
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.red.shade400,
                              width: 1.5,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(172, 255, 255, 255),
                              width: 1.5,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(172, 255, 255, 255),
                              width: 0.4,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey.shade400,
                              width: 0.4,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "need_help".tr(),
                            style: GoogleFonts.poppins(
                              color: colorPrimary,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: Container(
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 26),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorPrimary,
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context
                        .read<AuthBloc>()
                        .add(AuthLoginEvent(_tcEmail.text, _tcPassword.text));
                  }
                },
                child: BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state is AuthLoadingState) {
                      return const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 5,
                          color: Colors.white,
                        ),
                      );
                    }
                    return Text(
                      "signin".tr(),
                      style: GoogleFonts.poppins(
                        color: colorPrimaryDark,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
