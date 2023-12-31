import 'package:flutter/material.dart';
import 'package:flutter_codigo_pokedex/UI/widgets/item_data_widget.dart';
import 'package:flutter_codigo_pokedex/models/pokemon_models.dart';

import '../UI/general/colors.dart';
import '../UI/widgets/item_type_widget.dart';

class DetailPage extends StatelessWidget {
  PokemonModels pokemon;

  DetailPage({
    required this.pokemon,
  });
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    print(pokemon.candyCount);
    return Scaffold(
      backgroundColor: colorsPokemon[pokemon.type.first],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_border_outlined,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            top: height * 0.1,
            right: -30,
            child: Image.asset(
              'assets/images/pokeball.png',
              height: 200,
              color: Colors.white.withOpacity(0.2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pokemon.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    Row(
                      children: pokemon.type
                          .map((e) => Row(
                                children: [
                                  ItemTypeWidget(text: e),
                                  SizedBox(
                                    width: 12,
                                  )
                                ],
                              ))
                          .toList(),
                    ),
                  ],
                ),
                Text(
                  "#${pokemon.numPokemon}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              const Expanded(
                flex: 4,
                child: SizedBox(),
              ),
              Expanded(
                flex: 8,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      //Data del Pokemon
                      Padding(
                        padding: const EdgeInsets.all(22.0),
                        child: Column(
                          children: [
                            const Text(
                              "About Pokemon",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            ItemDataWidget(
                              title: "Height",
                              data: pokemon.height,
                            ),
                            ItemDataWidget(
                              title: "Weight",
                              data: pokemon.weight,
                            ),
                            ItemDataWidget(
                              title: "Candy",
                              data: pokemon.candy,
                            ),
                            ItemDataWidget(
                              title: "Candy Count",
                              data: pokemon.candyCount == 'null'
                                  ? 'No se encuentra'
                                  : pokemon.candyCount,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Weaknesses",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 16,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: pokemon.weaknesses
                                  .map((e) =>
                                  ItemTypeWidget(text: e,isWeak: true)
                                )
                                  .toList(),
                            )
                          ],
                        ),
                      ),

                      Positioned.fill(
                        top: -90.0,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Image.network(pokemon.img),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
