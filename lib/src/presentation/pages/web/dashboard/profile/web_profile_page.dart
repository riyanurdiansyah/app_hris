import 'package:app_hris/src/presentation/bloc/profile/profile_bloc.dart';
import 'package:app_hris/src/presentation/pages/web/dashboard/profile/widgets/info_payroll_widget.dart';
import 'package:app_hris/src/presentation/pages/web/dashboard/profile/widgets/info_perusahaan_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../utils/app_color.dart';
import '../../../../../../utils/app_constanta_list.dart';
import '../../../../../../utils/app_text.dart';
import '../widgets/web_header.dart';
import 'widgets/info_personal_widget.dart';

class WebProfilePage extends StatefulWidget {
  const WebProfilePage({super.key});

  @override
  State<WebProfilePage> createState() => _WebProfilePageState();
}

class _WebProfilePageState extends State<WebProfilePage> {
  final _profileBloc = ProfileBloc();

  @override
  void initState() {
    _profileBloc.add(const ProfileEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider<ProfileBloc>(
      create: (context) => _profileBloc,
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
                  child: BlocBuilder<ProfileBloc, ProfileState>(
                    builder: (context, state) {
                      return Row(
                        children: List.generate(
                          listProfile.length,
                          (index) => Container(
                            margin: const EdgeInsets.only(right: 6),
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: listProfile[index] == state.type
                                  ? colorPrimaryDark
                                  : Colors.white,
                            ),
                            child: InkWell(
                              onTap: () => _profileBloc.add(
                                  ProfileChangeTypeEvent(listProfile[index])),
                              child: AppText.labelW500(
                                listProfile[index],
                                14,
                                listProfile[index] == state.type
                                    ? Colors.white
                                    : Colors.grey.shade600,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                BlocBuilder<ProfileBloc, ProfileState>(
                  builder: (context, state) {
                    return IndexedStack(
                      index: listProfile.indexWhere((e) => e == state.type),
                      children: const [
                        InforPersonalWidget(),
                        InforPerusahaanWidget(),
                        InfoPayrollWidget(),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
