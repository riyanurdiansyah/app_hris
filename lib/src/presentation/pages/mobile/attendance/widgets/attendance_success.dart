import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AttendanceSuccess extends StatelessWidget {
  const AttendanceSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(
              Icons.close_rounded,
            ),
          ),
        ],
      ),
      body: Container(
        width: size.width,
        height: size.height,
        color: Colors.white,
        child: Column(
          children: const [],
        ),
      ),
    );
  }
}
