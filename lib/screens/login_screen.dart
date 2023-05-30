import 'package:calmind_mitra/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:calmind_mitra/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 2,
        vsync: this); // Tambahkan inisialisasi TabController di initState
  }

  @override
  void dispose() {
    _tabController.dispose(); // Hapus TabController saat widget di dispose
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  String _username = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 37),
            width: double.infinity,
            height: 200,
            decoration: const BoxDecoration(
                color: Color(0xff6869ac),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15))),
            child: Stack(
              children: [
                Positioned(
                  top: 25,
                  right: 0,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: SizedBox(
                      width: 230,
                      height: 150,
                      child: Image.asset(
                        'assets/images/logo-white.png',
                        width: 100,
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  left: 30,
                  top: 120,
                  child: Align(
                    child: SizedBox(
                      width: 183,
                      height: 40,
                      child: Text(
                        'CalMind',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          height: -0.8,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  left: 30,
                  top: 185,
                  child: Align(
                    child: SizedBox(
                      width: 363,
                      height: 44,
                      child: Text(
                        'Mental Health Center',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 25,
                          fontWeight: FontWeight.normal,
                          height: -3,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50.0, right: 50.0, top: 16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35),
                border: Border.all(
                  color: const Color(0xFF6869AC),
                  width: 1.5,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Container(
                      margin: const EdgeInsets.only(right: 50, left: 50),
                      height: kToolbarHeight - 8.0,
                      decoration: BoxDecoration(
                        color: const Color(0xFFB6B6B6),
                        borderRadius: BorderRadius.circular(50.0),
                        border: Border.all(
                          color: const Color(0xFF4E4E4E),
                          width: 1.5,
                        ),
                      ),
                      child: TabBar(
                        controller: _tabController,
                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 2.0,
                                spreadRadius: 1.0,
                                offset: const Offset(0, 1),
                              ),
                            ],
                            color: const Color(0xFF6869AC)),
                        tabs: const [
                          Tab(
                            child: Text(
                              'Login',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Register',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                        labelColor: Colors.white, // Warna teks tab aktif
                        unselectedLabelColor: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          TextFormField(
                            autofocus: true,
                            decoration: InputDecoration(
                              labelText: 'Username',
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: const Color(0xFF4E4E4E),
                                  width: 1.5,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: const Color(0xFF4E4E4E),
                                  width: 1.5,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your username';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _username = value!;
                            },
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: const Color(0xFF4E4E4E),
                                  width: 1.5,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: const Color(0xFF4E4E4E),
                                  width: 1.5,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _password = value!;
                            },
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(35),
                                ),
                              ),
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 16.0),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                ConstantColors.primaryColor,
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                // TODO: implement login action
                                if ((_username == "mitra") &&
                                    (_password == "123")) {
                                  // maka berhasil login
                                  print('Berhasil Login');
                                  // pindah ke halaman home
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomeScreen(
                                        nPass: _password,
                                        nUsername: _username,
                                      ),
                                    ),
                                  );
                                } else {
                                  print('Username atau password salah');
                                }
                              }
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFF6869ac),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
