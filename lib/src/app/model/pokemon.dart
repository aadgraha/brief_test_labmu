import 'dart:ui';

class Pokemon {
  final String name;
  final String id;
  final String imageUrl;
  final String xDescription;
  final String yDescription;
  final String height;
  final String category;
  final String weight;
  final List<String> typeOfPokemon;
  final List<String> weaknesses;
  final List<String> evolutions;
  final List<String> abilities;
  final int hp;
  final int attack;
  final int defense;
  final int specialAttack;
  final int specialDefense;
  final int speed;
  final int total;
  final String malePercentage;
  final String femalePercentage;
  final int genderless;
  final String cycles;
  final String eggGroups;
  final String evolvedFrom;
  final String reason;
  final String baseExp;
  final bool isFavorite;

  const Pokemon({
    required this.name,
    required this.id,
    required this.imageUrl,
    required this.xDescription,
    required this.yDescription,
    required this.height,
    required this.category,
    required this.weight,
    required this.typeOfPokemon,
    required this.weaknesses,
    required this.evolutions,
    required this.abilities,
    required this.hp,
    required this.attack,
    required this.defense,
    required this.specialAttack,
    required this.specialDefense,
    required this.speed,
    required this.total,
    required this.malePercentage,
    required this.femalePercentage,
    required this.genderless,
    required this.cycles,
    required this.eggGroups,
    required this.evolvedFrom,
    required this.reason,
    required this.baseExp,
    this.isFavorite = false
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'] ?? '',
      id: json['id'] ?? '',
      imageUrl: json['imageurl'] ?? '',
      xDescription: json['xdescription'] ?? '',
      yDescription: json['ydescription'] ?? '',
      height: json['height'] ?? '',
      category: json['category'] ?? '',
      weight: json['weight'] ?? '',
      typeOfPokemon: List<String>.from(json['typeofpokemon'] ?? []),
      weaknesses: List<String>.from(json['weaknesses'] ?? []),
      evolutions: List<String>.from(json['evolutions'] ?? []),
      abilities: List<String>.from(json['abilities'] ?? []),
      hp: json['hp'] ?? 0,
      attack: json['attack'] ?? 0,
      defense: json['defense'] ?? 0,
      specialAttack: json['special_attack'] ?? 0,
      specialDefense: json['special_defense'] ?? 0,
      speed: json['speed'] ?? 0,
      total: json['total'] ?? 0,
      malePercentage: json['male_percentage'] ?? '',
      femalePercentage: json['female_percentage'] ?? '',
      genderless: json['genderless'] ?? 0,
      cycles: json['cycles'] ?? '',
      eggGroups: json['egg_groups'] ?? '',
      evolvedFrom: json['evolvedfrom'] ?? '',
      reason: json['reason'] ?? '',
      baseExp: json['base_exp'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'imageurl': imageUrl,
      'xdescription': xDescription,
      'ydescription': yDescription,
      'height': height,
      'category': category,
      'weight': weight,
      'typeofpokemon': typeOfPokemon,
      'weaknesses': weaknesses,
      'evolutions': evolutions,
      'abilities': abilities,
      'hp': hp,
      'attack': attack,
      'defense': defense,
      'special_attack': specialAttack,
      'special_defense': specialDefense,
      'speed': speed,
      'total': total,
      'male_percentage': malePercentage,
      'female_percentage': femalePercentage,
      'genderless': genderless,
      'cycles': cycles,
      'egg_groups': eggGroups,
      'evolvedfrom': evolvedFrom,
      'reason': reason,
      'base_exp': baseExp,
    };
  }

  Pokemon copyWith({
  String? name,
  String? id,
  String? imageUrl,
  String? xDescription,
  String? yDescription,
  String? height,
  String? category,
  String? weight,
  List<String>? typeOfPokemon,
  List<String>? weaknesses,
  List<String>? evolutions,
  List<String>? abilities,
  int? hp,
  int? attack,
  int? defense,
  int? specialAttack,
  int? specialDefense,
  int? speed,
  int? total,
  String? malePercentage,
  String? femalePercentage,
  int? genderless,
  String? cycles,
  String? eggGroups,
  String? evolvedFrom,
  String? reason,
  String? baseExp,
  bool? isFavorite,
}) {
  return Pokemon(
    name: name ?? this.name,
    id: id ?? this.id,
    imageUrl: imageUrl ?? this.imageUrl,
    xDescription: xDescription ?? this.xDescription,
    yDescription: yDescription ?? this.yDescription,
    height: height ?? this.height,
    category: category ?? this.category,
    weight: weight ?? this.weight,
    typeOfPokemon: typeOfPokemon ?? this.typeOfPokemon,
    weaknesses: weaknesses ?? this.weaknesses,
    evolutions: evolutions ?? this.evolutions,
    abilities: abilities ?? this.abilities,
    hp: hp ?? this.hp,
    attack: attack ?? this.attack,
    defense: defense ?? this.defense,
    specialAttack: specialAttack ?? this.specialAttack,
    specialDefense: specialDefense ?? this.specialDefense,
    speed: speed ?? this.speed,
    total: total ?? this.total,
    malePercentage: malePercentage ?? this.malePercentage,
    femalePercentage: femalePercentage ?? this.femalePercentage,
    genderless: genderless ?? this.genderless,
    cycles: cycles ?? this.cycles,
    eggGroups: eggGroups ?? this.eggGroups,
    evolvedFrom: evolvedFrom ?? this.evolvedFrom,
    reason: reason ?? this.reason,
    baseExp: baseExp ?? this.baseExp,
    isFavorite: isFavorite ?? this.isFavorite,
  );
}
}

enum PokemonType {
  alltype,
  water,
  dragon,
  electric,
  fairy,
  ghost,
  fire,
  ice,
  grass,
  bug,
  fighting,
  normal,
  dark,
  steel,
  rock,
  psychic,
  ground,
  poison,
  flying,
}

extension PokemonTypeParser on String {
  PokemonType get pokemonType {
    switch (toLowerCase()) {
      case 'water':
        return PokemonType.water;
      case 'dragon':
        return PokemonType.dragon;
      case 'electric':
        return PokemonType.electric;
      case 'fairy':
        return PokemonType.fairy;
      case 'ghost':
        return PokemonType.ghost;
      case 'fire':
        return PokemonType.fire;
      case 'ice':
        return PokemonType.ice;
      case 'grass':
        return PokemonType.grass;
      case 'bug':
        return PokemonType.bug;
      case 'fighting':
        return PokemonType.fighting;
      case 'normal':
        return PokemonType.normal;
      case 'dark':
        return PokemonType.dark;
      case 'steel':
        return PokemonType.steel;
      case 'rock':
        return PokemonType.rock;
      case 'psychic':
        return PokemonType.psychic;
      case 'ground':
        return PokemonType.ground;
      case 'poison':
        return PokemonType.poison;
      case 'flying':
        return PokemonType.flying;
      default:
        return PokemonType.alltype;
    }
  }
}

extension PokemonTypeColor on PokemonType {
  Color get color {
    switch (this) {
      case PokemonType.alltype:
        return Color(0xFF333333);

      case PokemonType.water:
        return Color(0xFF5090D6);

      case PokemonType.dragon:
        return Color(0xFF0B6DC3);

      case PokemonType.electric:
        return Color(0xFFF4D23C);

      case PokemonType.fairy:
        return Color(0xFFEC8FE6);

      case PokemonType.ghost:
        return Color(0xFF5269AD);

      case PokemonType.fire:
        return Color(0xFFFF9D55);

      case PokemonType.ice:
        return Color(0xFF73CEC0);

      case PokemonType.grass:
        return Color(0xFF63BC5A);

      case PokemonType.bug:
        return Color(0xFF91C12F);

      case PokemonType.fighting:
        return Color(0xFFCE416B);

      case PokemonType.normal:
        return Color(0xFF919AA2);

      case PokemonType.dark:
        return Color(0xFF5A5465);

      case PokemonType.steel:
        return Color(0xFF5A8EA2);

      case PokemonType.rock:
        return Color(0xFFC5B78C);

      case PokemonType.psychic:
        return Color(0xFFFA7179);

      case PokemonType.ground:
        return Color(0xFFD97845);

      case PokemonType.poison:
        return Color(0xFFB567CE);

      case PokemonType.flying:
        return Color(0xFF89AAE3);
    }
  }
}
