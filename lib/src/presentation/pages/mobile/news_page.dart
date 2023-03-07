import 'package:app_hris/utils/app_constanta.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 1,
        automaticallyImplyLeading: false,
        title: Text(
          "News",
          style: GoogleFonts.poppins(
            fontSize: 16.5,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView.separated(
        separatorBuilder: (_, __) => Divider(
          thickness: 0.6,
          color: Colors.grey.shade300,
        ),
        itemCount: 3,
        itemBuilder: (context, index) => InkWell(
          overlayColor: MaterialStateProperty.all(Colors.grey.shade300),
          onTap: () {},
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    image: DecorationImage(
                      image: const NetworkImage(
                        exampleImage,
                      ),
                      fit: BoxFit.fill,
                      filterQuality: FilterQuality.high,
                      onError: (_, __) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.error_outline_rounded,
                            color: Colors.red,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Cant load image",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mensana En Corpore Sano",
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      loremIpsum,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.timer,
                          size: 12,
                          color: Colors.grey.shade400,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          convertToAgo(DateTime.now()
                              .subtract(const Duration(minutes: 30))),
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
