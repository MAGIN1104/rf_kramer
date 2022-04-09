import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ButtonLink extends StatelessWidget {
  const ButtonLink(
      {Key? key,
      required this.url,
      required this.icons,
      required this.colorIcon,
      required this.colorText,
      required this.textButton})
      : super(key: key);

  final String url;
  final IconData icons;
  final Color colorIcon;
  final Color colorText;
  final String textButton;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: OutlinedButton(
        onPressed: () async {
          if (!await launch(url)) throw "Could not launch $url";
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icons,
              color: colorIcon,
            ),
            Text(
              textButton,
              style: TextStyle(
                color: colorText,
              ),
            )
          ],
        ),
      ),
    );
  }
}
