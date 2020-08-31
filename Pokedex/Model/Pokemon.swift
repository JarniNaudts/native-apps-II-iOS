//
//  Pokemon.swift
//  Pokedex
//
//  Created by Jarni Naudts on 31/08/2020.
//  Copyright © 2020 Jarni Naudts. All rights reserved.
//

import Foundation

struct Pokemon: Codable {
	let height: Int?
	let id: Int?
	let name: String
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
	
	enum CodingKeys: String, CodingKey {
		case backDefault = "back_default"
		case backFemale = "back_female"
		case backShiny = "back_shiny"
		case backShinyFemale = "back_shiny_female"
		case frontDefault = "front_default"
		case frontFemale = "front_female"
		case frontShiny = "front_shiny"
		case frontShinyFemale = "front_shiny_female"
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
