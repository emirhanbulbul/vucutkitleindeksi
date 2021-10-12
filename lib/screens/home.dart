import 'package:flutter/material.dart';
import 'package:vucutkitleindeksi/const.dart';
import 'package:vucutkitleindeksi/widgets/left_bar.dart';
import 'package:vucutkitleindeksi/widgets/right_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController boyController = TextEditingController();
  TextEditingController kiloController = TextEditingController();
  double sonuc = 0;
  String sonucText = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Vücut Kitle İndeksi Hesaplama",
          style: TextStyle(color: accentHexColor, fontWeight: FontWeight.w400),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    controller: boyController,
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w400,
                        color: accentHexColor),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Boy",
                        hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w400,
                            color: Colors.white.withOpacity(.8))),
                  ),
                ),
                Container(
                  width: 130,
                  child: TextField(
                    controller: kiloController,
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w400,
                        color: accentHexColor),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Kilo",
                        hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w400,
                            color: Colors.white.withOpacity(.8))),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                double a = double.parse(boyController.text);
                double b = double.parse(kiloController.text);

                setState(() {
                  if (a.toString().split(".").length == 1) {
                    List<String> result = a.toString().split("");
                    result.insert(1, ".");
                    String c = result.join();
                    a = double.parse(c);
                    sonuc = b / (a * a);
                    if (sonuc > 25) {
                      sonucText = "Sen kilolusun :/";
                    } else if (sonuc >= 18.5 && sonuc <= 25) {
                      sonucText = "Senin kilon normal";
                    } else {
                      sonucText = "Zayıfsın, kilo alman lazım :/";
                    }
                  } else {
                    sonuc = b / (a * a);
                    if (sonuc > 25) {
                      sonucText = "Sen kilolusun :/";
                    } else if (sonuc >= 18.5 && sonuc <= 25) {
                      sonucText = "Senin kilon normal";
                    } else {
                      sonucText = "Zayıfsın, kilo alman lazım :/";
                    }
                  }
                });
              },
              child: Container(
                child: Text("Hesapla",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: accentHexColor)),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: Text(sonuc.toStringAsFixed(2),
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      color: accentHexColor)),
            ),
            SizedBox(
              height: 30,
            ),
            Visibility(
              visible: sonucText.isNotEmpty,
              child: Container(
                child: Text(
                  sonucText,
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      color: accentHexColor),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            LeftBar(barWidth: 40),
            SizedBox(
              height: 10,
            ),
            LeftBar(barWidth: 80),
            SizedBox(
              height: 10,
            ),
            LeftBar(barWidth: 40),
            SizedBox(
              height: 30,
            ),
            RightBar(barWidth: 40),
            SizedBox(
              height: 50,
            ),
            RightBar(barWidth: 40)
          ],
        ),
      ),
    );
  }
}
