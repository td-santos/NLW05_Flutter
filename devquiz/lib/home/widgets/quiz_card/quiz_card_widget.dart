import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/widgets/progress_indicator/progress_indicator.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
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
            child: Image.asset(AppImages.blocks),
          ),
          SizedBox(height: 20,),
          Text('Gerenciamento de estado',
            style: AppTextStyles.heading15,
          ),
          SizedBox(height: 20,),
          Expanded(
            child: Row(
              children: [
                Expanded(                    
                    child: Text('3 de 10',
                      style: AppTextStyles.body11,
                    )),
                Expanded(
                  flex: 2,
                  child: ProgressIndicatorWidget(value: 0.3,),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
