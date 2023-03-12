import 'package:flutter/material.dart';

import '../../../../../../../utils/app_text.dart';

class WebRekapHomeCard extends StatelessWidget {
  const WebRekapHomeCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14),
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/web/home/attendance.png",
                      width: 18,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: AppText.labelBold(
                        "Hadir",
                        14,
                        Colors.black,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText.labelW600(
                      "50",
                      36,
                      Colors.grey.shade600,
                    ),
                    AppText.labelW500(
                      "/55",
                      12,
                      Colors.grey.shade600,
                    ),
                  ],
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 14),
            child: VerticalDivider(),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/web/home/request.png",
                      width: 18,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: AppText.labelBold(
                        "Request",
                        14,
                        Colors.black,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText.labelW600(
                      "5",
                      36,
                      Colors.grey.shade600,
                    ),
                  ],
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 14),
            child: VerticalDivider(),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/web/home/rekap.png",
                      width: 18,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: AppText.labelBold(
                        "Kehadiran",
                        14,
                        Colors.black,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText.labelW600(
                      "60",
                      36,
                      Colors.red,
                    ),
                    AppText.labelW500(
                      "%",
                      12,
                      Colors.red,
                    ),
                  ],
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 14),
            child: VerticalDivider(),
          ),
          Expanded(
            child: InkWell(
              onTap: () {},
              overlayColor: MaterialStateProperty.all(Colors.grey.shade300),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/web/home/ontime.png",
                        width: 18,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: AppText.labelBold(
                          "On-Time",
                          14,
                          Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText.labelW600(
                        "90",
                        36,
                        Colors.green,
                      ),
                      AppText.labelW500(
                        "%",
                        12,
                        Colors.green,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
