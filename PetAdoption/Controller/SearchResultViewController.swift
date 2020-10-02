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
    internal var pets: [Pet] = []
    
    // FUNCTION : viewDidLoad
    // PARAMETERS : None
    // RETURNS : void
    override func viewDidLoad() {
        super.viewDidLoad()
        //Temporary hard coded pets
        pets.append(Pet(name: "Sam", age: 2, size: .medium, type: .dog, description: "Cute puppy", breed: "Cockapoo", birthday: Date(timeIntervalSince1970: 1506653497)))
        
        pets.append(Pet(name: "Buddy", age: 3, size: .large, type: .dog, description: "Cute doggo", breed: "Golden Retriever", birthday: Date(timeIntervalSince1970: 1506653497)))
        
        resultTableView.delegate = self
        resultTableView.dataSource = self
        
        //Make sure height adjusts proper for contents
        resultTableView.estimatedRowHeight = 175
        resultTableView.rowHeight = UITableView.automaticDimension
    }
    
    // FUNCTION : updateUI
    // DESCRIPTION : Set the table cell labels, according to the pet
    // PARAMETERS : None
    // RETURNS : void
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pets.count
    }
    
    // FUNCTION : tableView
    // DESCRIPTION : assign the pet to the tableview cell
    // PARAMETERS :
    //  tableView: UITableView - table view cell is in
    //  cellForRowAt indexPath: IndexPath - index of cell
    // RETURNS : UITableViewCell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "petCell", for: indexPath as IndexPath) as! PetTableViewCell
        
        cell.pet = pets[indexPath.row]
        return cell
    }
}
