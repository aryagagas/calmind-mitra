import 'package:flutter/material.dart';
import '../screens/login_screen.dart';
import '../constants/color.dart';

class ProfilWidget extends StatelessWidget {
  const ProfilWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg-profil.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    color: ConstantColors.profilHeader,
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 75,
                          backgroundImage:
                              AssetImage('assets/images/pp_sample.jpg'),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Dr. Frans Noto',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Inter',
                          ),
                        ),
                        Text(
                          '+62 876-9876-5432',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'Inter',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        _buildCenteredHeader('Akun'),
                        const SizedBox(height: 16),
                        _buildMenuItem(context, 'Profil Saya', () {
                          // Aksi ketika "Profil Saya" dipencet
                        }),
                        const SizedBox(height: 16),
                        _buildMenuItem(context, 'Ubah Kata Sandi', () {
                          // Aksi ketika "Ubah Kata Sandi" dipencet
                        }),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildCenteredHeader('Aplikasi Calmind'),
                        const SizedBox(height: 16),
                        _buildMenuItem(context, 'Tentang Kami', () {
                          // Aksi ketika "Tentang Kami" dipencet
                        }),
                        const SizedBox(height: 16),
                        _buildMenuItem(context, 'Privasi', () {
                          // Aksi ketika "Privasi" dipencet
                        }),
                        const SizedBox(height: 16),
                        _buildMenuItem(context, 'Syarat & Ketentuan', () {
                          // Aksi ketika "Syarat & Ketentuan" dipencet
                        }),
                        const SizedBox(height: 16),
                        _buildMenuItem(context, 'Hubungi Kami', () {
                          // Aksi ketika "Hubungi Kami" dipencet
                        }),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildLogoutButton(context),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCenteredHeader(String title) {
    return Container(
      width: double.infinity,
      height: 100,
      padding: const EdgeInsets.symmetric(vertical: 8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ConstantColors.profilSubHeader,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontFamily: 'Inter',
        ),
      ),
    );
  }

  Widget _buildMenuItem(
      BuildContext context, String title, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: ConstantColors.profilSubHeader,
        elevation: 2,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontFamily: 'Inter',
        ),
      ),
      child: Row(
        children: [
          Text(title),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios_rounded),
        ],
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ElevatedButton(
        onPressed: () {
          // Lakukan proses logout atau tindakan yang sesuai di sini

          // Navigasi ke halaman login setelah logout
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
            (route) => false,
          );
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.red, // Warna latar belakang tombol
          padding: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Keluar',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Icon(
              Icons.logout_rounded,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
