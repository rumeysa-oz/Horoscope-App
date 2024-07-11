import 'package:flutter/material.dart';
import 'package:horoscope_app/data/strings.dart';
import 'package:horoscope_app/horoscope_item.dart';
import 'package:horoscope_app/model/horoscope.dart';

// ignore: must_be_immutable
class HoroscopeList extends StatelessWidget {
  late List<Horoscope> allHoroscopes;
  HoroscopeList() {
    allHoroscopes = prepareDataSource();
    print(allHoroscopes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zodiac Sign List'),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            // Bunu ekledim
            return HoroscopeItem(
              listHoroscope: allHoroscopes[index],
            );
          },
          itemCount: allHoroscopes.length,
        ),
      ),
    );
  }
}

List<Horoscope> prepareDataSource() {
  List<Horoscope> temporarily = [];
  for (int i = 0; i < 12; i++) {
    var horoscopeName = Strings.horoscopeNames[i];
    var horoscopeDate = Strings.horoscopeDates[i];
    var horoscopeDetail = Strings.horoscopeGeneralProperties[i];
    // Ex: aries.png => Aries --> aries --> aries + .png
    var horoscopeIcon = Strings.horoscopeNames[i].toLowerCase() + '.png';
    // Ex: aries1.png => Aries --> aries --> aries + 1 + .png
    var horoscopeImage = Strings.horoscopeNames[i].toLowerCase() + '1.png';

    Horoscope addingHoroscope = Horoscope(horoscopeName, horoscopeDate,
        horoscopeDetail, horoscopeIcon, horoscopeImage);
    temporarily.add(addingHoroscope);
  }
  return temporarily;
}
