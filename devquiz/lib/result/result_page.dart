import 'package:devquiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:devquiz/core/core.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int length;
  final int result;

  const ResultPage({Key key,@required this.title,@required this.length,@required this.result}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: 100),
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(AppImages.trophy_star),
          Column(
            children: [
              Text(
                'Parabéns!',
                style: AppTextStyles.heading40,
              ),
              SizedBox(height: 16),
              Text.rich(
                TextSpan(
                  text: 'Você concluiu',
                  style: AppTextStyles.body,
                  children: [
                    TextSpan(
                        text: '\n$title',
                        style: AppTextStyles.bodyBold),
                    TextSpan(
                        text: '\ncom $result de $length acertos',
                        style: AppTextStyles.body),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 68),
                      child: NextButtonWidget.purple(
                        label: 'Compartilhar',
                        ontap: () {
                          Share.share('Dev_Quiz NLW 5 - Flutter: Resultado do Quiz: $title\nObtive : ${result/length}% de aproveitamento');
                        },
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 68),
                      child: NextButtonWidget.transparent(
                        label: 'Voltar ao início',
                        ontap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    ));
  }
}
