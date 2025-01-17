import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platy/features/bloc/platy_bloc_bloc.dart';
import 'package:platy/features/calculation/custom_list_tile_with_radio.dart';
import 'package:platy/features/calculation/custom_list_tile.dart';
import 'package:platy/features/mainPage/profile/profileHealth/theme.dart';

class ProfileDigestiveWidget extends StatefulWidget {
  const ProfileDigestiveWidget({Key? key}) : super(key: key);

  @override
  _ProfileDigestiveWidgetState createState() => _ProfileDigestiveWidgetState();
}

class _ProfileDigestiveWidgetState extends State<ProfileDigestiveWidget> {
  List<String> titles = [
    'Acid reflux',
    'Gas',
    'Irregular bowel movements',
    'Diarrhea',
    'Bloating',
    'Indigestion',
    'Abdominal pain and cramps',
    'Flatulence',
    'Nausea',
  ];
  Map<String, dynamic> _selectedOptions = {};
  Map<String, dynamic> result = {};
  void isActive() {
    if (_selectedOptions.isNotEmpty) {
      _isButtonActive = true;
    } else {
      _isButtonActive = false;
    }
  }

  List<bool> _isCheckedList = [];
  List<String> choosedTitles = [];
  bool _isButtonActive = false;
  @override
  void initState() {
    super.initState();
    _isCheckedList = List.generate(titles.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 240, 242, 236),
        appBar: AppBar(
          toolbarHeight: 90,
          leading: Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: IconButton(
              icon: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_back),
                  SizedBox(width: 8),
                  Text(''),
                ],
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          leadingWidth: 90,
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 240, 242, 236),
          surfaceTintColor: Colors.transparent,
          title: Image.asset(
            'assets/images/logo_small.png',
            height: 32,
            width: 32,
          ),
        ),
        body: BlocListener<PlatyBloc, PlatyBlocState>(
          listener: (context, state) {
            if (state is ProfileIncludesDataState) {
              Navigator.of(context).pop();
            }
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Digestive Health',
                  textAlign: TextAlign.center,
                  style: whiteTheme.textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 14,
                ),
                Text(
                  'Add information from your last blood check-up',
                  textAlign: TextAlign.center,
                  style: whiteTheme.textTheme.bodySmall,
                ),
                const SizedBox(height: 30),
                Expanded(
                  child: ListView.builder(
                    itemCount: titles.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                        ),
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "   ${titles[index]}",
                                  style: const TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      _selectedOptions[titles[index]] = 'No';
                                      isActive();
                                    });
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Radio(
                                        value: 'No',
                                        activeColor: const Color.fromRGBO(
                                            164, 171, 155, 1),
                                        groupValue:
                                            _selectedOptions[titles[index]],
                                        onChanged: (value) {
                                          setState(() {
                                            _selectedOptions[titles[index]] =
                                                value.toString();
                                            isActive();
                                          });
                                        },
                                      ),
                                      const Text(
                                        'No',
                                        style: TextStyle(
                                          fontFamily: 'Gillroy',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      _selectedOptions[titles[index]] = 'Yes';
                                      isActive();
                                    });
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Radio(
                                        activeColor: const Color.fromRGBO(
                                            164, 171, 155, 1),
                                        value: 'Yes',
                                        groupValue:
                                            _selectedOptions[titles[index]],
                                        onChanged: (value) {
                                          setState(() {
                                            _selectedOptions[titles[index]] =
                                                value.toString();
                                            isActive();
                                          });
                                        },
                                      ),
                                      const Text(
                                        'Yes',
                                        style: TextStyle(
                                          fontFamily: 'Gillroy',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  height: 54.0,
                  width: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color.fromRGBO(164, 171, 155, 1),
                  ),
                  child: ElevatedButton(
                    onPressed: _isButtonActive
                        ? () {
                            result = {
                              "acid_reflux":
                                  _selectedOptions.containsKey("Acid reflux")
                                      ? _selectedOptions["Acid reflux"]
                                      : null,
                              "gas": _selectedOptions.containsKey("Gas")
                                  ? _selectedOptions["Gas"]
                                  : null,
                              "irregular_bowel_movements": _selectedOptions
                                      .containsKey("Irregular bowel movements")
                                  ? _selectedOptions[
                                      "Irregular bowel movements"]
                                  : null,
                              "diarrhoea":
                                  _selectedOptions.containsKey("Diarrhea")
                                      ? _selectedOptions["Diarrhea"]
                                      : null,
                              "bloating":
                                  _selectedOptions.containsKey("Bloating")
                                      ? _selectedOptions["Bloating"]
                                      : null,
                              "indigestion":
                                  _selectedOptions.containsKey("Indigestion")
                                      ? _selectedOptions["Indigestion"]
                                      : null,
                              "abdominal_pain_and_cramps": _selectedOptions
                                      .containsKey("Abdominal pain and cramps")
                                  ? _selectedOptions[
                                      "Abdominal pain and cramps"]
                                  : null,
                              "flatulence":
                                  _selectedOptions.containsKey("Flatulence")
                                      ? _selectedOptions["Flatulence"]
                                      : null,
                              "nausea": _selectedOptions.containsKey("Nausea")
                                  ? _selectedOptions["Nausea"]
                                  : null
                            };

                            BlocProvider.of<PlatyBloc>(context).add(
                                UpdateProfilePatchEvent(
                                    {'digestive_health': result}));
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0),
                      ),
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
