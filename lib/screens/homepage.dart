import 'package:flutter/material.dart';
import 'package:toyproject_calculator/widgets/btn_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool start = true;

  Color numBtn = const Color.fromRGBO(66, 66, 66, 1);
  Color operBtn = const Color.fromRGBO(255, 167, 38, 1);
  Color etcBtn = Colors.grey;

  num userNum = 0;
  num backNum = 0;
  late String showNum;
  String keepOper = "";

  void onTouchNum(String n) {
    if (showNum == "0") {
      showNum = n;
    } else {
      showNum += n;
    }
    userNum = num.parse(showNum);
    start = false;
    setState(() {});
  }

  void onTouchOperator(String oper) {
    if (oper != "=") {
      if (backNum == 0) {
        backNum = userNum;
      }
      userNum = 0;
      showNum = userNum.toString();
      keepOper = oper;
    } else {
      if (keepOper == "+") {
        backNum = backNum + userNum;
      } else if (keepOper == "-") {
        backNum = backNum - userNum;
      } else if (keepOper == "÷") {
        backNum = backNum / userNum;
      } else if (keepOper == "×") {
        backNum = backNum * userNum;
      }
      showNum = backNum.toString();
      try {
        if (showNum.substring(showNum.length - 2) == ".0") {
          showNum = showNum.substring(0, showNum.indexOf('.'));
          backNum = num.parse(showNum);
        }
        start = false;
      } catch (e) {
        start = false;
      }
    }
    setState(() {});
  }

  void onTouchEtc(String etc) {
    if (etc != ".") {
      if (etc == "C") {
        userNum = 0;
        backNum = 0;
        start = true;
        keepOper = "";
      } else if (etc == "±") {
        userNum *= -1;
      } else if (etc == "%") {
        if (userNum != 0) {
          userNum /= 100;
        }
      }
      showNum = userNum.toString();
    } else {
      if (showNum.contains(".")) {
      } else {
        showNum += ".";
        start = false;
      }
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    showNum = userNum.toString();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.025,
          vertical: height * 0.025,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Expanded(
              child: SizedBox(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.065,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                reverse: true,
                child: Row(
                  // 숫자표시 부분
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      showNum,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: height * 0.1,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              // 숫자패드
              width: width,
              height: height * 0.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    // 1번줄
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      BtnWidget(
                        onTap: () => onTouchEtc("C"),
                        width: width,
                        btnColor: etcBtn,
                        text: start ? "AC" : "C",
                        textColor: Colors.black,
                      ),
                      BtnWidget(
                        onTap: () => onTouchEtc("±"),
                        width: width,
                        btnColor: etcBtn,
                        text: "±",
                        textColor: Colors.black,
                      ),
                      BtnWidget(
                        onTap: () => onTouchEtc("%"),
                        width: width,
                        btnColor: etcBtn,
                        text: "%",
                        textColor: Colors.black,
                      ),
                      BtnWidget(
                        onTap: () => onTouchOperator("÷"),
                        width: width,
                        btnColor: operBtn,
                        text: "÷",
                        textColor: Colors.white,
                      ),
                    ],
                  ),
                  Row(
                    // 2번줄
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      BtnWidget(
                        onTap: () => onTouchNum("7"),
                        width: width,
                        btnColor: numBtn,
                        text: "7",
                        textColor: Colors.white,
                      ),
                      BtnWidget(
                        onTap: () => onTouchNum("8"),
                        width: width,
                        btnColor: numBtn,
                        text: "8",
                        textColor: Colors.white,
                      ),
                      BtnWidget(
                        onTap: () => onTouchNum("9"),
                        width: width,
                        btnColor: numBtn,
                        text: "9",
                        textColor: Colors.white,
                      ),
                      BtnWidget(
                        onTap: () => onTouchOperator("×"),
                        width: width,
                        btnColor: operBtn,
                        text: "×",
                        textColor: Colors.white,
                      ),
                    ],
                  ),
                  Row(
                    // 3번줄
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      BtnWidget(
                        onTap: () => onTouchNum("4"),
                        width: width,
                        btnColor: numBtn,
                        text: "4",
                        textColor: Colors.white,
                      ),
                      BtnWidget(
                        onTap: () => onTouchNum("5"),
                        width: width,
                        btnColor: numBtn,
                        text: "5",
                        textColor: Colors.white,
                      ),
                      BtnWidget(
                        onTap: () => onTouchNum("6"),
                        width: width,
                        btnColor: numBtn,
                        text: "6",
                        textColor: Colors.white,
                      ),
                      BtnWidget(
                        onTap: () => onTouchOperator("-"),
                        width: width,
                        btnColor: operBtn,
                        text: "−",
                        textColor: Colors.white,
                      ),
                    ],
                  ),
                  Row(
                    // 4번줄
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      BtnWidget(
                        onTap: () => onTouchNum("1"),
                        width: width,
                        btnColor: numBtn,
                        text: "1",
                        textColor: Colors.white,
                      ),
                      BtnWidget(
                        onTap: () => onTouchNum("2"),
                        width: width,
                        btnColor: numBtn,
                        text: "2",
                        textColor: Colors.white,
                      ),
                      BtnWidget(
                        onTap: () => onTouchNum("3"),
                        width: width,
                        btnColor: numBtn,
                        text: "3",
                        textColor: Colors.white,
                      ),
                      BtnWidget(
                        onTap: () => onTouchOperator("+"),
                        width: width,
                        btnColor: operBtn,
                        text: "+",
                        textColor: Colors.white,
                      ),
                    ],
                  ),
                  Row(
                    // 5번줄
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      BtnWidgetForZero(
                        onTap: () => onTouchNum("0"),
                        width: width,
                        btnColor: numBtn,
                        text: "0",
                        textColor: Colors.white,
                      ),
                      BtnWidget(
                        onTap: () => onTouchEtc("."),
                        width: width,
                        btnColor: numBtn,
                        text: ".",
                        textColor: Colors.white,
                      ),
                      BtnWidget(
                        onTap: () => onTouchOperator("="),
                        width: width,
                        btnColor: operBtn,
                        text: "=",
                        textColor: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
