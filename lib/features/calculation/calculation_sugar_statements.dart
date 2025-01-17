import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/custom_list_tile_with_radio.dart';
import 'package:platy/features/calculation/theme.dart';

class CalculateSugarStatementsWidget extends StatefulWidget {
  const CalculateSugarStatementsWidget({Key? key}) : super(key: key);

  @override
  _CalculateSugarStatementsWidgetState createState() =>
      _CalculateSugarStatementsWidgetState();
}

class _CalculateSugarStatementsWidgetState
    extends State<CalculateSugarStatementsWidget> {
  List<String> titles = [
    "I rarely consume sugar",
    "I don't eat sweets but like processed food",
    'I would be happy to control my sugar intake but currently not doing it',
    'I like sweets and consume them every day',
    "When I'm upset sugar helps me to feel better",
  ];

  int? _selectedIndexState;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Statements about sugar',
            textAlign: TextAlign.center,
            style: whiteTheme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 30),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: titles.length,
            itemBuilder: (context, index) {
              return CustomListTileWithRadio(
                title: titles[index],
                isChecked: _selectedIndexState == index,
                customStyle: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w400,
                ),
                containerHeight: 100,
                onTilePressed: (isChecked) {
                  setState(() {
                    if (isChecked) {
                      _selectedIndexState = index;
                      CalculateGlobalWidget.of(context)
                          .userModelBuilder
                          .sugar_statements = titles[_selectedIndexState!];
                      CalculateGlobalWidget.of(context).setButtonActivity(true);
                    } else {
                      _selectedIndexState = null;
                      CalculateGlobalWidget.of(context)
                          .setButtonActivity(false);
                    }
                  });
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
