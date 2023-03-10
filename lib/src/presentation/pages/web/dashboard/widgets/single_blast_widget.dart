import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../utils/app_constanta_list.dart';
import '../../../../../../utils/app_format_text.dart';
import '../../../../../../utils/app_text.dart';
import '../../../../../../utils/app_validator.dart';
import '../../../../../domain/entities/template_entity.dart';
import '../../../../bloc/blast/blast_bloc.dart';

class SingleBlastWidget extends StatelessWidget {
  const SingleBlastWidget({
    Key? key,
    required BlastBloc blastBloc,
  })  : _blastBloc = blastBloc,
        super(key: key);

  final BlastBloc _blastBloc;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.labelW600(
          "Token Developer",
          16,
          Colors.black,
        ),
        const SizedBox(
          height: 12,
        ),
        TextFormField(
          readOnly: true,
          controller: _blastBloc.tcToken,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.shade200,
            hintStyle: GoogleFonts.poppins(),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
            hintText: "Token",
            border: const OutlineInputBorder(),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        AppText.labelW600(
          "Nomor Tujuan",
          16,
          Colors.black,
        ),
        const SizedBox(
          height: 12,
        ),
        TextFormField(
          controller: _blastBloc.tcHP,
          inputFormatters: [
            AppPhoneText(),
          ],
          keyboardType: TextInputType.number,
          validator: (val) => AppValidator.checkNumberPhone(val!),
          decoration: InputDecoration(
            hintStyle: GoogleFonts.poppins(),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
            hintText: "081xxxxxx",
            border: const OutlineInputBorder(),
          ),
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
          onChanged: (val) => _blastBloc.add(BlastOnChangeTemplateEvent(val!)),
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
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: Colors.grey.shade500,
            ),
            color: Colors.grey.shade200,
          ),
          child: BlocBuilder<BlastBloc, BlastState>(
            builder: (context, state) {
              if (state.imageFile != null) {
                return Image.memory(
                  state.imageFile!,
                  fit: BoxFit.contain,
                );
              }
              return IconButton(
                onPressed: () => _blastBloc.add(BlastUploadImageEvent()),
                icon: Icon(
                  Icons.add_a_photo_rounded,
                  size: 70,
                  color: Colors.grey.shade600,
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 35,
        ),
        BlocBuilder<BlastBloc, BlastState>(
          builder: ((context, state) {
            if (state.template.contains("informasi")) {
              return Container(
                height: 80,
                width: double.infinity,
                color: Colors.red,
              );
            }
            if (state.template.contains("invitation")) {
              return Container(
                width: double.infinity,
                height: 80,
                color: Colors.blue,
              );
            }

            return const SizedBox();
          }),
        ),
        SizedBox(
          height: 45,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => _blastBloc.add(BlastSendMessageEvent()),
            child: AppText.labelBold(
              "Kirim",
              14,
              Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
