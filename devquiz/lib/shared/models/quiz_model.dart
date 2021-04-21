import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:devquiz/shared/models/question_model.dart';

enum Level{
  facil,medio,dificil,perito
}

extension LeveLStringEx on String{
  Level get levelParse=> { 
    "facil": Level.facil,
    "medio": Level.medio,
    "dificil": Level.dificil,
    "perito": Level.perito
    }[this];
}

extension LeveLEx on Level{
  String get levelParse=> { 
    Level.facil: "facil",
    Level.medio: "medio",
    Level.dificil: "dificil",
    Level.perito: "perito"
    }[this];
}

class QuizModel {
  final String title;
  final List<QuestionModel> questions;
  final int questionAwnsored;
  final String imagem;
  final Level level;

  QuizModel({
    @required this.title,
    @required this.questions,
    this.questionAwnsored = 0,
    @required this.imagem,
    @required this.level,
  });


  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questions': questions?.map((x) => x.toMap())?.toList(),
      'questionAwnsored': questionAwnsored,
      'imagem': imagem,
      'level': level.levelParse,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      title: map['title'],
      questions: List<QuestionModel>.from(map['questions']?.map((x) => QuestionModel.fromMap(x))),
      questionAwnsored: map['questionAwnsored'],
      imagem: map['imagem'],
      level: map['level'].toString().levelParse,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) => QuizModel.fromMap(json.decode(source));
}
