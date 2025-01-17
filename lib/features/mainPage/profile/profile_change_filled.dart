import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platy/features/bloc/platy_bloc_bloc.dart';
import 'package:platy/features/calculation/theme.dart';
import 'package:platy/features/mainPage/profile/profileHealth/profile_alergic_list.dart';
import 'package:platy/features/mainPage/profile/profileHealth/profile_bones_check.dart';
import 'package:platy/features/mainPage/profile/profileHealth/profile_chronic_diseases.dart';
import 'package:platy/features/mainPage/profile/profileHealth/profile_cooking_chose.dart';
import 'package:platy/features/mainPage/profile/profileHealth/profile_cousin_choose.dart';
import 'package:platy/features/mainPage/profile/profileHealth/profile_current_diet.dart';
import 'package:platy/features/mainPage/profile/profileHealth/profile_current_goals.dart';
import 'package:platy/features/mainPage/profile/profileHealth/profile_degistive.dart';
import 'package:platy/features/mainPage/profile/profileHealth/profile_diversity_plan.dart';
import 'package:platy/features/mainPage/profile/profileHealth/profile_emotional.dart';
import 'package:platy/features/mainPage/profile/profileHealth/profile_food_preferences.dart';
import 'package:platy/features/mainPage/profile/profileHealth/profile_freq_sport.dart';
import 'package:platy/features/mainPage/profile/profileHealth/profile_health_status_habits.dart';
import 'package:platy/features/mainPage/profile/profileHealth/profile_height.dart';
import 'package:platy/features/mainPage/profile/profileHealth/profile_hormone.dart';
import 'package:platy/features/mainPage/profile/profileHealth/profile_local_products.dart';
import 'package:platy/features/mainPage/profile/profileHealth/profile_medicaments.dart';
import 'package:platy/features/mainPage/profile/profileHealth/profile_mental_health.dart';
import 'package:platy/features/mainPage/profile/profileHealth/profile_nutrition_add.dart';
import 'package:platy/features/mainPage/profile/profileHealth/profile_skin_beauty.dart';
import 'package:platy/features/mainPage/profile/profileHealth/profile_supplements.dart';
import 'package:platy/features/mainPage/profile/profileHealth/profile_weight.dart';

class ProfileChangeFilledPage extends StatefulWidget {
  const ProfileChangeFilledPage({super.key});

  @override
  State<ProfileChangeFilledPage> createState() =>
      _ProfileChangeFilledPageState();
}

class _ProfileChangeFilledPageState extends State<ProfileChangeFilledPage> {
  final List<String> elementsTitles = [
    'Height Status',
    'Weight Status',
    'Alegic list status',
    'Chronic Diseases status',
    'Frequency of Sport status',
    'Mental Health status',
    'Skin & Beauty status',
    'Food Preferences status',
    'Current Diet status',
    'Cooking status',
    'Nutrition status',
    'Hormone panel status',
    'Bone Health status',
    'Digestive Health',
    'Emotional wellbeing',
    'Current Goals',
    'Habits status',
    'Supplements status',
    'Medicaments status',
    'Cousin List status',
    'Local Products status',
    'Diversity Plan status',
  ];

  final List<Widget> elemWidget = [
    const ProfileHeightWidget(),
    const ProfileWeightWidget(),
    const ProfileAlergicListWidget(),
    const ProfileChronicDiseasesListWidget(),
    const ProfileFreqSportWidget(),
    const ProfileMentalHealthWidget(),
    const ProfileSkinAndBeautyWidget(),
    const ProfileFoodPreferencesWidget(),
    const ProfileCurrentDietWidget(),
    const ProfileCookingChoseWidget(),
    const ProfileNutritionAddWidget(),
    const ProfileHormoneWidget(),
    const ProfileBonesCheckUpWidget(),
    const ProfileDigestiveWidget(),
    const ProfileEmotionalWellbeingWidget(),
    const ProfileCurrentGoalsWidget(),
    const ProfileHealthStatusHabitsWidget(),
    const ProfileSupplementsListWidget(),
    const ProfileMedicamentsWidget(),
    const ProfileCousinListWidget(),
    const ProfileLocalProductsWidget(),
    const ProfileDiversityPlanWidget(),
  ];
  Map<String, dynamic> jsonData = {};
  List<dynamic> subtitleList = List.generate(22, (index) => null);

  String makeSubTitleBones(Map<String, dynamic> value) {
    Map<String, String> correctMap = {
      'vitamin_d': 'Vitamin D',
      'calcium': 'Calcium',
      'phosphorus': 'Phosphorus',
      'alkaline_phosphatase': 'Alkaline phosphatase'
    };

    List<String> results = [];

    value.forEach((key, value) {
      String? correctKey = correctMap[key];
      if (correctKey != null && value.isNotEmpty) {
        results.add('$correctKey ($value)');
      }
    });

    return results.join(', ');
  }

  String makeSubTitleDigestive(Map<String, dynamic> value) {
    Map<String, String> correctMap = {
      "acid_reflux": "Acid reflux",
      "gas": "Gas",
      "irregular_bowel_movements": "Irregular bowel movements",
      "diarrhoea": "Diarrhea",
      "bloating": "Bloating",
      "indigestion": "Indigestion",
      "abdominal_pain_and_cramps": "Abdominal pain and cramps",
      "flatulence": "Flatulence",
      "nausea": "Nausea"
    };

    List<String> results = [];

    value.forEach((key, value) {
      String? correctKey = correctMap[key];
      if (correctKey != null && value.isNotEmpty) {
        results.add('$correctKey ($value)');
      }
    });
    print(results);
    return results.join(', ');
  }

  String makeSubTitle(dynamic value) {
    if (value == null) {
      return 'Nothing yet...';
    } else if (value is String) {
      return value;
    } else if (value is Map) {
      if (value.isEmpty) {
        return 'Nothing yet...';
      } else {
        return value.entries
            .map((entry) =>
                '${entry.key[0].toUpperCase() + entry.key.substring(1)} (${entry.value})')
            .join(', ');
      }
    } else if (value is int) {
      return value.toString();
    } else if (value is List) {
      if (value.isEmpty) {
        return 'Nothing yet...';
      } else {
        return value.map((value) => '$value').join(', ');
      }
    } else {
      return 'Nothing yet...';
    }
  }

  @override
  void initState() {
    BlocProvider.of<PlatyBloc>(context).add(ProfileDataEvent({}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 242, 236),
      appBar: AppBar(
        toolbarHeight: 90,
        centerTitle: true,
        title: Image.asset(
          'assets/images/logo_small.png',
          width: 32,
          height: 32,
        ),
        leading: GestureDetector(
          onTap: () async {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 240, 242, 236),
        elevation: 0.0,
        scrolledUnderElevation: 0,
      ),
      body: BlocListener<PlatyBloc, PlatyBlocState>(
        listener: (context, state) {
          if (state is ProfileIncludesDataState) {
            setState(() {
              jsonData.addAll(state.profilePageData);
              subtitleList = [
                jsonData['height'],
                jsonData['weight'],
                jsonData['alergies'],
                jsonData['chronic_diseases'],
                jsonData['activities_frequency'],
                jsonData['mental_health_goals'],
                jsonData['beauty_goals'],
                jsonData['tpds'] != null
                    ? "${jsonData['tpd_count']} (${jsonData['tpds'].first})"
                    : "${jsonData['tpd_count']}",
                jsonData['current_diet'],
                jsonData['cooking_preferences'],
                jsonData['sport_nutritions'],
                jsonData['blood_check_up'],
                jsonData['bone_check_up'] != null
                    ? makeSubTitleBones(jsonData['bone_check_up'])
                    : 'Nothing yet...',
                jsonData['digestive_health'] != null
                    ? makeSubTitleDigestive(jsonData['digestive_health'])
                    : 'Nothing yet...',
                jsonData['emotional_wellbeing'],
                jsonData['current_goals'],
                jsonData['habits'],
                jsonData['supplements'],
                jsonData['medicaments'],
                jsonData['delivery_cuisine'],
                "${jsonData['region']}\n${jsonData['season']}",
                jsonData['diversity'],
              ];
            });
            print('JSON profile data: ${jsonData}');
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                top: 10.0, left: 10.0, right: 10.0, bottom: 10.0),
            child: Column(
              children: [
                Text(
                  'Change filled data',
                  textAlign: TextAlign.center,
                  style: whiteTheme.textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 15,
                ),
                Column(
                  children: generateListWidgets(elementsTitles),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Container(
          height: 52.0,
          width: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Color.fromRGBO(164, 171, 155, 1),
          ),
          child: FloatingActionButton(
            heroTag: "MyFirstPage",
            splashColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            elevation: 0,
            onPressed: () {
              Navigator.of(context).pop();
            },
            shape: RoundedRectangleBorder(
                side: const BorderSide(width: 0, color: Colors.transparent),
                borderRadius: BorderRadius.circular(50)),
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> generateListWidgets(List<String> elements) {
    return List.generate(elements.length, (index) {
      return Padding(
        padding: const EdgeInsets.only(left: 6.0, right: 6.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 3),
              width: MediaQuery.of(context).size.width * 1,
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 16.0,
                  right: 16.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${index + 1}. ',
                          style: const TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          elements[index],
                          style: const TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            makeSubTitle(subtitleList[index]),
                            softWrap: true,
                            maxLines: 2,
                            style: const TextStyle(
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.black45,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => elemWidget[index],
                                ),
                              );
                            },
                            child: const Text(
                              'Edit',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                fontFamily: 'Montserrat',
                                color: Color.fromRGBO(255, 163, 132, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8.0),
          ],
        ),
      );
    });
  }
}
