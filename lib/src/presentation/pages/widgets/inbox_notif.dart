import 'package:app_hris/utils/app_constanta_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class InboxNotif extends StatelessWidget {
  const InboxNotif({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(
        listInbox.length,
        (index) => Slidable(
          endActionPane: ActionPane(
            motion: const BehindMotion(),
            children: [
              SlidableAction(
                flex: 20,
                onPressed: (_) {},
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                icon: Icons.delete_rounded,
                autoClose: true,
                label: 'Delete',
              ),
            ],
          ),
          child: const ListTile(title: Text('Slide me')),
        ),
      ),
    );
  }
}
