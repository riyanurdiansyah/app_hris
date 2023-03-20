import 'package:app_hris/src/presentation/bloc/request/request_bloc.dart';
import 'package:app_hris/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../utils/app_color.dart';
import '../widgets/web_header.dart';

class WebRequestPage extends StatefulWidget {
  const WebRequestPage({super.key});

  @override
  State<WebRequestPage> createState() => _WebRequestPageState();
}

class _WebRequestPageState extends State<WebRequestPage> {
  final _RequestBloc = RequestBloc();

  @override
  void initState() {
    _RequestBloc.add(const RequestEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider<RequestBloc>(
      create: (context) => _RequestBloc,
      child: Scaffold(
        backgroundColor: backgroundGrey,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(right: 35),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 25,
                ),
                const WebHeader(),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 14),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/web/request/open.png",
                                    width: 45,
                                  ),
                                  const SizedBox(
                                    width: 14,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        AppText.labelW600(
                                          "Attendance",
                                          14,
                                          Colors.black,
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        AppText.labelW600(
                                          "5 Request",
                                          12.5,
                                          Colors.grey.shade600,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {},
                                    child: Icon(
                                      Icons.assistant_direction_rounded,
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 14),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/web/request/open.png",
                                    width: 45,
                                  ),
                                  const SizedBox(
                                    width: 14,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        AppText.labelW600(
                                          "Izin",
                                          14,
                                          Colors.black,
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        AppText.labelW600(
                                          "10 Request",
                                          12.5,
                                          Colors.grey.shade600,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {},
                                    child: Icon(
                                      Icons.assistant_direction_rounded,
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 14),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/web/request/open.png",
                                    width: 45,
                                  ),
                                  const SizedBox(
                                    width: 14,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        AppText.labelW600(
                                          "Cuti",
                                          14,
                                          Colors.black,
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        AppText.labelW600(
                                          "0 Request",
                                          12.5,
                                          Colors.grey.shade600,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {},
                                    child: Icon(
                                      Icons.assistant_direction_rounded,
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 14),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/web/request/open.png",
                                    width: 45,
                                  ),
                                  const SizedBox(
                                    width: 14,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        AppText.labelW600(
                                          "Reimbursment",
                                          14,
                                          Colors.black,
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        AppText.labelW600(
                                          "25 Request",
                                          12.5,
                                          Colors.grey.shade600,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {},
                                    child: Icon(
                                      Icons.assistant_direction_rounded,
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
