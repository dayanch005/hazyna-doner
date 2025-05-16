import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CorbaPage extends StatelessWidget {
  const CorbaPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doner', style: GoogleFonts.poppins()),
      ),
      body: Center(
        child: Text('Doner sahypasy', style: GoogleFonts.poppins(fontSize: 24)),
      ),
    );
  }
}
