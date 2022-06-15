import 'package:quran/quran.dart' as quran;
import '../sora_text.dart';
import 'package:flutter/material.dart';

class Moshaf extends StatelessWidget {
  const Moshaf({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: double.infinity,
          child: const Text("المصحف"),
          alignment: Alignment.center,
        ),
        backgroundColor: Colors.brown,
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider(
            color: Colors.white,
            height: 2,
          );
        },
        itemCount: 114,
        itemBuilder: (context, index) {
          String place = quran.getPlaceOfRevelation(index + 1) == 'Makkah'
              ? 'مكية'
              : 'مدنية';
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return SoraText(id: index + 1);
                  },
                ),
              );
            },
            child: ListTile(
              title: Text(
                quran.getSurahNameArabic(index + 1),
                textAlign: TextAlign.right,
              ),
              subtitle: Text(
                'وآياتها ${quran.getVerseCount(index + 1)}',
                textAlign: TextAlign.right,
              ),
              leading: Text(place),
            ),
          );
        },
      ),
    );
  }
}
