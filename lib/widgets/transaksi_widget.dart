import 'package:flutter/material.dart';

class TransaksiWidget extends StatelessWidget {
  const TransaksiWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Padding(
          padding: const EdgeInsets.only(right: 16, left: 16, top: 16),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 16, left: 16),
                height: kToolbarHeight - 8.0,
                decoration: BoxDecoration(
                  color: const Color(0xFFB6B6B6),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TabBar(
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 2.0,
                          spreadRadius: 1.0,
                          offset: const Offset(0, 1),
                        ),
                      ],
                      color: const Color(0xFF5D3891)),

                  tabs: const [
                    Tab(
                      child: Text(
                        'Pembayaran',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Transaksi Terakhir',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                  labelColor: Colors.white, // Warna teks tab aktif
                  unselectedLabelColor: Colors.white,
                ),
              ),
            ],
          ),
        ));
  }
}
