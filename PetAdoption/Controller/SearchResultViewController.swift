//
//  SearchResultViewController.swift
//  PetAdoption
//
//  Created by user182198 (Danica) on 9/28/20.
//  Copyright © 2020 Conestoga. All rights reserved.
//

import UIKit

class SearchResultViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var resultTableView: UITableView!
    
    //Array of pets for table
    internal var allPets: [Pet] = [
        Pet(name: "Sam", age: 2, size: .medium, type: .dog, description: "Cute puppy", gender: .female, breed: "Cockapoo", birthday: Date(timeIntervalSince1970: 1506653497), imageName: "sam-1"),
        Pet(name: "Buddy", age: 3, size: .large, type: .dog, description: "Cute doggo", gender: .male, breed: "Golden Retriever", birthday: Date(timeIntervalSince1970: 1506653497), imageName: "buddy-1"),
        Pet(name: "Casey", age: 3, size: .small, type: .cat, description: "Cute kitty", gender: .male, breed: "Calico", birthday: Date(timeIntervalSince1970: 1506653497), imageName: "casey-1"),
        Pet(name: "Macey", age: 2, size: .medium, type: .cat, description: "Cute cat", gender: .female, breed: "Maincoon", birthday: Date(timeIntervalSince1970: 1506653497), imageName: "macey-1"),
        Pet(name: "Brownie", age: 1, size: .small, type: .smallAnimal, description: "Cute hamster", gender: .male, breed: "Hamster", birthday: Date(timeIntervalSince1970: 1506653497), imageName: "brownie-1"),
        Pet(name: "Daisy", age: 2, size: .small, type: .smallAnimal, description: "Cute guinea pig", gender: .other, breed: "Guinea pig", birthday: Date(timeIntervalSince1970: 1506653497), imageName: "daisy-1")
    ]
    
    internal var filterPets: [Pet] = []
    public var sortBy: PetType = .all
    public var sortByGender = PetGender.all
    
    // FUNCTION : prepare
    // PARAMETERS : segue, sender
    // RETURNS : void
    // Prepare data for next segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextScene =  segue.destination as! PetDetailViewController
        
        let indexPath = self.resultTableView.indexPathForSelectedRow
        nextScene.petSelect = filterPets[indexPath!.row]
        
    }
    
    
    // FUNCTION : viewDidLoad
    // PARAMETERS : None
    // RETURNS : void
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultTableView.delegate = self
        resultTableView.dataSource = self
        
        //Make sure height adjusts proper for contents
        resultTableView.estimatedRowHeight = 175
        resultTableView.rowHeight = UITableView.automaticDimension
        
        if sortBy != .all {
            filterPets = allPets.filter { pet in
                return pet.type == sortBy
            }
        } else {
            filterPets = allPets
        }
        
        if sortByGender != .all {
            filterPets = filterPets.filter { pet in
                return pet.gender == sortByGender
            }
            
        }
    }
    
    // FUNCTION : updateUI
    // DESCRIPTION : Set the table cell labels, according to the pet
    // PARAMETERS : None
    // RETURNS : void
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterPets.count
    }
    
    // FUNCTION : tableView
    // DESCRIPTION : assign the pet to the tableview cell
    // PARAMETERS :
    //  tableView: UITableView - table view cell is in
    //  cellForRowAt indexPath: IndexPath - index of cell
    // RETURNS : UITableViewCell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "petCell", for: indexPath as IndexPath) as! PetTableViewCell
        
        cell.pet = filterPets[indexPath.row]
        return cell
    }
}
