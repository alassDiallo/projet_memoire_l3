import 'package:flutter/material.dart';

class Etape extends StatefulWidget {
  @override
  _EtapeState createState() => _EtapeState();
}

class _EtapeState extends State<Etape> {
  int etape = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Stepper(
            type: StepperType.horizontal,
            currentStep: etape,
            onStepTapped: (i) {
              setState(() {
                etape = i;
              });
            },
            onStepContinue: () {
              setState(() {
                etape++;
              });
            },
            onStepCancel: () {
              setState(() {
                etape--;
              });
            },
            steps: [
              Step(title: Text("Information"), content: Text("bonjour 1")),
              Step(title: Text("Information"), content: Text("bonjour 2")),
              Step(title: Text("Information"), content: Text("bonjour 3"))
            ],
          ),
        ),
      ],
    );
  }
}
