import 'package:flutter/material.dart';
import 'package:rfk/Widgets/CardButton.dart';
import 'package:rfk/services/home_service.dart';
import '../models/homeModel.dart';
import 'package:skeletons/skeletons.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final imageService = HomeService();
  @override
  Widget build(BuildContext context) {
    // final imageService = Provider.of<HomeService>(context);
    // return _buttonCards(context, imageService.images);
    return FutureBuilder(
      future: imageService.loadImages(),
      builder: (context, AsyncSnapshot<List<ImageHome>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(
              child: Image(image: AssetImage('assets/img/spinner.gif')),
            );
          default:
            if (snapshot.hasError) {
              return _buttonCards(
                  context, [ImageHome(img: 'assets/img/404.jpg')]);
            } else {
              final dataResp = snapshot.data;
              final List<ImageHome> images = [];
              dataResp?.forEach(
                (element) {
                  images.add(element);
                },
              );
              return _buttonCards(context, images);
            }
        }
        // if (snapshot.hasData) {
        //   final dataResp = snapshot.data;
        //   final List<ImageHome> images = [];
        //   dataResp?.forEach(
        //     (element) {
        //       images.add(element);
        //     },
        //   );
        //   return _buttonCards(context, images);
        // } else {
        //   return const Center(
        //     child: Image(image: AssetImage('assets/img/spinner.gif')),
        //   );
        // }
      },
    );
  }
}

Widget _carrousel(List<ImageHome> images) {
  return Swiper(
    itemWidth: 300,
    itemHeight: 200,
    itemCount: images.length,
    layout: SwiperLayout.STACK,
    itemBuilder: (_, int index) {
      final image = images[index];
      return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: FadeInImage(
          placeholder: const AssetImage('assets/img/no-image.jpg'),
          image: NetworkImage(
              "https://drive.google.com/uc?export=view&id=${image.img}"),
          fit: BoxFit.cover,
        ),
      );
    },
  );
}

Widget _buttonCards(BuildContext context, List<ImageHome> images) {
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
          child: images.isEmpty
              ? SvgPicture.asset(
                  'assets/svg/404.svg',
                  matchTextDirection: true,
                )
              : _carrousel(images),
        ),
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

Widget skeleton(BuildContext context) {
  return ListView.builder(
    physics: const NeverScrollableScrollPhysics(),
    itemCount: 3,
    itemBuilder: (context, index) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: const BoxDecoration(color: Colors.white),
        child: SkeletonItem(
            child: SkeletonAvatar(
          style: SkeletonAvatarStyle(
            width: double.infinity,
            minHeight: MediaQuery.of(context).size.height / 8,
            maxHeight: MediaQuery.of(context).size.height / 3,
          ),
        )),
      ),
    ),
  );
}
