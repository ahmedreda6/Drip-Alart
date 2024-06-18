import 'dart:convert';

import 'package:brain_box/helper/snakbar.dart';
import 'package:brain_box/models/prams.dart';
import 'package:brain_box/widgets/Custom_humidity_triangle.dart';
import 'package:brain_box/widgets/custom_temperatue_triangle.dart';
import 'package:brain_box/widgets/edit_sensor_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;

class SensorDitalsScreen extends StatefulWidget {
  const SensorDitalsScreen({
    super.key,
    required this.pramsSensor,
  });
  final PramsSensor pramsSensor;

  @override
  State<SensorDitalsScreen> createState() => _SensorDitalsScreenState();
}

class _SensorDitalsScreenState extends State<SensorDitalsScreen> {
  final humdidityControler = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(
      Uri.parse(
        'https://thingspeak.com/channels/2540812/charts/2?width=auto&height=800&bgcolor=%23ffffff&color=%23d62020&dynamic=true&results=60&type=line&update=15',
      ),
    );
  final tempControler = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(
      Uri.parse(
        'https://thingspeak.com/channels/2540812/charts/1?width=auto&height=800&bgcolor=%23ffffff&color=%23d62020&dynamic=true&results=60&type=line&update=15',
      ),
    );
  // fetch() async {
  //   http.Response url;
  //   url = await http.get(
  //       'https://thingspeak.com/channels/2540812/feed/last.json?&amp;offset=0&amp;location=true&amp;results=60');
  //   return json.decode(url.body['results']);
  // }

  String dropdownvalue = 'Last month ';

  @override
  Widget build(BuildContext context) {
    copy() {
      final value = ClipboardData(
        text: widget.pramsSensor.uid,
      );
      Clipboard.setData(value);
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(
              height: 39,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back_ios),
                ),
                const SizedBox(
                  width: 30,
                ),
                Image.asset('assets/Group 682.png'),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sensor (${widget.pramsSensor.index}) ',
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const Text(
                      'details',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 100,
                ),
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        context: context,
                        builder: (context) {
                          return const EditSensorName();
                        });
                  },
                  icon: const Icon(
                    FontAwesomeIcons.penToSquare,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Sensor Id :',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Poppins',
                  ),
                ),
                IconButton(
                  iconSize: 30,
                  onPressed: () {
                    copy();
                    showSnackBar(context, 'Sensor Id Copeid');
                  },
                  icon: const Icon(FontAwesomeIcons.copy),
                )
              ],
            ),
            Text(
              widget.pramsSensor.uid,
              style: const TextStyle(
                fontSize: 22,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Stack(
                children: [
                  const SizedBox(
                    width: double.infinity,
                    height: 350,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: CustomHumidityTriangle(
                      humiditylevel: widget.pramsSensor.humiditylevel,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 120,
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: CustomTemperatureTriangle(
                        temperature: widget.pramsSensor.temperature,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Row(
              children: [
                Icon(Icons.radio_button_checked),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Last read :',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'data',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const Row(
              children: [
                Text(
                  'Risk level :',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins'),
                ),
              ],
            ),
            Stack(
              children: [
                Image.asset(
                  'assets/Frame 683.png',
                  height: 75,
                  width: 208,
                ),
                Positioned(
                  bottom: 10,
                  left: widget.pramsSensor.left,
                  child: Image.asset(
                    'assets/Polygon 1.png',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'History ',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.5,
              width: MediaQuery.of(context).size.width,
              child: WebViewWidget(controller: humdidityControler),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.5,
              width: MediaQuery.of(context).size.width,
              child: WebViewWidget(controller: tempControler),
            ),
          ],
        ),
      ),
    );
  }
}
