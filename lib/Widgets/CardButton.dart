import 'package:flutter/material.dart';
import 'package:rfk/Views/GroupPage.dart';
import 'package:rfk/models/groupModel.dart';

class CardButton extends StatelessWidget {
  CardButton({required this.id, required this.ktitle, required this.kimg});
  String ktitle;
  String kimg;
  int id;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GroupPage(
                groups: GroupModel(id, kimg, ktitle),
              ),
            ),
          );
          // Navigator.pushNamed(context, '/groups',
          //     arguments: GroupModel(id, kimg, ktitle));
        },
        child: Ink(
          height: 130,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage(kimg),
                  backgroundColor: Colors.white,
                  radius: 35,
                ),
              ),
              Text(
                ktitle,
                style: const TextStyle(fontWeight: FontWeight.w600),
              )
            ],
          ),
          // margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    offset: Offset.fromDirection(0.5),
                    blurRadius: 1)
              ]),
        ),
      ),
    );
  }
}
