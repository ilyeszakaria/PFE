import '../../widgets/scaffold.dart';
import 'package:quran/quran.dart' as quran;
import 'package:flutter/material.dart';

class SoraText extends StatelessWidget {
  final int id;
  const SoraText({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String soraText = '';
    for (int i = 1; i <= quran.getVerseCount(id); i++) {
      soraText += quran.getVerse(id, i, verseEndSymbol: true);
    }
    return ScaffoldWidget(
      pageTitle: quran.getSurahNameArabic(id),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              quran.basmala,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'kitab',
              ),
            ),
            Text(
              soraText,
              textAlign: TextAlign.right,
              style: const TextStyle(fontFamily: 'kitab'),
            ),
          ],
        ),
      ),
    );
  }
}
