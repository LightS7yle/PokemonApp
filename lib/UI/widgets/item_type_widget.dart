import 'package:flutter/material.dart';
import 'package:flutter_codigo_pokedex/UI/general/colors.dart';

class ItemTypeWidget extends StatelessWidget {
String text;
bool isWeak ;
ItemTypeWidget({required this.text,this.isWeak = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      padding: isWeak == false ? EdgeInsets.symmetric(horizontal: 14, vertical: 4): EdgeInsets.symmetric(horizontal: 28,vertical: 8),
      decoration: BoxDecoration(
          color: isWeak == false ? Colors.white.withOpacity(0.27): colorsPokemon[text],
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              offset: Offset(4, 4),
              blurRadius: 12,
            ),
          ]),
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
