import 'package:flutter/material.dart';

const List<String> list = <String>[
  'França Pinto 406 - Vila Mariana',
  'Carlos Gomes 23 - São José',
];

class dropbox extends StatefulWidget {
  const dropbox({super.key});

  @override
  State<dropbox> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<dropbox> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: DropdownButton<String>(
          value: dropdownValue,
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Color.fromARGB(200, 32, 171, 78),
          ),
          elevation: 16,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 12,
          ),
          underline: Container(
            height: 2,
            color: const Color.fromARGB(200, 255, 255, 67),
          ),
          onChanged: (String? value) {
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
      ),
    );
  }
}
