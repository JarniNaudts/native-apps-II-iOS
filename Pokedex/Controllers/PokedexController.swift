//
//  PokedexController.swift
//  Pokedex
//
//  Created by Jarni Naudts on 05/08/2020.
//  Copyright © 2020 Jarni Naudts. All rights reserved.
//

import Foundation
import UIKit

class PokedexController {
	static let shared = PokedexController()
	
	static let partyUpdateNotification = Notification.Name("PokedexController.partyUpdated")
	
//	var party = [Pokemon](){
//		didSet{
//			NotificationCenter.default.post(name: PokedexController.partyUpdateNotification, object: nil)
//		}
//	}
	
	static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
	static let archiveURL = documentsDirectory.appendingPathComponent("pokemon").appendingPathExtension("party")
	
	let baseURL = URL(string: "https://pokeapi.co/api/v2/")!
	
	func fetchPokedex(completion: @escaping ([Pokemon]?) -> Void){
		let initialPokedexURL = baseURL.appendingPathComponent("pokemon")
		var components = URLComponents(url: initialPokedexURL, resolvingAgainstBaseURL: true)!
		components.queryItems = [URLQueryItem(name: "limit", value: "964"), URLQueryItem(name: "offset", value: "0")]
		let pokedexURL = components.url!
		
		let task = URLSession.shared.dataTask(with: pokedexURL){
			(data, response, error) in
			let jsonDecoder = JSONDecoder()
			if let data = data,
				let pokedex = try? jsonDecoder.decode(Pokedex.self, from: data){
				completion(pokedex.pokemon)
			}else{
				completion(nil)
			}
		}
		task.resume()
	}
	
	func fetchPokemonDetails(forPokemon pokemonName: String, completion: @escaping (Pokemon?) -> Void){
		let pokemonURL = baseURL.appendingPathComponent("pokemon/\(pokemonName)")
		
		let task = URLSession.shared.dataTask(with: pokemonURL){
			(data, response, error) in
			let jsonDecoder = JSONDecoder()
			if let data = data, let pokemon = try? jsonDecoder.decode(Pokemon.self, from: data){
				completion(pokemon)
			}else{
				completion(nil)
			}
		}
		task.resume()
	}
	
	func fetchImage(url: URL, completion: @escaping (UIImage?) -> Void) {
		let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
			if let data = data,
				let image = UIImage(data: data) {
				completion(image)
			} else {
				completion(nil)
			}
		}
		task.resume()
	}
	
	static func loadPokemonInParty() -> [Pokemon]?{
		guard let codedPokemon = try? Data(contentsOf: archiveURL) else { return nil }
		let propertyListDecoder = PropertyListDecoder()
		return try? propertyListDecoder.decode(Array<Pokemon>.self, from: codedPokemon)
	}
	
	static func savePokemonInParty(_ party: [Pokemon]){
		let propertyListEncoder = PropertyListEncoder()
		let codedPokemon = try? propertyListEncoder.encode(party)
		try? codedPokemon?.write(to: archiveURL, options: .noFileProtection)
		NotificationCenter.default.post(name: PokedexController.partyUpdateNotification, object: nil)
	}
}
