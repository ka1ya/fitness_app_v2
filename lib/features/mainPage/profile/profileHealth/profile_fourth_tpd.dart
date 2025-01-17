import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platy/features/bloc/platy_bloc_bloc.dart';
import 'package:platy/features/calculation/custom_list_tile_with_radio.dart';
import 'package:platy/features/mainPage/profile/profileHealth/custom_list_tile.dart';
import 'package:platy/features/mainPage/profile/profileHealth/theme.dart';

class ProfileFourthTPDWidget extends StatefulWidget {
  const ProfileFourthTPDWidget({Key? key}) : super(key: key);

  @override
  _ProfileFourthTPDWidgetState createState() => _ProfileFourthTPDWidgetState();
}

class _ProfileFourthTPDWidgetState extends State<ProfileFourthTPDWidget> {
  List<String> titles = [
    'Having a Snack',
    'Brunch and Dinner included',
  ];
  int? _selectedIndex;
  bool _isButtonActive = false;
  Map<String, dynamic> updateProfileData = {};
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
              for (int i = 0; i < 2; i++) {
                Navigator.of(context).pop();
              }
            }
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '4 TPD',
                  textAlign: TextAlign.center,
                  style: whiteTheme.textTheme.bodyMedium,
                ),
                const Text(
                  'What is your eating type?',
                  style: TextStyle(
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: titles.length,
                    itemBuilder: (context, index) {
                      return /* CustomListTile(
                        title: titles[index],
                        isChecked: _selectedIndex == index,
                        onTilePressed: (isChecked) {
                          setState(() {
                            _selectedIndex = isChecked ? index : null;
                            _isButtonActive = true;
                            updateProfileData['tpds'] = titles[index];
                          });
                        },
                      ); */

                          CustomListTileWithRadio(
                              title: titles[index],
                              isChecked: _selectedIndex == index,
                              customStyle: const TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                              onTilePressed: (isChecked) {
                                setState(() {
                                  _selectedIndex = isChecked ? index : null;
                                  _isButtonActive = true;
                                  updateProfileData['tpds'] = [titles[index]];
                                });
                              });
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
                            BlocProvider.of<PlatyBloc>(context).add(
                                UpdateProfilePatchEvent(updateProfileData));
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
