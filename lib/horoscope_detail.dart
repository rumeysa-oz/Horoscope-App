import 'package:flutter/material.dart';
import 'package:horoscope_app/model/horoscope.dart';
import 'package:palette_generator/palette_generator.dart';

class HoroscopeDetail extends StatefulWidget {
  // StatelessWidget'ı StatefulWidget'a dönüştür
  final Horoscope choosingHoroscope;
  const HoroscopeDetail({required this.choosingHoroscope, Key? key})
      : super(key: key);

  @override
  State<HoroscopeDetail> createState() => _HoroscopeDetailState();
}

class _HoroscopeDetailState extends State<HoroscopeDetail> {
  Color appbarColor = Colors.transparent;
  late PaletteGenerator? _generator;

  @override
  void initState() {
    super.initState();
    findAppbarColor();
    // Bunu ekledim
    print('Run initState');
    WidgetsBinding.instance.addPostFrameCallback((_) => findAppbarColor());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            backgroundColor: appbarColor,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                widget.choosingHoroscope.horoscopeName +
                    ' Zodiac Sign and Features',
                style: const TextStyle(fontSize: 17),
              ),
              centerTitle: true,
              background: Image.asset(
                // ignore: prefer_interpolation_to_compose_strings
                "images/" + widget.choosingHoroscope.horoscopeImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            // Bunu ekledim
            child: Container(
              margin: EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Text(
                  widget.choosingHoroscope.horoscopeDetail,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void findAppbarColor() async {
    // Bunu ekledim
    print("Finished build, dominant color will be found.");
    _generator = await PaletteGenerator.fromImageProvider(
        AssetImage("images/${widget.choosingHoroscope.horoscopeImage}"));
    appbarColor = _generator!.lightVibrantColor!.color;
    // Bunu ekledim
    print("Dominant color found, Built method will be called again.");
    setState(() {});
    print("Appbar Color: $appbarColor");
  }
}
