# Tugas 7
1. Perbedaan *Stateless* dan *Stateful Widget*
   * *Stateless Widget*<br>*Stateless widget* adalah *widget* yang tidak memiliki keadaan internal (*state*). Artinya, setelah *widget* ini dibangun dan dirender, ia tidak dapat berubah. *Stateless widget* bergantung sepenuhnya pada data yang diberikan padanya melalui konstruktor dan tidak dapat memodifikasi atau menyimpan data secara internal.
   * *Stateful Widget*<br>*Stateful widget* adalah *widget* yang  memiliki keadaan internal (*state*) sehingga dapat berubah selama masa hidup *widget* tersebut. Keadaan ini dapat diperbarui dan memicu pembaruan ulang tampilan *widget*. *Stateful widget* digunakan ketika memerlukan perubahan dinamis dalam antarmuka pengguna, seperti ketika pengguna berinteraksi dengan *widget* dan menyebabkan perubahan dalam tampilan.
3. Daftar *Widget*
   * Scaffold<br>*Widget* yang digunakan untuk membuat struktur halaman.
   * AppBar<br>*Widget* yang menampilkan bilah atas dan judul.
   * SingleChildScrollView<br>*Widget* yang membungkus seluruh halaman dan memungkinkan kontennya untuk bisa di-*scroll*.
   * Padding<br>*Widget* yang memberi jarak atau *padding* di sekitar konten.
   * Column<br>*Widget* yang menata elemen-elemen UI secara vertikal dalam kolom.
   * GridView.count<br>*Widget* yang membuat grid.
   * Material<br>*Widget* yang membuat efek materi pada *card*.
   * InkWell<br>*Widget* yang menambahkan efek *ink splash* ketika pengguna menyentuh *card*.
   * Icon<br>*Widget* yang menampilkan ikon.
   * Text<br>*Widget* yang menampilkan teks.
   * Color<br>*Widget* yang menampilkan warna.
   * SnackBar<br>*Widget* yang menampilkan pesan notifikasi singkat.
5. Implementasi Daftar Periksa
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
     * Menambahkan Teks dan *Card*<br>Pertama, menambahkan kelas `ButtonItem` pada berkas `menu.dart` sesuai kode berikut.
       ```dart
       class ButtonItem {
         final String name;
         final IconData icon;

         ButtonItem(this.name, this.icon);
       }
       ```
       Kedua, membuat daftar tombol pada kelas MyHomePage berisi objek bertipe `ButtonItem` di bawah kode `MyHomePage({Key? key}) : super(key: key);` sesuai kode berikut.
       ```dart
       final List<ButtonItem> items = [
         ButtonItem("Lihat Aset", Icons.checklist),
         ButtonItem("Tambah Aset", Icons.add_shopping_cart),
         ButtonItem("Keluar", Icons.logout),
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
                               children: items.map((ButtonItem item) {
                                   return ButtonCard(item);
                               }).toList(),
                           ),
                       ],
                   ),
               ),
           ),
       );
       ```
       Terakhir, membuat kelas `ButtonCard` untuk menampilkan *card* dengan kode berikut.
       ```dart
       class ButtonCard extends StatelessWidget {
           final ButtonItem item;
           const ButtonCard(this.item, {super.key});

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
         if (item.name == "Lihat Aset") {
             buttonColor = const Color.fromARGB(255, 26, 45, 141);
         } else if (item.name == "Tambah Aset") {
             buttonColor = Colors.indigo;
         } else {
             buttonColor = const Color.fromARGB(255, 94, 110, 199);
         }
         return Material(
             color: buttonColor,
     ...
     ```
# Tugas 8
1. Perbedaan `Navigator.push()` dengan `Navigator.pushReplacement()`
   * `Navigator.push()`<br>Metode yang menambahkan suatu rute ke dalam *stack* rute yang dikelola oleh Navigator. Metode ini menyebabkan rute yang ditambahkan berada di paling atas *stack*, sehingga rute tersebut akan muncul dan ditampilkan kepada pengguna.
   * `Navigator.pushReplacement()`<br>Metode yang menghapus rute yang sedang ditampilkan kepada pengguna dan menggantinya dengan suatu rute lain. Metode ini menyebabkan aplikasi berpindah dari rute yang sedang ditampilkan kepada pengguna ke suatu rute yang diberikan. Pada *stack* rute yang dikelola Navigator, rute lama di atas *stack* akan digantikan secara langsung oleh rute baru yang diberikan tanpa mengubah kondisi elemen stack yang berada di bawahnya.
2. *Layout Widget*
   * Align<br>*Widget* yang menyelaraskan *child*-nya dengan dirinya sendiri dan secara opsional mengukur dirinya sendiri berdasarkan ukuran *child*-nya.
   * AspectRatio<br>*Widget* yang mencoba mengukur *child*-nya ke rasio aspek tertentu.
   * Baseline<br>Kontainer yang memosisikan *child*-nya sesuai dengan garis dasar *child* tersebut.
   * Center<br>Blok penyelarasan yang memusatkan *child*-nya di dalam dirinya sendiri.
   * ConstrainedBox<br>*Widget* yang memberikan batasan tambahan pada *child*-nya.
   * Container<br>*Widget* praktis yang menggabungkan *widget* pewarnaan, pemosisian, dan pengukuran.
   * Expanded<br>*Widget* yang memperluas *child* dari Row, Column, atau Flex.
   * FittedBox<br>*Widget* yang menskalakan dan memposisikan *child*-nya di dalam dirinya sendiri sesuai dengan kecocokannya.
   * Padding<br>*Widget* yang menyisipkan *child*-nya berdasarkan *padding* yang diberikan.
   * Transform<br>*Widget* yang menerapkan transformasi sebelum mewarnai *child*-nya.
3. Elemen Masukan Formulir
   * Tipe<br>Masukan ini diperlukan untuk membedakan tipe aset, seperti kereta, gerbong, lokomotif, dan lainnya.
   * Nama<br>Masukan ini diperlukan untuk menyimpan nama aset.
   * Pemilik<br>Masukan ini diperlukan untuk menyimpan pemilik aset. Masukan ini memerlukan beberapa karakter huruf kapital sebagai kode dipo atau subdipo stasiun pemilik aset.
   * Jumlah<br>Masukan ini diperlukan untuk menyimpan jumlah aset.
   * Deskripsi<br>Masukan ini diperlukan untuk memberikan deskripsi maupun informasi tambahan aset.
4. Penerapan *Clean Architecture*<br>Penerapan *clean architecture* pada aplikasi Flutter melibatkan struktur proyek yang terorganisir dengan baik untuk memisahkan konsep-konsep utama seperti logika, UI, dan akses data. *Clean architecture* memastikan bahwa kode dapat diuji dengan baik, mudah dipelihara, dan independen dari perubahan-perubahan pada lapisan tertentu.
5. Implementasi Daftar Periksa
   * Mmebuat Halaman Formulir<br>Membuat berkas `asset_form.dart` di folder `lib` berisi kode berikut.
     ```dart
     import 'package:flutter/material.dart';
     import 'package:aset_perusahaan_kereta/widgets/left_drawer.dart';

     class AssetFormPage extends StatefulWidget {
       const AssetFormPage({super.key});

       @override
       State<AssetFormPage> createState() => _AssetFormPageState();
     }

     class _AssetFormPageState extends State<AssetFormPage> {
       final _formKey = GlobalKey<FormState>();
       String _type = "";
       String _name = "";
       String _owner = "";
       int _amount = 0;
       String _description = "";
     
       @override
       Widget build(BuildContext context) {
         return Scaffold(
           appBar: AppBar(
             title: const Center(
               child: Text(
                 'Form Tambah Produk',
               ),
             ),
             backgroundColor: Colors.indigo,
             foregroundColor: Colors.white,
           ),
           drawer: const LeftDrawer(),
           body: Form(
             child: SingleChildScrollView(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   //Isi Formulir
                 ]
               )
             ),
           ),
         );
       }
     }
     ```
     * Menambahkan Lima Masukan<br>Menambahkan dan memvalidasi elemen masukan pada bagian komentar `//Isi Formulir` sesuai dengan kode berikut.
       ```dart
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: TextFormField(
           decoration: InputDecoration(
             hintText: "Tipe",
             labelText: "Tipe",
             border: OutlineInputBorder(
               borderRadius: BorderRadius.circular(5.0),
             ),
           ),
           onChanged: (String? value) {
             setState(() {
               _type = value!;
             });
           },
           validator: (String? value) {
             if (value == null || value.isEmpty) {
               return "Tipe tidak boleh kosong!";
             }
              return null;
           },
         ),
       ),
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: TextFormField(
           decoration: InputDecoration(
             hintText: "Nama",
             labelText: "Nama",
             border: OutlineInputBorder(
               borderRadius: BorderRadius.circular(5.0),
             ),
           ),
           onChanged: (String? value) {
             setState(() {
               _name = value!;
             });
           },
           validator: (String? value) {
             if (value == null || value.isEmpty) {
               return "Nama tidak boleh kosong!";
             }
             return null;
           },
         ),
       ),
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: TextFormField(
           decoration: InputDecoration(
             hintText: "Pemilik",
             labelText: "Pemilik",
             border: OutlineInputBorder(
               borderRadius: BorderRadius.circular(5.0),
             ),
           ),
           onChanged: (String? value) {
             setState(() {
               _owner = value!;
             });
           },
           validator: (String? value) {
             if (value == null || value.isEmpty) {
               return "Pemilik tidak boleh kosong!";
             }
             return null;
           },
         ),
       ),
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: TextFormField(
           decoration: InputDecoration(
             hintText: "Jumlah",
             labelText: "Jumlah",
             border: OutlineInputBorder(
               borderRadius: BorderRadius.circular(5.0),
             ),
           ),
           onChanged: (String? value) {
             setState(() {
               _amount = int.parse(value!);
             });
           },
           validator: (String? value) {
             if (value == null || value.isEmpty) {
               return "Jumlah tidak boleh kosong!";
             }
             int? val = int.tryParse(value);
             if (val == null) {
               return "Jumlah harus berupa angka!";
             }
             if (val <= 0) {
               return "Jumlah harus lebih dari 0!";
             }
             return null;
           },
         ),
       ),
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: TextFormField(
           decoration: InputDecoration(
             hintText: "Deskripsi",
             labelText: "Deskripsi",
             border: OutlineInputBorder(
               borderRadius: BorderRadius.circular(5.0),
             ),
           ),
           onChanged: (String? value) {
             setState(() {
               _description = value!;
             });
           },
           validator: (String? value) {
             if (value == null || value.isEmpty) {
               return "Deskripsi tidak boleh kosong!";
             }
             return null;
           },
         ),
       ),
       ```
     * Membuat Tombol `Simpan`<br>Membuat tombol `Simpan` di bagian yang sama dengan kode berikut.
       ```dart
       Align(
         alignment: Alignment.bottomCenter,
         child: Padding(
           padding: const EdgeInsets.all(8.0),
           child: ElevatedButton(
             style: ButtonStyle(
               backgroundColor: MaterialStateProperty.all(Colors.indigo),
             ),
             onPressed: () {
               if (_formKey.currentState!.validate()) {
                 showDialog(
                   context: context,
                   builder: (context) {
                     //Kotak Dialog
                   },
                 );
                 _formKey.currentState!.reset();
               }
             },
             child: const Text(
               "Simpan",
               style: TextStyle(color: Colors.white),
             ),
           ),
         ),
       ),
       ```
   * Menghubungkan Halaman Formulir dengan Tombol `Tambah Aset`<br>Menambahkan kode pada properti fungsi `onTap` pada *widget* `Material` sebagai nilai yang dikembalikan oleh fungsi `build` di kelas `ShopCard`, tepatnya di dalam *child widget* `InkWell` dalam properti `child` di berkas `menu.dart` sesuai kode berikut.
     ```dart
     ...
     ScaffoldMessenger.of(context)
       ..hideCurrentSnackBar()
       ..showSnackBar(SnackBar(
         content: Text("Kamu telah menekan tombol ${item.name}!")));
     if (item.name == "Tambah Aset") {
       Navigator.push(context, MaterialPageRoute(builder: (context) => const AssetFormPage()));
     }
     ...
     ```
   * Memunculkan *Pop-Up* Data<br>Membuat `AllerDialog` pada bagian komentar `//Kotak Dialog` di berkas `asset_form.dart` dengan kode berikut.
     ```dart
     return AlertDialog(
       title: const Text('Produk berhasil tersimpan'),
       content: SingleChildScrollView(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text('Tipe: $_type'),
             Text('Nama: $_name'),
             Text('Pemilik: $_owner'),
             Text('Jumlah: $_amount'),
             Text('Deskripsi: $_description')
           ],
         ),
       ),
       actions: [
         TextButton(
           child: const Text('OK'),
           onPressed: () {
             Navigator.pop(context);
           },
         ),
       ],
     );
     ```
   * Membuat *Drawer*<br>Pertama, membuat folder `widgets` di dalam folder `lib` lalu membuat berkas `left_drawer.dart` di folder `widgets` berisi kode berikut.
     ```dart
     import 'package:flutter/material.dart';
     import 'package:aset_perusahaan_kereta/menu.dart';
     import 'package:aset_perusahaan_kereta/asset_form.dart';
    
     class LeftDrawer extends StatelessWidget {
       const LeftDrawer({super.key});
    
       @override
       Widget build(BuildContext context) {
         return Drawer(
           child: ListView(
             children: [
               const DrawerHeader(
                 decoration: BoxDecoration(
                   color: Colors.indigo,
                 ),
                 child: Column(
                   children: [
                     Text(
                       'Aset',
                       textAlign: TextAlign.center,
                       style: TextStyle(
                         fontSize: 30,
                         fontWeight: FontWeight.bold,
                         color: Colors.white,
                       ),
                     ),
                     Padding(padding: EdgeInsets.all(10)),
                     Text(
                       "Catat aset Anda!",
                       textAlign: TextAlign.center,
                       style: TextStyle(
                         fontSize: 15,
                         color: Colors.white,
                         fontWeight: FontWeight.normal,
                       ),
                     ),
                   ],
                 ),
               ),
               ListTile(
                 leading: const Icon(Icons.home_outlined),
                 title: const Text('Halaman Aset'),
                 onTap: () {
                   Navigator.pushReplacement(
                     context,
                     MaterialPageRoute(
                       builder: (context) => MyHomePage(),
                     ),
                   );
                 },
               ),
               ListTile(
                 leading: const Icon(Icons.add_shopping_cart),
                 title: const Text('Tambah Produk'),
                 onTap: () {
                   Navigator.push(context, MaterialPageRoute(
                     builder: (context) => const AssetFormPage()));
                 },
               ), 
             ],
           ),
         );
       }
     }
     ```
