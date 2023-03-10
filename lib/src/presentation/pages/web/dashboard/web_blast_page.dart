import 'package:app_hris/src/presentation/bloc/blast/blast_bloc.dart';
import 'package:app_hris/src/presentation/pages/web/dashboard/widgets/multiple_blast_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../utils/app_color.dart';
import '../../../../../utils/app_constanta_list.dart';
import '../../../../../utils/app_text.dart';
import 'widgets/single_blast_widget.dart';
import 'widgets/web_header.dart';

class WebBlastPage extends StatefulWidget {
  const WebBlastPage({super.key});

  @override
  State<WebBlastPage> createState() => _WebBlastPageState();
}

class _WebBlastPageState extends State<WebBlastPage> {
  final _blastBloc = BlastBloc();

  @override
  void initState() {
    _blastBloc.add(BlastInitializeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BlastBloc>(
      create: (_) => _blastBloc,
      child: Scaffold(
        key: _blastBloc.globalKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: false,
          automaticallyImplyLeading: false,
          title: const WebHeader(title: "Blast"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: BlocBuilder<BlastBloc, BlastState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        Row(
                          children: List.generate(
                            listBlast.length,
                            (index) => Container(
                              margin: const EdgeInsets.only(right: 6),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: listBlast[index] == state.type
                                    ? colorPrimaryDark
                                    : Colors.grey.shade200,
                              ),
                              child: InkWell(
                                onTap: () => _blastBloc.add(
                                    BlastOnChangeTypeEvent(listBlast[index])),
                                child: AppText.labelW500(
                                  listBlast[index],
                                  14,
                                  listBlast[index] == state.type
                                      ? Colors.white
                                      : Colors.grey.shade600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        if (state.type == "Single")
                          SingleBlastWidget(blastBloc: _blastBloc),
                        if (state.type == "Multiple")
                          MultipleBlastWidget(blastBloc: _blastBloc),
                      ],
                    );
                  },
                ),
              ),
              const Expanded(
                child: SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
