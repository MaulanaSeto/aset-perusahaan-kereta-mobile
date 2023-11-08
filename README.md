# Tugas 7
1. Perbedaan *Stateless* dan *Stateful Widget*
   * *Stateless Widget*<br>*Stateless widget* adalah *widget* yang tidak memiliki keadaan internal (*state*). Artinya, setelah *widget* ini dibangun dan dirender, ia tidak dapat berubah. *Stateless widget* bergantung sepenuhnya pada data yang diberikan padanya melalui konstruktor dan tidak dapat memodifikasi atau menyimpan data secara internal.
   * *Stateful Widget*<br>*Stateful widget* adalah *widget* yang  memiliki keadaan internal (*state*) sehingga dapat berubah selama masa hidup *widget* tersebut. Keadaan ini dapat diperbarui dan memicu pembaruan ulang tampilan *widget*. *Stateful widget* digunakan ketika memerlukan perubahan dinamis dalam antarmuka pengguna, seperti ketika pengguna berinteraksi dengan *widget* dan menyebabkan perubahan dalam tampilan.
3. Daftar *Widget*
4. Implementasi Daftar Periksa
   * Membuat Program Futter<br>
     * Membuat Program<br>Membuat program baru dengan menggunakan perintah prompt berikut.
       ```bash
       flutter create aset_perusahaan_kereta
       ```
     * Merapikan Struktur Proyek<br>Pertama, membuat berkas `menu.dart` pada folder `lib` dan mengimpor pustaka pada berkas tersebut dengan kode berikut.
       ```dart
       import 'package:flutter/material.dart';
       ```
       Kedua, memindahkan kelas `MyHomePage` dari berkas `main.dart` ke berkas `menu.dart` dan menghapus kelas `_MyHomePageState`. Terakhir, mengimpor berkas `menu.dart` di berkas `main.dart` dengan kode beikut.
       ```dart
       import 'package:shopping_list/menu.dart';
       ```
   * Membuat Tombol
     * Mengubah Sifat *Widget*<br>Pertama, mengganti kode `const MyHomePage(title: 'Flutter Demo Home Page')` pada berkas `main.dart` menjadi kode berikut.
       ```dart
       MyHomePage()
       ```
       Terakhir, megubah kelas induk pada kelas `MyHomePage`, menghapus fungsi `State`, menambahkan fungsi `build` yang mengembalikan `Widget`, dan mengubah bagian kode `({super.key, required this.title})` sesuai kode berikut.
       ```dart
       class MyHomePage extends StatelessWidget {
           MyHomePage({Key? key}) : super(key: key);

           @override
           Widget build(BuildContext context) {
           }
       }
       ```
     * Menambahkan Teks dan *Card*<br>Pertama, menambahkan kelas ShopItem pada berkas `menu.dart` sesuai kode berikut.
       ```dart
       class ShopItem {
           final String name;
           final IconData icon;

           ShopItem(this.name, this.icon);
       }
       ```
       Kedua, membuat daftar tombol pada kelas MyHomePage berisi objek bertipe `ShopItem` di bawah kode `MyHomePage({Key? key}) : super(key: key);` sesuai kode berikut.
       ```dart
       final List<ShopItem> items = [
           ShopItem("Lihat Produk", Icons.checklist),
           ShopItem("Tambah Produk", Icons.add_shopping_cart),
           ShopItem("Logout", Icons.logout),
       ];
       ```
       Ketiga, menambahkan pengembalian fungsi `build` dengan kode berikut.
       ```dart
       return Scaffold(
           appBar: AppBar(
               title: const Text(
                   'Halaman Aset',
                   style: TextStyle(
                       color: Colors.white,
                   ),
               ),
               backgroundColor: Colors.indigo,
           ),
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
                               children: items.map((ShopItem item) {
                                   return ShopCard(item);
                               }).toList(),
                           ),
                       ],
                   ),
               ),
           ),
       );
       ```
       Terakhir, membuat kelas `ShopCard` untuk menampilkan *card* dengan kode berikut.
       ```dart
       class ShopCard extends StatelessWidget {
           final ShopItem item;
           const ShopCard(this.item, {super.key});

           @override
           Widget build(BuildContext context) {
               return Material(
                   color: Colors.indigo,
                   child: InkWell(
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
       ```
   * Memunculkan *Snackbar*<br>Menmabahkan properti fungsi `onTap` pada *widget* `Material` sebagai nilai yang dikembalikan oleh fungsi `build` di kelas `ShopCard`, tepatnya di dalam *child widget* `InkWell` dalam properti `child` sesuai kode berikut.
     ```dart
     ...
     child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
     ...
     ```
   * Membedakan Warna Tombol<br>Menambahkan isi fungsi `build` di kelas `ShopCard` dan mengubah nilai properti `color` pada pengembalian `Material` menjadi variabel sesuai kode berikut.
     ```dart
     ...
     Widget build(BuildContext context) {
         Color buttonColor;
         if (item.name == "Lihat Produk") {
             buttonColor = const Color.fromARGB(255, 33, 56, 170);
         } else if (item.name == "Tambah Produk") {
             buttonColor = Colors.indigo;
         } else {
             buttonColor = const Color.fromARGB(255, 94, 110, 199);
         }
        return Material(
            color: buttonColor,
     ...
     ```
