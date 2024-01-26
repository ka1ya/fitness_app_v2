import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';

class CalculateHealthStatusFirstWidget extends StatefulWidget {
  const CalculateHealthStatusFirstWidget({super.key});

  @override
  State<CalculateHealthStatusFirstWidget> createState() =>
      _CalculateHealthStatusFirstWidgetState();
}

class _CalculateHealthStatusFirstWidgetState
    extends State<CalculateHealthStatusFirstWidget> {
  bool buttonCholesterol1Selected = false; //Cholesterol
  bool buttonCholesterol2Selected = true;
  bool buttonCholesterol3Selected = false;

  bool buttonBlood1Selected = true; //Blood
  bool buttonBlood2Selected = false;
  bool buttonBlood3Selected = false;

  bool buttonHemoglobin1Selected = true; //Hemoglobin
  bool buttonHemoglobin2Selected = false;

  bool buttonTriglycerides1Selected = false; //Triglycerides
  bool buttonTriglycerides2Selected = true;
  bool buttonTriglycerides3Selected = false;

  bool buttonIron1Selected = false; //Iron
  bool buttonIron2Selected = true;
  bool buttonIron3Selected = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 73),
          const Center(
            child: Column(
              children: [
                Text(
                  'Health status',
                  style: TextStyle(
                    fontSize: 28,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Add information from your last vitamin check-up',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Cholesterol Levels',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                width: 0.29,
                label: ' Low',
                isSelected: buttonCholesterol1Selected,
                onPressed: () {
                  setState(() {
                    buttonCholesterol1Selected = true;
                    buttonCholesterol2Selected = false;
                    buttonCholesterol3Selected = false;
                  });
                },
              ),
              CustomButton(
                width: 0.29,
                label: 'Normal',
                isSelected: buttonCholesterol2Selected,
                onPressed: () {
                  setState(() {
                    buttonCholesterol1Selected = false;
                    buttonCholesterol2Selected = true;
                    buttonCholesterol3Selected = false;
                  });
                },
              ),
              CustomButton(
                width: 0.29,
                label: 'High',
                isSelected: buttonCholesterol3Selected,
                onPressed: () {
                  setState(() {
                    buttonCholesterol1Selected = false;
                    buttonCholesterol2Selected = false;
                    buttonCholesterol3Selected = true;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Blood Glucose Levels',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                width: 0.29,
                label: 'Normal',
                isSelected: buttonBlood1Selected,
                onPressed: () {
                  setState(() {
                    buttonBlood1Selected = true;
                    buttonBlood2Selected = false;
                    buttonBlood3Selected = false;
                  });
                },
              ),
              CustomButton(
                width: 0.29,
                label: 'Pre-Diabetic',
                isSelected: buttonBlood2Selected,
                onPressed: () {
                  setState(() {
                    buttonBlood1Selected = false;
                    buttonBlood2Selected = true;
                    buttonBlood3Selected = false;
                  });
                },
              ),
              CustomButton(
                width: 0.29,
                label: 'Diabetic',
                isSelected: buttonBlood3Selected,
                onPressed: () {
                  setState(() {
                    buttonBlood1Selected = false;
                    buttonBlood2Selected = false;
                    buttonBlood3Selected = true;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Hemoglobin A1c',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                width: 0.44,
                label: 'Normal',
                isSelected: buttonHemoglobin1Selected,
                onPressed: () {
                  setState(() {
                    buttonHemoglobin1Selected = true;
                    buttonHemoglobin2Selected = false;
                  });
                },
              ),
              CustomButton(
                width: 0.44,
                label: 'High',
                isSelected: buttonHemoglobin2Selected,
                onPressed: () {
                  setState(() {
                    buttonHemoglobin1Selected = false;
                    buttonHemoglobin2Selected = true;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Triglycerides',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                width: 0.29,
                label: ' Low',
                isSelected: buttonTriglycerides1Selected,
                onPressed: () {
                  setState(() {
                    buttonTriglycerides1Selected = true;
                    buttonTriglycerides2Selected = false;
                    buttonTriglycerides3Selected = false;
                  });
                },
              ),
              CustomButton(
                width: 0.29,
                label: 'Normal',
                isSelected: buttonTriglycerides2Selected,
                onPressed: () {
                  setState(() {
                    buttonTriglycerides1Selected = false;
                    buttonTriglycerides2Selected = true;
                    buttonTriglycerides3Selected = false;
                  });
                },
              ),
              CustomButton(
                width: 0.29,
                label: 'High',
                isSelected: buttonTriglycerides3Selected,
                onPressed: () {
                  setState(() {
                    buttonTriglycerides1Selected = false;
                    buttonTriglycerides2Selected = false;
                    buttonTriglycerides3Selected = true;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Iron Levels',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                width: 0.29,
                label: ' Low',
                isSelected: buttonIron1Selected,
                onPressed: () {
                  setState(() {
                    buttonIron1Selected = true;
                    buttonIron2Selected = false;
                    buttonIron3Selected = false;
                  });
                },
              ),
              CustomButton(
                width: 0.29,
                label: 'Normal',
                isSelected: buttonIron2Selected,
                onPressed: () {
                  setState(() {
                    buttonIron1Selected = false;
                    buttonIron2Selected = true;
                    buttonIron3Selected = false;
                  });
                },
              ),
              CustomButton(
                width: 0.29,
                label: 'High',
                isSelected: buttonIron3Selected,
                onPressed: () {
                  setState(() {
                    buttonIron1Selected = false;
                    buttonIron2Selected = false;
                    buttonIron3Selected = true;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 80),
          Container(
            height: 54.0,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF59A7A7),
                  Color(0xFFAFCD6D),
                ],
              ),
            ),
            child: ElevatedButton(
              onPressed: () {
                CalculateGlobalWidget.of(context).pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.0),
                ),
              ),
              child: const Text(
                'Next',
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
    );
  }
}

class CustomButton extends StatelessWidget {
  final double width;
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;

  const CustomButton({
    required this.width,
    required this.label,
    required this.isSelected,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 52,
        width: MediaQuery.of(context).size.width * width,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color:
              isSelected ? const Color.fromRGBO(252, 108, 76, 1) : Colors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.09),
              offset: Offset(1, 3),
              blurRadius: 9,
            ),
          ],
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}