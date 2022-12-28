import 'package:app_hris/src/presentation/pages/widgets/inbox_notif.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/app_color.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.6,
          automaticallyImplyLeading: false,
          title: Text(
            "Inbox",
            style: GoogleFonts.poppins(
              fontSize: 16.5,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          bottom: TabBar(
            indicatorWeight: 4,
            indicatorColor: colorPrimaryDark,
            unselectedLabelColor: Colors.grey.shade500,
            labelColor: colorPrimaryDark,
            labelStyle: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
            ),
            tabs: const [
              Tab(
                text: "Pemberitahuan",
              ),
              Tab(
                text: "Persetujuan",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const InboxNotif(),
            Container(
              color: Colors.amber,
            ),
          ],
        ),
      ),
    );
  }
}
