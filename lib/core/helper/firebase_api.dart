// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   children: [
//     const Text(
//       'Filter by :',
//       style: TextStyle(
//         fontSize: 21,
//         fontFamily: 'Poppins',
//       ),
//     ),
//     Card(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: DropdownButton(
//           value: dropdownvalue,
//           icon: const Icon(Icons.swap_calls),
//           items: const [
//             DropdownMenuItem(
//               value: 'Last month ',
//               child: Text(
//                 'Last month ',
//                 style: TextStyle(
//                   fontFamily: 'Poppins',
//                 ),
//               ),
//             ),
//             DropdownMenuItem(
//               value: 'Last weak',
//               child: Text(
//                 'Last weak',
//                 style: TextStyle(
//                   fontFamily: 'Poppins',
//                 ),
//               ),
//             ),
//             DropdownMenuItem(
//               value: 'Last Year',
//               child: Text(
//                 'Last Year',
//                 style: TextStyle(
//                   fontFamily: 'Poppins',
//                 ),
//               ),
//             )
//           ],
//           onChanged: (String? newValue) {
//             setState(() {
//               dropdownvalue = newValue!;
//             });
//           },
//         ),
//       ),
//     )
//   ],
// ),
// const FiChartPage()

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class RealTimeSensorData extends StatelessWidget {
  RealTimeSensorData({super.key});
  final sensorData = FirebaseDatabase.instance.ref('frfrf534543');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FirebaseAnimatedList(
          query: sensorData,
          itemBuilder: (context, snapshot, animation, index) {
            return Column(
              children: [
                Text(snapshot.child('h').value.toString()),
                Text(snapshot.child('t').value.toString()),
              ],
            );
          }),
    );
  }
}
