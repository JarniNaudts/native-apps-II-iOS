//
//  Pokemon.swift
//  Pokedex
//
//  Created by Jarni Naudts on 05/08/2020.
//  Copyright © 2020 Jarni Naudts. All rights reserved.
//

import Foundation

struct Pokedex: Codable {
	let pokemon: [Pokemon]
	
	enum CodingKeys: String, CodingKey{
		case pokemon = "results"
	}
}
