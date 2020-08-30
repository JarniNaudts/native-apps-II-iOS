//
//  PokemonDetailTableViewController.swift
//  Pokedex
//
//  Created by Jarni Naudts on 06/08/2020.
//  Copyright © 2020 Jarni Naudts. All rights reserved.
//

import UIKit

class PokemonDetailTableViewController: UITableViewController {
	
	@IBOutlet var typeLabel1: UILabel!
	@IBOutlet var typeLabel2: UILabel!
	
	@IBOutlet var heightLabel: UILabel!
	@IBOutlet var weightLabel: UILabel!
	
	@IBOutlet var spriteLabel1: UILabel!
	@IBOutlet var spriteFrontImage1: UIImageView!
	@IBOutlet var spriteBackImage1: UIImageView!
	
	@IBOutlet var spriteTableViewCell2: UITableViewCell!
	@IBOutlet var spriteLabel2: UILabel!
	@IBOutlet var spriteFrontImage2: UIImageView!
	@IBOutlet var spriteBackImage2: UIImageView!
	
	@IBOutlet var shinySpriteLabel1: UILabel!
	@IBOutlet var shinySpriteFrontImage1: UIImageView!
	@IBOutlet var shinySpriteBackImage1: UIImageView!
	
	@IBOutlet var shinySpriteTableViewCell2: UITableViewCell!
	@IBOutlet var shinySpriteLabel2: UILabel!
	@IBOutlet var shinySpriteFrontImage2: UIImageView!
	@IBOutlet var shinySpriteBackImage2: UIImageView!
	
	@IBOutlet var hpLabel: UILabel!
	@IBOutlet var hpProgressView: UIProgressView!
	
	@IBOutlet var attackLabel: UILabel!
	@IBOutlet var attackProgressView: UIProgressView!
	
	@IBOutlet var defenceLabel: UILabel!
	@IBOutlet var defenceProgressView: UIProgressView!
	
	@IBOutlet var spAtkLabel: UILabel!
	@IBOutlet var spAtkProgressView: UIProgressView!
	
	@IBOutlet var spDefLabel: UILabel!
	@IBOutlet var spDefProgressView: UIProgressView!
	
	@IBOutlet var speedLabel: UILabel!
	@IBOutlet var speedProgressView: UIProgressView!
	
	@IBOutlet var addToPartyButton: UIButton!
	
	let defaultSpriteIndexPath = IndexPath(row: 0, section: 1)
	let femaleSpriteIndexPath = IndexPath(row: 1, section: 1)
	let shinySpriteIndexPath = IndexPath(row: 2, section: 1)
	let shinyFemaleSpriteIndexPath = IndexPath(row: 3, section: 1)
	
	let normalCellHeight: CGFloat = 44
	let spriteCellHeight: CGFloat = 100
	
	let normalColor = UIColor(red: 189.0/255.0, green: 189.0/255.0, blue: 175.0/255.0, alpha: 1.0)
	let grassColor = UIColor(red: 141.0/255.0, green: 216.0/255.0, blue: 81.0/255.0, alpha: 1.0)
	let fireColor = UIColor(red: 250.0/255.0, green: 86.0/255.0, blue: 67.0/255.0, alpha: 1.0)
	let waterColor = UIColor(red: 86.0/255.0, green: 174.0/255.0, blue: 255.0/255.0, alpha: 1.0)
	let fightingColor = UIColor(red: 168.0/255.0, green: 86.0/255.0, blue: 68.0/255.0, alpha: 1.0)
	let flyingColor = UIColor(red: 121.0/255.0, green: 164.0/255.0, blue: 255.0/255.0, alpha: 1.0)
	let poisonColor = UIColor(red: 171.0/255.0, green: 93.0/255.0, blue: 162.0/255.0, alpha: 1.0)
	let groundColor = UIColor(red: 235.0/255.0, green: 202.0/255.0, blue: 87.0/255.0, alpha: 1.0)
	let rockColor = UIColor(red: 206.0/255.0, green: 189.0/255.0, blue: 114.0/255.0, alpha: 1.0)
	let bugColor = UIColor(red: 194.0/255.0, green: 210.0/255.0, blue: 31.0/255.0, alpha: 1.0)
	let ghostColor = UIColor(red: 121.0/255.0, green: 117.0/255.0, blue: 215.0/255.0, alpha: 1.0)
	let electricColor = UIColor(red: 253.0/255.0, green: 229.0/255.0, blue: 60.0/255.0, alpha: 1.0)
	let psychicColor = UIColor(red: 250.0/255.0, green: 100.0/255.0, blue: 180.0/255.0, alpha: 1.0)
	let iceColor = UIColor(red: 150.0/255.0, green: 241.0/255.0, blue: 255.0/255.0, alpha: 1.0)
	let dragonColor = UIColor(red: 138.0/255.0, green: 117.0/255.0, blue: 255.0/255.0, alpha: 1.0)
	let darkColor = UIColor(red: 142.0/255.0, green: 105.0/255.0, blue: 86.0/255.0, alpha: 1.0)
	let steelColor = UIColor(red: 196.0/255.0, green: 194.0/255.0, blue: 219.0/255.0, alpha: 1.0)
	let fairyColor = UIColor(red: 250.0/255.0, green: 173.0/255.0, blue: 255.0/255.0, alpha: 1.0)
	
	var isGenderDifference = false
	
	var pokemon: Pokemon!
	var pokemonInParty = [Pokemon]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		title = pokemon.name
		
		if let savedPokemon = Pokemon.loadPokemonInParty(){
			pokemonInParty = savedPokemon
		}
		
		PokedexController.shared.fetchPokemonDetails(forPokemon: pokemon.name){
			(pokemon) in
			if let pokemon = pokemon{
				self.updateUI(with: pokemon)
			}
		}
		
		// Uncomment the following line to preserve selection between presentations
		// self.clearsSelectionOnViewWillAppear = false
		
		// Uncomment the following line to display an Edit button in the navigation bar for this view controller.
		// self.navigationItem.rightBarButtonItem = self.editButtonItem
	}
	
	func updateUI(with pokemon: Pokemon){
		DispatchQueue.main.async {
			self.pokemon = pokemon

			self.heightLabel.text = String(format: "Height: %.2f m", Double(pokemon.height!)/10.0)
			self.weightLabel.text = String(format: "Weight: %.2f kg", Double(pokemon.weight!)/10.0)
			
			self.updateTypes()
			self.updateSpriteLabels()
			self.updateStats()
			self.updateDefaultSprites()
			self.updateFemaleSprites()
			self.updateShinySprites()
			self.updateShinyFemaleSpites()
			self.updateAddToPartyButton()
		}
	}
	
	func updateSpriteLabels(){
		if pokemon.sprites?.backFemale == nil{
			self.spriteLabel1.text = "Default"
			self.shinySpriteLabel1.text = "Shiny"
			isGenderDifference = true
			tableView.beginUpdates()
			tableView.endUpdates()
		}
	}
	
	func updateDefaultSprites(){
		if let spriteFront = pokemon.sprites?.frontDefault, let spriteBack = pokemon.sprites?.backDefault{
			PokedexController.shared.fetchImage(url: spriteFront){
				(image) in guard let image = image else {return}
				DispatchQueue.main.async {
					self.spriteFrontImage1.image = image
				}
			}
			PokedexController.shared.fetchImage(url: spriteBack){
				(image) in guard let image = image else {return}
				DispatchQueue.main.async {
					self.spriteBackImage1.image = image
				}
			}
		}
	}
	
	func updateFemaleSprites(){
		if let spriteFront = pokemon.sprites?.frontFemale, let spriteBack = pokemon.sprites?.backFemale{
			PokedexController.shared.fetchImage(url: spriteFront){
				(image) in guard let image = image else {return}
				DispatchQueue.main.async {
					self.spriteFrontImage2.image = image
				}
			}
			PokedexController.shared.fetchImage(url: spriteBack){
				(image) in guard let image = image else {return}
				DispatchQueue.main.async {
					self.spriteBackImage2.image = image
				}
			}
		}
	}
	
	func updateShinySprites(){
		if let spriteFront = pokemon.sprites?.frontShiny, let spriteBack = pokemon.sprites?.backShiny{
			PokedexController.shared.fetchImage(url: spriteFront){
				(image) in guard let image = image else {return}
				DispatchQueue.main.async {
					self.shinySpriteFrontImage1.image = image
				}
			}
			PokedexController.shared.fetchImage(url: spriteBack){
				(image) in guard let image = image else {return}
				DispatchQueue.main.async {
					self.shinySpriteBackImage1.image = image
				}
			}
		}
	}
	
	func updateShinyFemaleSpites(){
		if let spriteFront = pokemon.sprites?.frontShinyFemale, let spriteBack = pokemon.sprites?.backShinyFemale{
			PokedexController.shared.fetchImage(url: spriteFront){
				(image) in guard let image = image else {return}
				DispatchQueue.main.async {
					self.shinySpriteFrontImage2.image = image
				}
			}
			PokedexController.shared.fetchImage(url: spriteBack){
				(image) in guard let image = image else {return}
				DispatchQueue.main.async {
					self.shinySpriteBackImage2.image = image
				}
			}
		}
	}
	
	func updateTypes(){
		if let types = pokemon.types {
			self.typeLabel1.text = types[0].type.name
			switch types[0].type.name {
				case "normal":
					self.typeLabel1.backgroundColor = normalColor
					break
				case "grass":
					self.typeLabel1.backgroundColor = grassColor
					break
				case "fire":
					self.typeLabel1.backgroundColor = fireColor
					break
				case "water":
					self.typeLabel1.backgroundColor = waterColor
					break
				case "fighting":
					self.typeLabel1.backgroundColor = fightingColor
					break
				case "flying":
					self.typeLabel1.backgroundColor = flyingColor
					break
				case "poison":
					self.typeLabel1.backgroundColor = poisonColor
					break
				case "ground":
					self.typeLabel1.backgroundColor = groundColor
					break
				case "rock":
					self.typeLabel1.backgroundColor = rockColor
					break
				case "bug":
					self.typeLabel1.backgroundColor = bugColor
					break
				case "ghost":
					self.typeLabel1.backgroundColor = ghostColor
					break
				case "electric":
					self.typeLabel1.backgroundColor = electricColor
					break
				case "psychic":
					self.typeLabel1.backgroundColor = psychicColor
					break
				case "ice":
					self.typeLabel1.backgroundColor = iceColor
					break
				case "dragon":
					self.typeLabel1.backgroundColor = dragonColor
					break
				case "dark":
					self.typeLabel1.backgroundColor = darkColor
					break
				case "steel":
					self.typeLabel1.backgroundColor = steelColor
					break
				case "fairy":
					self.typeLabel1.backgroundColor = fairyColor
					break
				default:
					return
			}
			guard types.count > 1 else {
				self.typeLabel2.isHidden = true
				return
			}
			self.typeLabel2.text = types[1].type.name
			switch types[1].type.name {
				case "normal":
					self.typeLabel2.backgroundColor = normalColor
					break
				case "grass":
					self.typeLabel2.backgroundColor = grassColor
					break
				case "fire":
					self.typeLabel2.backgroundColor = fireColor
					break
				case "water":
					self.typeLabel2.backgroundColor = waterColor
					break
				case "fighting":
					self.typeLabel2.backgroundColor = fightingColor
					break
				case "flying":
					self.typeLabel2.backgroundColor = flyingColor
					break
				case "poison":
					self.typeLabel2.backgroundColor = poisonColor
					break
				case "ground":
					self.typeLabel2.backgroundColor = groundColor
					break
				case "rock":
					self.typeLabel2.backgroundColor = rockColor
					break
				case "bug":
					self.typeLabel2.backgroundColor = bugColor
					break
				case "ghost":
					self.typeLabel2.backgroundColor = ghostColor
					break
				case "electric":
					self.typeLabel2.backgroundColor = electricColor
					break
				case "psychic":
					self.typeLabel2.backgroundColor = psychicColor
					break
				case "ice":
					self.typeLabel2.backgroundColor = iceColor
					break
				case "dragon":
					self.typeLabel2.backgroundColor = dragonColor
					break
				case "dark":
					self.typeLabel2.backgroundColor = darkColor
					break
				case "steel":
					self.typeLabel2.backgroundColor = steelColor
					break
				case "fairy":
					self.typeLabel2.backgroundColor = fairyColor
					break
				default:
					return
			}
		}
	}
	
	func updateStats(){
		if let stats = pokemon.stats{
			self.hpLabel.text = "Hp: \(stats[0].baseStat)"
			self.hpProgressView.progress = Float(stats[0].baseStat)/160.0
			self.attackLabel.text = "Attack: \(stats[1].baseStat)"
			self.attackProgressView.progress = Float(stats[1].baseStat)/160.0
			self.defenceLabel.text = "Defence: \(stats[2].baseStat)"
			self.defenceProgressView.progress = Float(stats[2].baseStat)/160.0
			self.spAtkLabel.text = "Sp. Atk: \(stats[3].baseStat)"
			self.spAtkProgressView.progress = Float(stats[3].baseStat)/160.0
			self.spDefLabel.text = "Sp. Def: \(stats[4].baseStat)"
			self.spDefProgressView.progress = Float(stats[4].baseStat)/160.0
			self.speedLabel.text = "Speed: \(stats[5].baseStat)"
			self.speedProgressView.progress = Float(stats[5].baseStat)/160.0
		}
	}
	
	func updateAddToPartyButton(){
		if pokemonInParty.contains(where: {p in p.name == pokemon.name}){
			addToPartyButton.isEnabled = false
			addToPartyButton.setTitle("Pokemon Already Added To Party", for: .disabled)
		} else if(pokemonInParty.count >= 6){
			addToPartyButton.isEnabled = false
			addToPartyButton.setTitle("Party Is Full", for: .disabled)
		} else{
			addToPartyButton.isEnabled = true
			addToPartyButton.setTitle("Add Pokemon To Party", for: .normal)
		}
	}
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
		switch indexPath {
		case defaultSpriteIndexPath,
			 shinySpriteIndexPath:
			return spriteCellHeight
		case femaleSpriteIndexPath, shinyFemaleSpriteIndexPath:
			return isGenderDifference ? 0 : spriteCellHeight
		default:
			return normalCellHeight
		}
	}
	
	@IBAction func addPokemonToPartyButtonTouched(_ sender: UIButton) {
		if pokemonInParty.count < 6 || !pokemonInParty.contains(where: {p in p.name == pokemon.name}){
			PokedexController.shared.addPokemonToParty(pokemon: pokemon)
			pokemonInParty.append(pokemon)
		}
		self.updateAddToPartyButton()
	}
	
}
