//
//  PokemonView.swift
//  pokedex
//
//  Created by Mac on 9/8/17.
//  Copyright © 2017 Mac. All rights reserved.
//


import Foundation
import UIKit

class PokemonViewController:UIViewController {
    var selectedPokemonId:Int?
    var user:User?
    var pokemon:Pokemon?
    var backgroundImageView : UIImageView!
    
    
    @IBOutlet weak var shinySwitch: UISwitch!
    
    @IBOutlet weak var pokemonSprite: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    @IBOutlet weak var flavorText: UITextView!
    @IBOutlet weak var type1: UIButton!
    @IBOutlet weak var type2: UIButton!
    @IBOutlet weak var evo1: UIButton!
    @IBOutlet weak var evo2: UIButton!
    @IBOutlet weak var evo3: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        guard let pokeId = selectedPokemonId else {return print("noSelectedPokemonId")}
        evo1.tag = 0
        evo2.tag = 1
        evo3.tag = 2
        
        let thisPokemon = Pokemon(id: pokeId)
        thisPokemon.fetchDataForView() {
            DispatchQueue.main.async{
                self.pokemon = thisPokemon
                self.initView()
            }
        }
        
        Networking.getPokemonImage(callType: .Background2, forId: nil) { [unowned self] (image, err) in
            guard err == nil else {return print(err!)}
            guard let image = image else {return}
            DispatchQueue.main.async {
                self.backgroundImageView.image = image
            }
        }
    }
    
    func initView() {
        guard let pokeId = selectedPokemonId else {return print("noSelectedPokemonId")}
        var idText = String(pokeId);
        if idText.characters.count == 2 {idText = "0" + idText}
        if idText.characters.count == 1 {idText = "00" + idText}
        var basic = ""
        
        self.nameLabel.text = idText + " \(self.pokemon?.name?.capitalized ?? "")"
        basic = basic +  "\nHeight: \(self.pokemon?.height ?? 0)"
        basic = basic + "\nWeight: \(self.pokemon?.weight ?? 0)"
        basic = basic + "\n \(self.pokemon?.flavorText ?? "")"
        if let type = self.pokemon?.types {
            self.navigationController?.navigationBar.barTintColor = self.getColorForType(type: type[0])
        }
        setPokeSprite()
        setEvolutionButtons()
    }
    
    func setPokeSprite() {
        print("we here?")
        let user = Cache.shared.user
        guard let id = self.selectedPokemonId else {return print("bad id")}
        if user.favorites[id] == true {
            DispatchQueue.main.async{
                print("shiny image")
                self.pokemonSprite.image = self.pokemon?.shinyImage
            }
        } else {
            DispatchQueue.main.async{
                if let image = Cache.shared.imageHash[id] {
                    self.pokemonSprite.image = image
                }
            }
        }
    }
    
    func setTypeButtons(types:[String]) {
        guard let typeIds = self.pokemon?.typeUrlIds else {return print("failed type guard")}
        self.type1.tag = typeIds[0]
        if types.count == 1 {
            self.type2.isEnabled = false
            self.type2.isHidden = true
        } else {
            self.type2.tag = typeIds[1]
        }
    }
    
    func setAbilityButtons(types:[String]) {
        guard let abilityIds = self.pokemon?.abilityUrlIds else {return print("failed type guard")}
        self.type1.tag = abilityIds[0]
        if types.count == 1 {
            self.type2.isEnabled = false
            self.type2.isHidden = true
        } else {
            self.type2.tag = abilityIds[1]
        }
    }
    
    
    func getColorForType(type:String) -> UIColor {
        switch type {
        case "fire":
            return UIColor.orange
        case "water":
            return UIColor.blue
        case "electric":
            return UIColor.yellow
        case "grass":
            return UIColor.green
        case "rock":
            fallthrough
        case "ground":
            return UIColor.brown
        case "psychic":
            fallthrough
        case "ghost":
            return UIColor.purple
        case "fighting":
            return UIColor.red
        case "dragon":
            return UIColor.blue
        case "fairy":
            return UIColor.red
        default:
             return UIColor.gray
        }
    }
    
    func setEvolutionButtons() {
        guard let evo = self.pokemon?.evo else {return print("failed evo guard 1")}
        let count = evo.count
        let evoStrings:[String] = evo.flatMap{String($0)}
        let evoImages:[UIImage] = evoStrings.flatMap{Cache.shared.imageCache.object(forKey: $0 as NSString)}
        switch count {
        case 3:
            self.evo1.setImage(evoImages[0], for: .normal)
            self.evo2.setImage(evoImages[1], for: .normal)
            self.evo3.setImage(evoImages[2], for: .normal)
        case 2:
            self.evo3.isHidden = true
            self.evo3.isEnabled = false
            self.evo1.setImage(evoImages[0], for: .normal)
            self.evo2.setImage(evoImages[1], for: .normal)
        case 1:
            self.evo3.isHidden = true
            self.evo3.isEnabled = false
            self.evo2.isHidden = true
            self.evo2.isEnabled = false
            self.evo1.isEnabled = false
            self.evo1.setImage(evoImages[0], for: .normal)
        default:
            break
        }
    }
    
    func selectHeaderColor(type: String) {

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func evoButtonTapped(_ sender:Any) {
        guard let button = sender as? UIButton else {return}
        guard let newSelectedPokemonId = self.pokemon?.evo?[button.tag] else {return}
        DispatchQueue.main.async {
            self.selectedPokemonId = newSelectedPokemonId
            self.pokemonSprite.image = button.imageView?.image
        }
    }
    
    @IBAction func shinyTouched(_ sender: Any) {
        guard let id = selectedPokemonId else {return}
        let currentUser = Cache.shared.user
        
        if let fav = currentUser.favorites[id] {
            Cache.shared.user.favorites[id] = !fav
        } else {
            Cache.shared.user.favorites[id] = true
        }
        self.setPokeSprite()
    }
}
