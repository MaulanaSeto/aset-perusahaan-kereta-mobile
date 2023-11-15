import 'package:flutter/material.dart';
import 'package:aset_perusahaan_kereta/asset_form.dart';
import 'package:aset_perusahaan_kereta/widgets/left_drawer.dart';
import 'package:aset_perusahaan_kereta/widgets/asset_card.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  final List<ButtonItem> items = [
    ButtonItem("Lihat Aset", Icons.checklist),
    ButtonItem("Tambah Aset", Icons.add_shopping_cart),
    ButtonItem("Keluar", Icons.logout),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Halaman Aset',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  'Aset',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GridView.count(
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((ButtonItem item) {
                  return ButtonCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonCard extends StatelessWidget {
  final ButtonItem item;
  const ButtonCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    Color buttonColor;
    if (item.name == "Lihat Aset") {
      buttonColor = const Color.fromARGB(255, 26, 45, 141);
    } else if (item.name == "Tambah Aset") {
      buttonColor = Colors.indigo;
    } else {
      buttonColor = const Color.fromARGB(255, 94, 110, 199);
    }
    return Material(
      color: buttonColor,
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
          if (item.name == "Tambah Aset") {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const AssetFormPage()));
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}