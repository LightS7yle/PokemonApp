import 'package:flutter/material.dart';
import 'package:flutter_codigo_pokedex/Pages/detail_page.dart';
import 'package:flutter_codigo_pokedex/models/pokemon_models.dart';

import 'item_type_widget.dart';

class ItemPokemonWidget extends StatelessWidget {
  // String name;
  //String image;
  //List<String> types;
  //ItemPokemonWidget({required this.image, required this.name,required this.types});
  PokemonModels pokemon;
  ItemPokemonWidget({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(pokemon: pokemon),
            ));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xff4CCFB2), borderRadius: BorderRadius.circular(18)),
        child: Stack(
          children: [
            Positioned(
              bottom: -20,
              right: -20,
              child: Image.asset(
                'assets/images/pokeball.png',
                height: 120,
                color: Colors.white.withOpacity(0.27),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pokemon.name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  ...pokemon.type
                      .map((e) => ItemTypeWidget(
                            text: e,
                          ))
                      .toList(),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.network(pokemon.img),
            ),
          ],
        ),
      ),
    );
  }
}
