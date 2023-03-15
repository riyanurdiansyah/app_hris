import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../utils/app_format_text.dart';
import '../../../../../../../utils/app_text.dart';
import '../../../../../../../utils/app_validator.dart';

class InforPersonalWidget extends StatelessWidget {
  const InforPersonalWidget({
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
                  "Info Personal",
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
                        "Nama Depan",
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
                        "Tempat Lahir",
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
                        "Email",
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
                        "Status Pernikahan",
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
                        "Tipe ID",
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
                        "Alamat Sesuai Identitas",
                        14,
                        Colors.black,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        minLines: 6,
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.next,
                        maxLines: null,
                        validator: (val) => AppValidator.checkNumberPhone(val!),
                        decoration: InputDecoration(
                          hintStyle: GoogleFonts.poppins(),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 12),
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
                        "Nama Belakang",
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
                        "Tanggal Lahir",
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
                        "No Handphone",
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
                      const SizedBox(
                        height: 20,
                      ),
                      AppText.labelW600(
                        "Agama",
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
                        "Nomor ID",
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
                        "Alamat Tempat Tinggal",
                        14,
                        Colors.black,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        minLines: 6,
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.next,
                        maxLines: null,
                        validator: (val) => AppValidator.checkNumberPhone(val!),
                        decoration: InputDecoration(
                          hintStyle: GoogleFonts.poppins(),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 12),
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
