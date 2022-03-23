import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:rfk/Widgets/Card.dart';
import 'package:rfk/Widgets/CardButton.dart';
import 'package:rfk/Widgets/Constants.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

final List<String> imgList = [
  'assets/img/img1.jpg',
  'assets/img/img2.jpg',
  'assets/img/img3.jpg',
];
final List<Widget> imageSliders = imgList
    .map((item) => Container(
          margin: const EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 3),
          child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              child: Stack(
                children: <Widget>[
                  Image.asset(item, fit: BoxFit.fill, width: 1000.0),
                  // Image.network(item, fit: BoxFit.cover, width: 1000.0),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                    ),
                  ),
                ],
              )),
        ))
    .toList();

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return _buttonCards(context);
  }
}

Widget _carrousel() {
  return CarouselSlider(
    options: CarouselOptions(
      autoPlay: true,
      aspectRatio: 2.0,
      enlargeCenterPage: true,
    ),
    items: imageSliders,
  );
}

Widget _buttonCards(BuildContext context) {
  return SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // CardHomeInformation(ctitle: "Visión", cdescription: vision),
        // CardHomeInformation(ctitle: "Misión", cdescription: mision),
        SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.3,
            child: _carrousel()),
        Row(children: [
          Expanded(
              child: CardButton(
                  id: 0, kimg: "assets/img/varones.png", ktitle: "Varones")),
          Expanded(
              child: CardButton(
                  id: 1, kimg: "assets/img/mujeres.jpeg", ktitle: "Mujeres")),
        ]),
        Row(children: [
          Expanded(
              child:
                  CardButton(id: 2, kimg: "assets/img/jrf.jpg", ktitle: "JRF")),
          Expanded(
              child: CardButton(
                  id: 3,
                  kimg: "assets/img/prejuveniles.jpg",
                  ktitle: "Pre Juveniles")),
        ]),
        CardButton(
            id: 4, kimg: "assets/img/child.jpeg", ktitle: "Ovejitas de Jesús")
      ],
    ),
  );
}
