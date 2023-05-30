import 'package:calmind_mitra/constants/color.dart';
import 'package:calmind_mitra/widgets/pesan_widget.dart';
import 'package:flutter/material.dart';
import '../widgets/beranda_widget.dart';
import '../widgets/profil_widget.dart';
import '../widgets/transaksi_widget.dart';

class HomeScreen extends StatefulWidget {
  // const HomeScreen({super.key});
  final String nPass, nUsername;
  const HomeScreen({
    Key? key,
    required this.nPass,
    required this.nUsername,
  }) : super(key: key);
  // PageBerandaUtama({required this.nPass, required this.nUsername});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: ConstantColors.primaryColor,
        elevation: 0,
        title: Center(
          child: Text(
            _selectedIndex == 0
                ? 'Beranda'
                : _selectedIndex == 1
                    ? 'Pesan'
                    : _selectedIndex == 2
                        ? 'Transaksi'
                        : 'Profil',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Inter',
            ),
          ),
        ),
        toolbarHeight: 70, // Mengatur tinggi background AppBar
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          BerandaWidget(),
          PesanWidget(),
          TransaksiWidget(),
          ProfilWidget(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Warna bayangan
              blurRadius: 12, // Tingkat blur
              spreadRadius: 2, // Tingkat penyebaran bayangan
              offset:
                  const Offset(0, 0), // Posisi bayangan relatif terhadap widget
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: ConstantColors.secondaryColor,
          unselectedItemColor: ConstantColors.tertiaryColor,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message_rounded),
              label: 'Pesan',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.text_snippet_rounded),
              label: 'Transaksi',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profil',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
