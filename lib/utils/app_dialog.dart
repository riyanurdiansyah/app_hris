import 'package:app_hris/utils/app_color.dart';
import 'package:app_hris/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class AppDialog {
  static dialogNoAction({
    required BuildContext context,
    required String title,
    String? text,
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
            child: AppText.labelW600(
              title,
              16,
              Colors.black,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () => context.pop(),
                child: const Text(
                  'Kembali',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static dialogFailedAttendance({
    required BuildContext context,
    required String title,
    required String body,
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: const Color(0xff1C1D20),
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(
                height: 11,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: ClipOval(
                      child: Container(
                        width: 16,
                        height: 16,
                        color: const Color(0xffF63C3C),
                        child: const Center(
                          child: Text(
                            '!',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Expanded(
                    child: Text(
                      body,
                      style: GoogleFonts.poppins(
                        height: 1.3,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff33353A),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 23,
              ),
              Row(
                children: [
                  const Spacer(),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          context.pop();
                        },
                        child: Text(
                          'Coba lagi',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: colorPrimaryDark,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15.5,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
