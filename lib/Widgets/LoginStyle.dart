import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const titulo = Padding(
  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
  child: Text(
    'Bienvenido a RocaFiel\nKramer',
    textAlign: TextAlign.center,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'Lato',
      fontSize: 30.0,
    ),
    textScaleFactor: 1,
  ),
);
const subtitulo = Text(
  'Ingresar',
  style: TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 30.0,
    fontFamily: 'Roboto',
  ),
  textScaleFactor: 1,
);
