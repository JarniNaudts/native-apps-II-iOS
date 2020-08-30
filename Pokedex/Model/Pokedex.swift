//
//  Pokemon.swift
//  Pokedex
//
//  Created by Jarni Naudts on 05/08/2020.
//  Copyright © 2020 Jarni Naudts. All rights reserved.
//

import Foundation

// MARK: - Pokedex
struct Pokedex: Codable {
	//let count: Int
	//let next, previous: String?
	let pokemon: [Pokemon]
	
	enum CodingKeys: String, CodingKey{
		//case count
		//case next
		//case previous
		case pokemon = "results"
	}
}

// MARK: - Result
struct Pokemon: Codable {
	//let abilities: [Ability]
	//let baseExperience: Int
	//let forms: [Species]
	//let gameIndices: [GameIndex]
	let height: Int?
	//let heldItems: [JSONAny]
	let id: Int?
	//let isDefault: Bool
	//let locationAreaEncounters: String
	//let moves: [Move]
	let name: String
	//let order: Int
	//let species: Species
	let sprites: Sprites?
	let stats: [Stat]?
	let types: [TypeElement]?
	let weight: Int?
	
	static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
	static let archiveURL = documentsDirectory.appendingPathComponent("pokemon").appendingPathExtension("party")
	
	static func loadPokemonInParty() -> [Pokemon]?{
		guard let codedPokemon = try? Data(contentsOf: archiveURL) else { return nil }
		let propertyListDecoder = PropertyListDecoder()
		return try? propertyListDecoder.decode(Array<Pokemon>.self, from: codedPokemon)
	}
	
	static func savePokemonInParty(_ party: [Pokemon]){
		let propertyListEncoder = PropertyListEncoder()
		let codedPokemon = try? propertyListEncoder.encode(party)
		try? codedPokemon?.write(to: archiveURL, options: .noFileProtection)
	}
	
//	enum CodingKeys: String, CodingKey {
//		//case abilities
//		//case baseExperience = "base_experience"
//		//case forms
//		//case gameIndices = "game_indices"
//		case height
//		//case heldItems = "held_items"
//		case id
//		//case isDefault = "is_default"
//		//case locationAreaEncounters = "location_area_encounters"
//		case name, sprites, stats, types, weight
//	}
}

struct Sprites: Codable {
	let backDefault: URL?
	let backFemale: URL?
	let backShiny: URL?
	let backShinyFemale: URL?
	let frontDefault: URL?
	let frontFemale: URL?
	let frontShiny: URL?
	let frontShinyFemale: URL?
	//let other: Other
	//let versions: Versions
	
	enum CodingKeys: String, CodingKey {
		case backDefault = "back_default"
		case backFemale = "back_female"
		case backShiny = "back_shiny"
		case backShinyFemale = "back_shiny_female"
		case frontDefault = "front_default"
		case frontFemale = "front_female"
		case frontShiny = "front_shiny"
		case frontShinyFemale = "front_shiny_female"
		//case other, versions
	}
}

struct Stat: Codable {
	let baseStat: Int
	let stat: StatDetail
	
	enum CodingKeys: String, CodingKey {
		case baseStat = "base_stat"
		case stat
	}
}

struct TypeElement: Codable {
	let slot: Int
	let type: TypeDetail
}

struct TypeDetail: Codable {
	let name: String
}

struct StatDetail: Codable{
	let name: String
}

