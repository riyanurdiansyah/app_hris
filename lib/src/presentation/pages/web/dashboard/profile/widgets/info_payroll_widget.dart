import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../utils/app_color.dart';
import '../../../../../../../utils/app_format_text.dart';
import '../../../../../../../utils/app_text.dart';
import '../../../../../../../utils/app_validator.dart';

class InfoPayrollWidget extends StatelessWidget {
  const InfoPayrollWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14),
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.labelW600(
                  "Info Payroll",
                  16,
                  Colors.black,
                ),
                const SizedBox(
                  height: 4,
                ),
                Container(
                  width: 110,
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      AppText.labelW600(
                        "BPJS Kesehatan",
                        14,
                        Colors.black,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        // inputFormatters: [
                        //   AppPhoneText(),
                        // ],
                        keyboardType: TextInputType.none,
                        validator: (val) => AppValidator.checkNumberPhone(val!),
                        cursorColor: colorPrimaryDark,
                        decoration: InputDecoration(
                          hintStyle: GoogleFonts.poppins(),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 12),
                          hintText: "...",
                          border: const OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: colorPrimaryDark,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AppText.labelW600(
                        "NPWP",
                        14,
                        Colors.black,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        // inputFormatters: [
                        //   AppPhoneText(),
                        // ],
                        keyboardType: TextInputType.none,
                        validator: (val) => AppValidator.checkNumberPhone(val!),
                        decoration: InputDecoration(
                          hintStyle: GoogleFonts.poppins(),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 12),
                          hintText: "...",
                          border: const OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AppText.labelW600(
                        "Nama Bank",
                        14,
                        Colors.black,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        // inputFormatters: [
                        //   AppPhoneText(),
                        // ],
                        keyboardType: TextInputType.none,
                        validator: (val) => AppValidator.checkNumberPhone(val!),
                        decoration: InputDecoration(
                          hintStyle: GoogleFonts.poppins(),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 12),
                          hintText: "...",
                          border: const OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AppText.labelW600(
                        "Status PTKP",
                        14,
                        Colors.black,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        inputFormatters: [
                          AppPhoneText(),
                        ],
                        keyboardType: TextInputType.none,
                        validator: (val) => AppValidator.checkNumberPhone(val!),
                        decoration: InputDecoration(
                          hintStyle: GoogleFonts.poppins(),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 12),
                          hintText: "...",
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      AppText.labelW600(
                        "BPJS Ketenagakerjaan",
                        14,
                        Colors.black,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        // inputFormatters: [
                        //   AppPhoneText(),
                        // ],
                        keyboardType: TextInputType.none,
                        validator: (val) => AppValidator.checkNumberPhone(val!),
                        decoration: InputDecoration(
                          hintStyle: GoogleFonts.poppins(),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 12),
                          hintText: "...",
                          border: const OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AppText.labelW600(
                        "Nama Pemilik Rekening",
                        14,
                        Colors.black,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        // inputFormatters: [
                        //   AppPhoneText(),
                        // ],
                        keyboardType: TextInputType.none,
                        validator: (val) => AppValidator.checkNumberPhone(val!),
                        decoration: InputDecoration(
                          hintStyle: GoogleFonts.poppins(),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 12),
                          hintText: "...",
                          border: const OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AppText.labelW600(
                        "Nomor Rekening",
                        14,
                        Colors.black,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        inputFormatters: [
                          AppPhoneText(),
                        ],
                        keyboardType: TextInputType.none,
                        validator: (val) => AppValidator.checkNumberPhone(val!),
                        decoration: InputDecoration(
                          hintStyle: GoogleFonts.poppins(),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 12),
                          hintText: "...",
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
