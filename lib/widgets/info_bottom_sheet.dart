import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class InfoBottomSheet extends StatelessWidget {
  const InfoBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Gap(16),
        Text(
          'Programma barada',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        Gap(20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'Dilewar - Gepleşik programmasy arkaly italýan we iňlis dillerinde jemgyýetçilik ýerlerinde köp ullanylýan sözleri öwrenip bilersinňiz',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ),
        Spacer(),
        Text('v1.0.0'),
        Gap(12),
      ],
    );
  }
}
