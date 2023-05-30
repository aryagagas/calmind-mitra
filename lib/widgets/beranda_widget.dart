import 'package:calmind_mitra/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BerandaWidget extends StatelessWidget {
  const BerandaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          children: [
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    color: ConstantColors.primaryColor,
                    // decoration: BoxDecoration(color: Colors.blue),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          right: -40,
                          child: SvgPicture.asset(
                            'assets/images/Logo-Calmind.svg',
                            height: 500,
                          ),
                        ),
                      ],
                    ))),
            const SizedBox(
              height: 16,
            ),
          ],
        )
      ],
    );
  }
}
