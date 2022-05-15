import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rfk/Widgets/ButtonLink.dart';
import 'package:rfk/Widgets/video_item.dart';
import 'package:rfk/services/services.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_html/flutter_html.dart';
import '../Widgets/videoYouTube.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class NewsPage extends StatefulWidget {
  NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final List<dynamic> data = [
    {
      "id": "1",
      "img": "assets/img/img4.jpg",
      "title": "Reunión de Varones",
      "description":
          "Sábado 20 de noviembre, reunión de varones Rocafiel Kramer.",
    },
    {
      "id": "2",
      "img": "assets/img/img2.jpg",
      "title": "Noticia 2",
      "description": "Description news to cards.",
    },
    {
      "id": "2",
      "img": "assets/img/img5.jpg",
      "title": "Reunión de Mujeres",
      "description":
          "Sábado 27 de noviembre, reunión de varones Rocafiel Kramer.",
    },
  ];
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewSevice>(context);
    if (newsService.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    return Scrollbar(
      isAlwaysShown: true,
      thickness: 8,
      radius: const Radius.circular(10),
      child: ListView.builder(
        itemCount: newsService.newsList.length,
        itemBuilder: (context, int index) {
          return Padding(
            padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
            child: Card(
              elevation: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  (newsService.newsList[index].imageUrl != "")
                      ? SizedBox(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: FadeInImage(
                            placeholder:
                                const AssetImage('assets/img/no-image.jpg'),
                            image: NetworkImage(
                                "https://drive.google.com/uc?export=view&id=${newsService.newsList[index].imageUrl}"),
                            fit: BoxFit.cover,
                          ),
                        )
                      : SizedBox(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.25,
                          // child: VideoItem(
                          //     videoPlayerController: VideoPlayerController.asset(
                          //         "assets/video/test.mp4")),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(6),
                                topRight: Radius.circular(6)),
                            child: YoutubeAppDemo(
                                idUrlYoutube:
                                    newsService.newsList[index].urlVideo!),
                          )),

                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 5),
                    child: Text(
                      newsService.newsList[index].title,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8, bottom: 15, left: 15, right: 15),
                    child: Text(newsService.newsList[index].description,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w300)),
                  ),
                  // newsService.newsList[index].urlVideo != ""
                  //     ? ButtonLink(
                  //         url: newsService.newsList[index].urlVideo!,
                  //         textButton: "Ver Video",
                  //         colorText: Colors.red,
                  //         icons: FontAwesomeIcons.youtube,
                  //         colorIcon: Colors.red)
                  //     : Container()
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
