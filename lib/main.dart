import 'package:flutter/material.dart';
import 'package:shayari/shayri1.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static List title = [
    "प्यार शायरी",
    "दोस्ती शायरी",
    "जीवन जिंदगानी शायरी",
    "दर्द भरी शायरी",
    "कामयाबी शायरी",
    "इंतज़ार शायरी",
    "रोमांटिक शायरी",
    "मजेदार शायरी",
    "शुभ रात्रि शायरी",
    "गोलमाल शायरी",
    "गुड मॉर्निंग शायरी"
  ];
  static List img = [
    "image1.jpg",
    "image2.jpg",
    "image3.jpg",
    "image4.jpg",
    "image5.jpg",
    "image6.png",
    "two.jpg",
    "twel.jpg",
    "sex.jpg",
    "seven.jpg",
    "image4.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MY SHAYRI APP",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                title[index],
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return shayari(title[index]);
                  },
                ));
              },
              leading: CircleAvatar(
                  backgroundImage: AssetImage("image/${img[index]}")),
              trailing: Icon(
                Icons.chevron_right,
                color: Colors.white,
              ),
              tileColor: Colors.black,
              hoverColor: Colors.white,
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              height: 5,
              thickness: 5,
              color: Colors.grey,
            );
          },
          itemCount: title.length),
    );
  }
}
