import 'package:devquiz/challenge/challenge_controller.dart';
import 'package:devquiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:devquiz/challenge/widgets/question_indicator/question_indicator_widiget.dart';
import 'package:devquiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;

  const ChallengePage({Key key, this.questions}) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final challengerController = ChallengeController();
  final pageController = PageController();

  void nextPage() {
    if(challengerController.currentPage <widget.questions.length){
      pageController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.linear);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // challengerController.currentPageNotifier.addListener(() {
    //   setState(() {});
    //  });
    pageController.addListener(() {
      challengerController.currentPage = pageController.page.toInt() + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(102),
        child: SafeArea(
            top: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  padding: EdgeInsets.all(0),
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                ValueListenableBuilder<int>(
                    valueListenable: challengerController.currentPageNotifier,
                    builder: (context, value, _) {
                      return QuestionIndicatorWidget(
                        currentPage: value, //challengerController.currentPage,
                        length: widget.questions.length,
                      );
                    }),
              ],
            )),
      ),
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: widget.questions
            .map(
              (e) => QuizWidget(
                question: e,
                onchange: nextPage,
              ),
            )
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ValueListenableBuilder<int>(
              valueListenable: challengerController.currentPageNotifier,
              builder: (context, value, _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if (value < widget.questions.length)
                      Expanded(
                        child: NextButtonWidget.white(
                          label: "Pular",
                          ontap: () {
                            nextPage();
                          },
                        ),
                      ),
                    if (value == widget.questions.length)
                      Expanded(
                        child: NextButtonWidget.green(
                          label: "Confirmar",
                          ontap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
