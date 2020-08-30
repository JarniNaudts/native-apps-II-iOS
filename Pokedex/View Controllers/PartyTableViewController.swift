//
//  PartyTableViewController.swift
//  Pokedex
//
//  Created by Jarni Naudts on 30/08/2020.
//  Copyright © 2020 Jarni Naudts. All rights reserved.
//

import UIKit

class PartyTableViewController: UITableViewController {
	
	@IBOutlet var partySlot1Label: UILabel!
	@IBOutlet var partySlot1SpriteFrontImage: UIImageView!
	@IBOutlet var partySlot1SpriteBackImage: UIImageView!
	
	@IBOutlet var partySlot2Label: UILabel!
	@IBOutlet var partySlot2SpriteFrontImage: UIImageView!
	@IBOutlet var partySlot2SpriteBackImage: UIImageView!
	
	@IBOutlet var partySlot3Label: UILabel!
	@IBOutlet var partySlot3SpriteFrontImage: UIImageView!
	@IBOutlet var partySlot3SpriteBackImage: UIImageView!
	
	@IBOutlet var partySlot4Label: UILabel!
	@IBOutlet var partySlot4SpriteFrontImage: UIImageView!
	@IBOutlet var partySlot4SpriteBackImage: UIImageView!
	
	@IBOutlet var partySlot5Label: UILabel!
	@IBOutlet var partySlot5SpriteFrontImage: UIImageView!
	@IBOutlet var partySlot5SpriteBackImage: UIImageView!
	
	@IBOutlet var partySlot6Label: UILabel!
	@IBOutlet var partySlot6SpriteFrontImage: UIImageView!
	@IBOutlet var partySlot6SpriteBackImage: UIImageView!
	
	var pokemonInParty = [Pokemon]()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		navigationItem.leftBarButtonItem = editButtonItem
		NotificationCenter.default.addObserver(self, selector: #selector(self.updateUI), name: PokedexController.partyUpdateNotification, object: nil)
		self.updateUI()
    }

	@objc func updateUI(){
		if let partyFromStorage = PokedexController.loadPokemonInParty(){
			self.pokemonInParty = partyFromStorage
		}
		DispatchQueue.main.async {
			self.updatePartySlot1()
			self.updatePartySlot2()
			self.updatePartySlot3()
			self.updatePartySlot4()
			self.updatePartySlot5()
			self.updatePartySlot6()
		}
	}
	
	func updatePartySlot1(){
		if pokemonInParty.indices.contains(0){
			partySlot1Label.text = pokemonInParty[0].name
			if let spriteFront = pokemonInParty[0].sprites?.frontDefault, let spriteBack = pokemonInParty[0].sprites?.backDefault{
				PokedexController.shared.fetchImage(url: spriteFront){
					(image) in guard let image = image else {return}
					DispatchQueue.main.async {
						self.partySlot1SpriteFrontImage.image = image
					}
				}
				PokedexController.shared.fetchImage(url: spriteBack){
					(image) in guard let image = image else {return}
					DispatchQueue.main.async {
						self.partySlot1SpriteBackImage.image = image
					}
				}
			}
		}else{
			partySlot1Label.text = "Empty Slot"
			partySlot1SpriteFrontImage.image = nil
			partySlot1SpriteBackImage.image = nil
		}
	}
	
	func updatePartySlot2(){
		if pokemonInParty.indices.contains(1){
			partySlot2Label.text = pokemonInParty[1].name
			if let spriteFront = pokemonInParty[1].sprites?.frontDefault, let spriteBack = pokemonInParty[1].sprites?.backDefault{
				PokedexController.shared.fetchImage(url: spriteFront){
					(image) in guard let image = image else {return}
					DispatchQueue.main.async {
						self.partySlot2SpriteFrontImage.image = image
					}
				}
				PokedexController.shared.fetchImage(url: spriteBack){
					(image) in guard let image = image else {return}
					DispatchQueue.main.async {
						self.partySlot2SpriteBackImage.image = image
					}
				}
			}
		}else{
			partySlot2Label.text = "Empty Slot"
			partySlot2SpriteFrontImage.image = nil
			partySlot2SpriteBackImage.image = nil
		}
	}
	
	func updatePartySlot3(){
		if pokemonInParty.indices.contains(2){
			partySlot3Label.text = pokemonInParty[2].name
			if let spriteFront = pokemonInParty[2].sprites?.frontDefault, let spriteBack = pokemonInParty[2].sprites?.backDefault{
				PokedexController.shared.fetchImage(url: spriteFront){
					(image) in guard let image = image else {return}
					DispatchQueue.main.async {
						self.partySlot3SpriteFrontImage.image = image
					}
				}
				PokedexController.shared.fetchImage(url: spriteBack){
					(image) in guard let image = image else {return}
					DispatchQueue.main.async {
						self.partySlot3SpriteBackImage.image = image
					}
				}
			}
		}else{
			partySlot3Label.text = "Empty Slot"
			partySlot3SpriteFrontImage.image = nil
			partySlot3SpriteBackImage.image = nil
		}
	}
	
	func updatePartySlot4(){
		if pokemonInParty.indices.contains(3){
			partySlot4Label.text = pokemonInParty[3].name
			if let spriteFront = pokemonInParty[3].sprites?.frontDefault, let spriteBack = pokemonInParty[3].sprites?.backDefault{
				PokedexController.shared.fetchImage(url: spriteFront){
					(image) in guard let image = image else {return}
					DispatchQueue.main.async {
						self.partySlot4SpriteFrontImage.image = image
					}
				}
				PokedexController.shared.fetchImage(url: spriteBack){
					(image) in guard let image = image else {return}
					DispatchQueue.main.async {
						self.partySlot4SpriteBackImage.image = image
					}
				}
			}
		}else{
			partySlot4Label.text = "Empty Slot"
			partySlot4SpriteFrontImage.image = nil
			partySlot4SpriteBackImage.image = nil
		}
	}
	
	func updatePartySlot5(){
		if pokemonInParty.indices.contains(4){
			partySlot5Label.text = pokemonInParty[4].name
			if let spriteFront = pokemonInParty[4].sprites?.frontDefault, let spriteBack = pokemonInParty[4].sprites?.backDefault{
				PokedexController.shared.fetchImage(url: spriteFront){
					(image) in guard let image = image else {return}
					DispatchQueue.main.async {
						self.partySlot5SpriteFrontImage.image = image
					}
				}
				PokedexController.shared.fetchImage(url: spriteBack){
					(image) in guard let image = image else {return}
					DispatchQueue.main.async {
						self.partySlot5SpriteBackImage.image = image
					}
				}
			}
		}else{
			partySlot5Label.text = "Empty Slot"
			partySlot5SpriteFrontImage.image = nil
			partySlot5SpriteBackImage.image = nil
		}
	}
	
	func updatePartySlot6(){
		if pokemonInParty.indices.contains(5){
			partySlot6Label.text = pokemonInParty[5].name
			if let spriteFront = pokemonInParty[5].sprites?.frontDefault, let spriteBack = pokemonInParty[5].sprites?.backDefault{
				PokedexController.shared.fetchImage(url: spriteFront){
					(image) in guard let image = image else {return}
					DispatchQueue.main.async {
						self.partySlot6SpriteFrontImage.image = image
					}
				}
				PokedexController.shared.fetchImage(url: spriteBack){
					(image) in guard let image = image else {return}
					DispatchQueue.main.async {
						self.partySlot6SpriteBackImage.image = image
					}
				}
			}
		}else{
			partySlot6Label.text = "Empty Slot"
			partySlot6SpriteFrontImage.image = nil
			partySlot6SpriteBackImage.image = nil
		}
	}
	
	override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		return pokemonInParty.indices.contains(indexPath.row)
	}
	
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			pokemonInParty.remove(at: indexPath.row)
			PokedexController.savePokemonInParty(pokemonInParty)
		}
	}
}
