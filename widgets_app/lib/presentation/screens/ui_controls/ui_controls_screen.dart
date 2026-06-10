import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("UI Controls")),
      body: _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  void setTransportation(Transportation? value) {
    if (value == null) return;
    setState(() {
      selectedTransportation = value;
      print(selectedTransportation.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: Text("Developer Mode"),
          subtitle: Text("aditional controls"),
          value: isDeveloper,
          onChanged: (value) => setState(() {
            isDeveloper = !isDeveloper;
          }),
        ),

        ExpansionTile(
          title: Text("Transportation vehicle"),
          subtitle: Text("Selected transportation: $selectedTransportation"),
          children: [
            RadioGroup<Transportation>(
              groupValue: selectedTransportation,
              onChanged: (value) => setTransportation(value),
              child: Column(
                children: [
                  RadioListTile<Transportation>(
                    title: Text("By car"),
                    subtitle: Text("car transportation"),
                    value: Transportation.car,
                  ),
                  RadioListTile<Transportation>(
                    title: Text("By boat"),
                    subtitle: Text("boat transportation"),
                    value: Transportation.boat,
                  ),
                  RadioListTile<Transportation>(
                    title: Text("By plane"),
                    subtitle: Text("plane transportation"),
                    value: Transportation.plane,
                  ),
                  RadioListTile<Transportation>(
                    title: Text("By submarine"),
                    subtitle: Text("submarine transportation"),
                    value: Transportation.submarine,
                  ),
                ],
              ),
            ),
          ],
        ),
      
        // TODO: por aqui
        CheckboxListTile(
          value: wantsBreakfast, 
          title: Text("Do you want breakfast?"),
          onChanged: (value) => setState(() {
            wantsBreakfast = !wantsBreakfast;
          }),),
        CheckboxListTile(
          value: wantsLunch, 
          title: Text("Do you want breakfast?"),
          onChanged: (value) => setState(() {
            wantsLunch = !wantsLunch;
          }),),
        CheckboxListTile(
          value: wantsDinner, 
          title: Text("Do you want breakfast?"),
          onChanged: (value) => setState(() {
            wantsDinner = !wantsDinner;
          }),),
      ],
    );
  }
}
