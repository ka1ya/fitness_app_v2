import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:platy/features/bloc/platy_bloc_bloc.dart';
import 'package:platy/features/calculation/repositories/models/update_user_model.dart';
import 'package:platy/features/mainPage/main_home_page.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'dart:math';

class MealGenerationPage extends StatefulWidget {
  const MealGenerationPage({Key? key, this.userModel}) : super(key: key);
  final userModel;
  @override
  State<MealGenerationPage> createState() => _MealGenerationPageState();
}

class _MealGenerationPageState extends State<MealGenerationPage> {
  // get userModel => userModel;
  bool errorLLM = false;
  bool goHome = false;
  String errorText = '';

  void initState() {
    super.initState();
    BlocProvider.of<PlatyBloc>(context).add(MealPlanDataEvent(const []));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlatyBloc, PlatyBlocState>(
      builder: (context, state) {
        if (state is MealPlanDataState) {
          goHome = true;
        }
        if (state is MealPlanErrorState) {
          errorLLM = true;
          errorText = state.errorMessage['Error'].toString();
        }
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 240, 242, 236),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Image.asset(
              'assets/images/logo_small.png',
              height: 32,
              width: 32,
            ),
            backgroundColor: const Color.fromARGB(255, 240, 242, 236),
          ),
          body: Center(
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset('assets/images/bg_generating.png', height: 300),
                    Positioned(
                      top: -20,
                      left: 0,
                      child: Image.asset('assets/images/food.png'),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Text(
                    'Just give me a moment',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 32, fontWeight: FontWeight.w600, height: 1.1),
                  ),
                ),
                const SizedBox(height: 14),
                const Text(
                  'I am generating a meal plan for you',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Column(
                    children: [
                      Visibility(
                        visible: (errorLLM == true) ? true : false,
                        child: Center(
                          child: Text(
                            errorText,
                            style: const TextStyle(
                              color: Colors.red,
                              fontFamily: 'Gilroy',
                              fontSize: 16,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w600,
                              height: 1,
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: (goHome == false && errorLLM == false)
                            ? true
                            : false,
                        child: const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Color.fromRGBO(255, 163, 132, 1),
                          ),
                          backgroundColor: Colors.transparent,
                          strokeWidth: 4,
                        ),
                      ),
                      Visibility(
                        visible: (goHome == true && errorLLM == false)
                            ? true
                            : false,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const MainHomePage(),
                              ),
                            );
                          },
                          child: Container(
                            constraints: const BoxConstraints(
                              maxHeight: 44,
                              maxWidth: 151,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.0),
                              // ignore: prefer_const_constructors
                              gradient: LinearGradient(
                                begin: const Alignment(0.0, -1.0),
                                end: const Alignment(1.0, 1.0),
                                colors: const [
                                  Color.fromRGBO(255, 163, 132, 1),
                                  Color.fromRGBO(255, 163, 132, 1),
                                ],
                                stops: const [0.0, 1.0],
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.white,
                                  blurRadius: 6,
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Text(
                                'Go see my plan',
                                style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontFamily: 'Gilroy',
                                  fontSize: 16,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w600,
                                  height: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 70.0, right: 70.0),
                  child: LinearPercentIndicator(
                    padding: EdgeInsets.zero,
                    animation: true,
                    lineHeight: 10.0,
                    animationDuration: 3000,
                    percent: 1,
                    barRadius: const Radius.circular(18),
                    backgroundColor: const Color.fromRGBO(230, 227, 223, 1),
                    linearGradient: const LinearGradient(colors: <Color>[
                      Color(0xFFffa384),
                      Color(0xFFffa384),
                      Color(0xFFffa384),
                      Color(0xFFa4aa9c),
                    ]),
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Breakfast',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 70.0, right: 70.0),
                  child: LinearPercentIndicator(
                    padding: EdgeInsets.zero,
                    animation: true,
                    lineHeight: 10.0,
                    animationDuration: 4000,
                    percent: 1,
                    barRadius: const Radius.circular(18),
                    backgroundColor: const Color.fromRGBO(230, 227, 223, 1),
                    linearGradient: const LinearGradient(colors: <Color>[
                      Color(0xFFffa384),
                      Color(0xFFffa384),
                      Color(0xFFffa384),
                      Color(0xFFa4aa9c),
                    ]),
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Lunch',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 70.0, right: 70.0),
                  child: LinearPercentIndicator(
                    padding: EdgeInsets.zero,
                    animation: true,
                    lineHeight: 10.0,
                    animationDuration: 10000,
                    percent: 1,
                    barRadius: const Radius.circular(18),
                    backgroundColor: const Color.fromRGBO(230, 227, 223, 1),
                    linearGradient: const LinearGradient(colors: <Color>[
                      Color(0xFFffa384),
                      Color(0xFFffa384),
                      Color(0xFFffa384),
                      Color(0xFFa4aa9c),
                    ]),
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Dinner',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 70.0, right: 70.0),
                  child: LinearPercentIndicator(
                    padding: EdgeInsets.zero,
                    animation: true,
                    lineHeight: 10.0,
                    animationDuration: 20000,
                    percent: 1,
                    barRadius: const Radius.circular(18),
                    backgroundColor: const Color.fromRGBO(230, 227, 223, 1),
                    linearGradient: const LinearGradient(colors: <Color>[
                      Color(0xFFffa384),
                      Color(0xFFffa384),
                      Color(0xFFffa384),
                      Color(0xFFa4aa9c),
                    ]),
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Snack',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}
