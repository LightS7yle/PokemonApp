class PokemonModels {
  String name;
  String img;
  List<String> type;
  String numPokemon;
  String height;
  String weight;
  String candy;
  String candyCount;
  List<String> weaknesses;

  PokemonModels({required this.weaknesses, required this.candyCount, required this.candy, required this.weight,required this.img, required this.name, required this.type,required this.numPokemon,required this.height});

  factory PokemonModels.fromJson(Map<String,dynamic> json) => PokemonModels(
        img: json["img"],
        name: json["name"],
        numPokemon: json["num"],
        height: json["height"],
        weight: json["weight"],
        candy: json["candy"],
        weaknesses: List<String>.from(json["weaknesses"].map((e)=>e)),
        candyCount: json["candy_count"].toString(),
        type: List<String>.from(json["type"].map((e) => e)),
      );
}
