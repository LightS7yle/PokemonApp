import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_codigo_pokedex/UI/widgets/item_pokemon_widget.dart';
import 'package:flutter_codigo_pokedex/models/pokemon_models.dart';
import 'package:http/http.dart' as http;



class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List pokemons = [];
  List<PokemonModels> pokemonModel =[];

  @override
  initState() {
    super.initState();
    getDataPokemon();
  }

  getDataPokemon() async {
    Uri _uri = Uri.parse(
        "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");
    http.Response response = await http.get(_uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = json.decode(response.body);
      pokemonModel = myMap["pokemon"].map<PokemonModels>((e)=>PokemonModels.fromJson(e)).toList();
      //print(pokemonModel);
      //pokemons = myMap["pokemon"];
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    getDataPokemon();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 12,
              ),
              Text(
                "Pokedex",
                style: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              GridView.count(
                physics: const ScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.35,
                shrinkWrap: true,
                children: pokemonModel
                    .map(
                      (e) => ItemPokemonWidget(

                        pokemon: e,
                        //image: e.img,
                        //name: e.name,
                        //types: e.type,

                        //image: e["img"],
                        //name: e["name"],
                        //types: List <String>.from(e["type"].map((item) => item)),
                      ),
                    )
                    .toList(),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
