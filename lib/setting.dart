import 'package:flutter/material.dart';

List<String> list = <String>['One', 'Two', 'Three', 'Four','a','s','d','f','g','h','j','k','l','q','q', 'Three', 'Four','a','s','d','f','g','h','j'];

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Setting Page"),
        ),
        body: Container(
          color: Colors.grey[290],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
      children: [
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Select Country"),
                const SizedBox(
                  width: 30,
                ),
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            ElevatedButton(onPressed: (){

            }, child: Text("Update Setting"))
      ],
    ),
        ));
  }
}
