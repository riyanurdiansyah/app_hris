import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../../../../../utils/app_text.dart';
import 'web_chart_home_card.dart';

class WebLastActivityHomeCard extends StatelessWidget {
  const WebLastActivityHomeCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 25),
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.labelBold(
                    "Last Activities",
                    14,
                    Colors.black,
                  ),
                  Column(
                    children: List.generate(
                      3,
                      (index) => SizedBox(
                        height: 65,
                        child: TimelineTile(
                          indicatorStyle: IndicatorStyle(
                            drawGap: true,
                            width: 40,
                            height: 40,
                            indicator: Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(
                                    "assets/images/user.png",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          beforeLineStyle: LineStyle(
                            thickness: 2.5,
                            color: Colors.grey.shade600.withOpacity(0.3),
                          ),
                          afterLineStyle: LineStyle(
                            color: Colors.grey.shade600.withOpacity(0.3),
                            thickness: 2.5,
                          ),
                          isFirst: index == 0,
                          isLast: index + 1 == 3,
                          endChild: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 15,
                                ),
                                AppText.labelW600(
                                  "Request",
                                  9.6,
                                  Colors.green,
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                AppText.labelBold(
                                  "Arip melakukan request attendance",
                                  11.5,
                                  Colors.black,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                AppText.labelW600(
                                  "Just Now",
                                  11.5,
                                  Colors.grey.shade400,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 14,
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 25),
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: const WebChartHomeCard(),
            ),
          ),
        ],
      ),
    );
  }
}
