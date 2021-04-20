import 'package:devquiz/challenge/widgets/awnser/awnser_widget.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {

  final String title;

  const QuizWidget({Key key, @required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: AppTextStyles.heading,),
        SizedBox(height: 24,),
        AwnserWidget(
          isRight: false,
          isSelected: true,
          title: "Possibilita a criação de aplicativos compilados nativamente"),
        AwnserWidget(
          isRight: true,
          isSelected: true,
          title: "Possibilita a criação de aplicativos compilados nativamente"),
        AwnserWidget(
          title: "Possibilita a criação de aplicativos compilados nativamente"),
        AwnserWidget(
          title: "Possibilita a criação de aplicativos compilados nativamente"),


      ],
    );
  }
}