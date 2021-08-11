import 'package:agenda_de_contatos/style.dart';
import 'package:agenda_de_contatos/views/home/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
    theme: ThemeData(
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: redTheme
      ),
      dividerTheme: DividerThemeData(
        color: grayDivider,
        thickness: 1
      ),
      primarySwatch: blueThemes,
      iconTheme: IconThemeData(
        color: blueThemes
      ),
    ),
  ));
}
