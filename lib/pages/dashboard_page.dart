import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:plants_green/models/data_model.dart';
import 'package:plants_green/services/myservice.dart';

import 'package:plants_green/widgets/custom_card.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool water = false;
  bool udara = false;
  bool kapur = false;

  Data dataResult = Data();

  void readData() {
    try {
      DatabaseReference starCountRef = FirebaseDatabase.instance.ref('');
      starCountRef.onValue.listen((DatabaseEvent event) {
        final data = event.snapshot.value;
        dataResult = Data.fromJson(data as Map);
        setState(() {});
        print(dataResult.sensor?.kelembapanTanah);
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  void initState() {
    readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Color.fromARGB(255, 70, 199, 74),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            'Kontrol',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    width: 75,
                    height: 75,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.green,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        '${dataResult.sensor?.kelembapanTanah ?? 0}%',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    'Kelembapan \nTanah',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Switch(
                    activeColor: Colors.green,
                    value: water,
                    onChanged: (value) async {
                      water = await MyService().updateWater(value);
                      setState(() {});
                    },
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    width: 75,
                    height: 75,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.green,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        '${dataResult.sensor?.ph ?? 0}',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    'pH\n',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Switch(
                    activeColor: Colors.green,
                    value: kapur,
                    onChanged: (value) async {
                      kapur = await MyService().updateKapur(value);
                      setState(() {});
                    },
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    width: 75,
                    height: 75,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.green,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        '${dataResult.sensor?.kelembapanUdara ?? 0}',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    'Kelembapan \nUdara',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Switch(
                    activeColor: Colors.green,
                    value: dataResult.kendali?.kipas ?? false,
                    onChanged: (value) async {
                      dataResult.kendali?.kipas =
                          await MyService().updateKipas(value);
                      setState(() {});
                    },
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Log Data',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          (dataResult.log != null)
              ? Column(
                  children: [
                    ...dataResult.log!.map(
                      (e) => CustomCard(
                          tanah: e.kelembapanTanah ?? 0,
                          ph: e.ph ?? 0,
                          udara: e.kelembapanUdara ?? 0,
                          waktu: e.waktu ?? ''),
                    )
                  ],
                )
              : Text('Loading...'),
        ],
      ),
    );
  }
}
