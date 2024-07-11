import 'package:flutter/material.dart';
//import 'package:horoscope_app/horoscope_detail.dart';
import 'package:horoscope_app/model/horoscope.dart';

class HoroscopeItem extends StatelessWidget {
  final Horoscope listHoroscope;
  const HoroscopeItem({required this.listHoroscope, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myTextStyle = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: () {
              // Bunu ekledim
              Navigator.pushNamed(context, '/horoscopeDetail',
                  arguments: listHoroscope);
            },
            leading: Image.asset(
              "images/" + listHoroscope.horoscopeIcon,
              height: 60,
              width: 60,
            ),
            title: Text(
              listHoroscope.horoscopeName,
              style: myTextStyle.headlineSmall,
            ),
            subtitle: Text(
              listHoroscope.horoscopeDate,
              style: myTextStyle.titleMedium,
            ),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.pink),
          ),
        ),
      ),
    );
  }
}
