import 'package:app_hris/utils/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AkunPage extends StatelessWidget {
  const AkunPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Akun",
                  style: GoogleFonts.poppins(
                    fontSize: 16.5,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/images/user.png",
                          ),
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Riyan Nurdiansyah",
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Mobile Developer",
                          style: GoogleFonts.poppins(
                            fontSize: 12.5,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Info saya",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ListTile(
                onTap: () {},
                minLeadingWidth: 26,
                leading: FaIcon(
                  FontAwesomeIcons.solidUser,
                  color: colorSecondaryDark,
                  size: 20,
                ),
                title: Text(
                  "Info Personal",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              ListTile(
                onTap: () {},
                minLeadingWidth: 26,
                leading: FaIcon(
                  FontAwesomeIcons.building,
                  color: colorSecondaryDark,
                  size: 20,
                ),
                title: Text(
                  "Info Pekerjaan",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              ListTile(
                onTap: () {},
                minLeadingWidth: 26,
                leading: FaIcon(
                  FontAwesomeIcons.phone,
                  color: colorSecondaryDark,
                  size: 20,
                ),
                title: Text(
                  "Info Kontak Darurat",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              ListTile(
                onTap: () {},
                minLeadingWidth: 26,
                leading: FaIcon(
                  CupertinoIcons.person_2_fill,
                  color: colorSecondaryDark,
                  size: 20,
                ),
                title: Text(
                  "Info Keluarga",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              ListTile(
                onTap: () {},
                minLeadingWidth: 26,
                leading: FaIcon(
                  CupertinoIcons.money_dollar_circle_fill,
                  color: colorSecondaryDark,
                  size: 20,
                ),
                title: Text(
                  "Info Payroll",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Pengaturan",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ListTile(
                onTap: () {},
                minLeadingWidth: 26,
                leading: FaIcon(
                  FontAwesomeIcons.lock,
                  color: colorSecondaryDark,
                  size: 20,
                ),
                title: Text(
                  "Ubah Kata Sandi",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              ListTile(
                onTap: () {},
                minLeadingWidth: 26,
                leading: FaIcon(
                  FontAwesomeIcons.fingerprint,
                  color: colorSecondaryDark,
                  size: 20,
                ),
                title: Text(
                  "Sidik Jari",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: Text(
                  "Tidak Aktif",
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              ListTile(
                onTap: () {},
                minLeadingWidth: 26,
                leading: FaIcon(
                  FontAwesomeIcons.recordVinyl,
                  color: colorSecondaryDark,
                  size: 20,
                ),
                title: Text(
                  "Pengingat Absen",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              ListTile(
                onTap: () {},
                minLeadingWidth: 26,
                leading: FaIcon(
                  FontAwesomeIcons.earthAsia,
                  color: colorSecondaryDark,
                  size: 20,
                ),
                title: Text(
                  "Bahasa",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: Text(
                  "Indonesia",
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Lainnya",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ListTile(
                onTap: () {},
                minLeadingWidth: 26,
                leading: FaIcon(
                  FontAwesomeIcons.noteSticky,
                  color: colorSecondaryDark,
                  size: 20,
                ),
                title: Text(
                  "FAQ",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              ListTile(
                onTap: () {},
                minLeadingWidth: 26,
                leading: FaIcon(
                  FontAwesomeIcons.shield,
                  color: colorSecondaryDark,
                  size: 20,
                ),
                title: Text(
                  "Keamanan & Privasi",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              ListTile(
                onTap: () {},
                minLeadingWidth: 26,
                leading: FaIcon(
                  FontAwesomeIcons.comment,
                  color: colorSecondaryDark,
                  size: 20,
                ),
                title: Text(
                  "Berikan Feedback",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              ListTile(
                onTap: () {},
                minLeadingWidth: 26,
                leading: FaIcon(
                  FontAwesomeIcons.arrowRightFromBracket,
                  color: colorSecondaryDark,
                  size: 20,
                ),
                title: Text(
                  "Keluar",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
