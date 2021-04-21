import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/widgets/progress_indicator/progress_indicator.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {

  final String title;
  final  String completed;
  final double percent;
  final String imagem;

  const QuizCardWidget({
    Key key, 
    @required this.title, 
    @required this.completed, 
    this.percent, 
    @required this.imagem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 40,
            child: Image.asset(imagem),
          ),
          SizedBox(height: 20,),
          Text(title,
            style: AppTextStyles.heading15,
          ),
          SizedBox(height: 20,),
          Expanded(
            child: Row(
              children: [
                Expanded(                    
                    child: Text(completed,
                      style: AppTextStyles.body11,
                    )),
                Expanded(
                  flex: 2,
                  child: ProgressIndicatorWidget(value: percent,),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
