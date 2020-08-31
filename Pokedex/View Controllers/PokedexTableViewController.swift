//
//  PokedexTableViewController.swift
//  Pokedex
//
//  Created by Jarni Naudts on 05/08/2020.
//  Copyright © 2020 Jarni Naudts. All rights reserved.
//

import UIKit
import CoreLocation

class PokedexTableViewController: UITableViewController, CLLocationManagerDelegate {
	
	let locationManager:CLLocationManager  = CLLocationManager()
	
	var pokemon = [Pokemon]()

    override func viewDidLoad() {
        super.viewDidLoad()
		setupGeofence()
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
	
	//For testing change location in the simulator to 51,0944878:3,9121914 for entering pallet town and any coordinates at least 100m away for exiting pallet town
	func setupGeofence(){
		locationManager.delegate = self
		locationManager.requestAlwaysAuthorization()
		let geoFence:CLCircularRegion = CLCircularRegion(center: CLLocationCoordinate2DMake(51.0944878, 3.9121914), radius: 100, identifier: "PalletTown")
		locationManager.startMonitoring(for: geoFence)
		
	}
	
	func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
		let alert = UIAlertController(title: "Welcome", message: "You entered Pallet Town", preferredStyle: UIAlertController.Style.alert)
		alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
		self.present(alert, animated: true, completion: nil)
		print("Entered \(region)")
	}
	
	func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
		let alert = UIAlertController(title: "Goodbye", message: "You are leaving Pallet Town", preferredStyle: UIAlertController.Style.alert)
		alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
		self.present(alert, animated: true, completion: nil)
		print("Exited \(region)")
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
