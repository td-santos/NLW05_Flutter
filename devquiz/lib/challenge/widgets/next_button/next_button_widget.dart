import 'package:devquiz/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButtonWidget extends StatelessWidget {

  final String label;
  final Color backgroundColor;
  final Color fontColor;
  final Color borderColor;
  final VoidCallback ontap;
  Color overlayColor;

  NextButtonWidget({
    Key key, 
    @required this.label, 
    @required this.backgroundColor,
    @required this.fontColor, 
    @required this.borderColor,
    @required this.ontap}) : super(key: key);

  NextButtonWidget.green({@required String label, @required VoidCallback ontap})
  : this.backgroundColor = AppColors.darkGreen, 
    this.fontColor = AppColors.white, 
    this.label = label,
    this.ontap = ontap,
    this.borderColor = AppColors.darkGreen,
    this.overlayColor = Colors.greenAccent[700];

  NextButtonWidget.white({@required String label, @required VoidCallback ontap})
  : this.backgroundColor = AppColors.white, 
    this.fontColor = AppColors.grey, 
    this.label = label,
    this.ontap = ontap,
    this.borderColor = AppColors.border,
    this.overlayColor = AppColors.border;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      height: 48,      
      child: TextButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(overlayColor),
          side: MaterialStateProperty.all(BorderSide(color: AppColors.border)),
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))
        ),
        child: Text(label, style: GoogleFonts.notoSans(
          fontSize: 15,
          fontWeight: FontWeight.w600 ,
          color: fontColor
        )),
        onPressed: ontap,
      ),
    );
  }
}