//
//  PokedexTableViewController.swift
//  Pokedex
//
//  Created by Jarni Naudts on 05/08/2020.
//  Copyright © 2020 Jarni Naudts. All rights reserved.
//

import UIKit

class PokedexTableViewController: UITableViewController {
	
	var pokemon = [Pokemon]()

    override func viewDidLoad() {
        super.viewDidLoad()
		
		PokedexController.shared.fetchPokedex(){
			(pokemon) in
			if let pokemon = pokemon{
				self.updateUI(with: pokemon)
			}
		}
    }
	
	func updateUI(with pokemon: [Pokemon]){
		DispatchQueue.main.async {
			self.pokemon = pokemon
			self.tableView.reloadData()
		}
	}

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemon.count
    }

	
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "PokedexCellIdentifier") as? PokedexTableViewCell else{
			fatalError("Could not dequeue a cell")
		}
		cell.pokeLabel?.text = String(format: "#%03d - %@", indexPath.row+1, pokemon[indexPath.row].name)

        return cell
    }
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "PokemonDetailIdentifier"{
			let pokemonDetailTableViewController = segue.destination as! PokemonDetailTableViewController
			let index = tableView.indexPathForSelectedRow!.row
			pokemonDetailTableViewController.pokemon = pokemon[index]
		}
	}
}
