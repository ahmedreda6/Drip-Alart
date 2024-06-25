import 'package:brain_box/core/widgets/snakbar.dart';
import 'package:brain_box/models/prams.dart';
import 'package:brain_box/widgets/Custom_humidity_triangle.dart';
import 'package:brain_box/widgets/custom_temperatue_triangle.dart';
import 'package:brain_box/widgets/edit_sensor_name.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SensorDetailsView extends StatefulWidget {
  const SensorDetailsView({
    super.key,
    required this.pramsSensor,
  });
  final PramsSensor pramsSensor;

  @override
  State<SensorDetailsView> createState() => _SensorDetailsViewState();
}

class _SensorDetailsViewState extends State<SensorDetailsView> {
  late WebViewController humdidityControler;
  late WebViewController tempControler;
  final DatabaseReference databaseRef =
      FirebaseDatabase.instance.ref('f91f5120-d376-421e-adcf-4c445d440c99');
  double? humidity;
  double? temperature;

  @override
  void initState() {
    super.initState();

    humdidityControler = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse(
          'https://thingspeak.com/channels/2540812/charts/2?width=auto&height=800&bgcolor=%23ffffff&color=%23d62020&dynamic=true&results=60&type=line&update=15',
        ),
      );
    tempControler = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse(
          'https://thingspeak.com/channels/2540812/charts/1?width=auto&height=800&bgcolor=%23ffffff&color=%23d62020&dynamic=true&results=60&type=line&update=15',
        ),
      );

    databaseRef.onValue.listen((DatabaseEvent event) {
      if (!mounted) return;

      final data = Map<String, dynamic>.from(event.snapshot.value as Map);
      setState(() {
        humidity = _toDouble(data['h']);
        temperature = _toDouble(data['t']);
      });
    });
  }

  double? _toDouble(dynamic value) {
    if (value is int) {
      return value.toDouble();
    } else if (value is double) {
      return value;
    } else if (value is String) {
      return double.tryParse(value);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    void copy() {
      final value = ClipboardData(
        text: widget.pramsSensor.uid,
      );
      Clipboard.setData(value);
      showSnackBar(context, 'Sensor ID Copied');
    }

    Future<void> refresh() {
      return Future.delayed(const Duration(seconds: 2));
    }

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: refresh,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ListView(
            children: [
              const SizedBox(
                height: 39,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  const SizedBox(
                    width: 27,
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
                        'Sensor (${widget.pramsSensor.index})',
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
                  const Spacer(),
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
                    'Sensor ID :',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  IconButton(
                    iconSize: 30,
                    onPressed: copy,
                    icon: const Icon(FontAwesomeIcons.copy),
                  ),
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
                        humiditylevel:
                            ' ${humidity?.toStringAsFixed(1) ?? "Loading..."}',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 120,
                      ),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: CustomTemperatureTriangle(
                          temperature:
                              ' ${temperature?.toStringAsFixed(1) ?? "Loading..."}',
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
                'History :',
                style: TextStyle(
                    fontSize: 32,
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
      ),
    );
  }
}
