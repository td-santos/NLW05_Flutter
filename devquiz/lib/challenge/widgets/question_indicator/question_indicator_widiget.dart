import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/widgets/progress_indicator/progress_indicator.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(height: 16,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Questão 04',style: AppTextStyles.body,),
              Text('de 10',style: AppTextStyles.body,)
            ],
          ),
          SizedBox(height: 16,),
          ProgressIndicatorWidget(value: 0.7,)
        ],
      ),
    );
  }
}