// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// class FiChartPage extends StatefulWidget {
//   const FiChartPage({super.key});

//   @override
//   _FiChartPageState createState() => _FiChartPageState();
// }

// class _FiChartPageState extends State<FiChartPage> {
//   List<_SalesData> data = [
//     _SalesData('Jan', 35),
//     _SalesData('Feb', 28),
//     _SalesData('Mar', 34),
//     _SalesData('Apr', 32),
//     _SalesData('May', 40),
//     _SalesData('jun', 10),
//     _SalesData('jul', 22),
//     _SalesData('Aug', 30),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Card(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(
//                 height: 20,
//               ),
//               const Padding(
//                 padding: EdgeInsets.only(left: 20),
//                 child: Text(
//                   'History',
//                   style: TextStyle(
//                     fontFamily: 'Poppins',
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               const Padding(
//                 padding: EdgeInsets.only(left: 20),
//                 child: Text(
//                   'Risk chart',
//                   style: TextStyle(
//                     fontFamily: 'Poppins',
//                     fontSize: 12,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               const Divider(),
//               SizedBox(
//                 height: 400,
//                 width: 400,
//                 child: SfCartesianChart(
                  
//                   primaryXAxis: const CategoryAxis(),
//                   tooltipBehavior: TooltipBehavior(enable: true),
//                   series: <CartesianSeries<_SalesData, String>>[
//                     LineSeries<_SalesData, String>(
                      
//                       color: Colors.red,
//                       width: 5,
//                       dataSource: data,

//                       xValueMapper: (_SalesData sales, _) => sales.year,
//                       yValueMapper: (_SalesData sales, _) => sales.sales,

//                       // Enable data label
//                       dataLabelSettings: const DataLabelSettings(
//                         color: Colors.black,
//                         alignment: ChartAlignment.center,
//                         isVisible: true,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               const Row(
//                 children: [
//                   SizedBox(
//                     width: 20,
//                   ),
//                   Icon(
//                     Icons.circle,
//                     color: Colors.red,
//                     size: 15,
//                   ),
//                   SizedBox(
//                     width: 5,
//                   ),
//                   Text(
//                     'Risk level',
//                     style: TextStyle(
//                       fontSize: 20,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// class _SalesData {
//   _SalesData(this.year, this.sales);

//   final String year;
//   final double sales;
// }
