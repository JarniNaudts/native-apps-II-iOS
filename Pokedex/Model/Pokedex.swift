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
	let count: Int
	let next, previous: String?
	let pokemon: [Pokemon]
	
	enum CodingKeys: String, CodingKey{
		case count
		case next
		case previous
		case pokemon = "results"
	}
}

// MARK: - Result
struct Pokemon: Codable {
	let name: String
	let url: String
}
