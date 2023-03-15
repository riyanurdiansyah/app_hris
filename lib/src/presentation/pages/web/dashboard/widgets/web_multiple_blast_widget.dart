import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../utils/app_color.dart';
import '../../../../../../utils/app_constanta_list.dart';
import '../../../../../../utils/app_text.dart';
import '../../../../../domain/entities/template_entity.dart';
import '../../../../bloc/blast/blast_bloc.dart';
import 'user_data_table.dart';

class WebMultipleBlastWidget extends StatelessWidget {
  const WebMultipleBlastWidget({
    Key? key,
    required BlastBloc blastBloc,
  })  : _blastBloc = blastBloc,
        super(key: key);

  final BlastBloc _blastBloc;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height / 1.16,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText.labelW600(
            "Unggah File",
            16,
            Colors.black,
          ),
          const SizedBox(
            height: 12,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintStyle: GoogleFonts.poppins(),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
              hintText: "Unggah File .csv",
              border: const OutlineInputBorder(),
              suffixIcon: Container(
                margin: const EdgeInsets.symmetric(vertical: 4),
                padding: const EdgeInsets.only(right: 12),
                child: OutlinedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    side: MaterialStateProperty.all(
                      BorderSide(
                        color: Colors.grey.shade400,
                        width: 0.5,
                      ),
                    ),
                  ),
                  onPressed: () => _blastBloc.add(BlastUploadCsvEvent()),
                  child: AppText.labelW500(
                    "Pilih",
                    14,
                    Colors.black,
                  ),
                ),
              ),
            ),
          ),
          BlocBuilder<BlastBloc, BlastState>(
            builder: (context, state) {
              if (state.listData == null) {
                return const SizedBox();
              }
              return Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  PaginatedDataTable(
                    rowsPerPage: 5,
                    arrowHeadColor: colorPrimaryDark,
                    columns: [
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            "Nama",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            "Posisi",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            "Hari",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            "Jam",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            "Group",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            "Link Group",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            "No Whatsapp",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            "Undangan",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            "Status",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                    source: UserDataTableSource(
                      userData: state.listData ?? [],
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          AppText.labelW600(
            "Pilih Template",
            16,
            Colors.black,
          ),
          const SizedBox(
            height: 12,
          ),
          DropdownButtonFormField<TemplateEntity>(
            items: templateBlast.map((TemplateEntity template) {
              return DropdownMenuItem<TemplateEntity>(
                value: template,
                child: Row(
                  children: <Widget>[
                    AppText.labelW600(
                      template.name,
                      14,
                      Colors.grey.shade600,
                    ),
                  ],
                ),
              );
            }).toList(),
            onChanged: (val) =>
                _blastBloc.add(BlastOnChangeTemplateEvent(val!)),
            decoration: InputDecoration(
              hintStyle: GoogleFonts.poppins(),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
              hintText: ".....",
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          BlocBuilder<BlastBloc, BlastState>(
            builder: (context, state) {
              return SizedBox(
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _blastBloc.add(
                    BlastSendMultipleMessageEvent(
                      listData: state.listData ?? [],
                    ),
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(colorPrimaryDark)),
                  child: AppText.labelBold(
                    "Kirim",
                    14,
                    Colors.white,
                  ),
                ),
              );
            },
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
