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
    var store: PetStore!
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
    
    private func updateData() {
        store.fetchAllPets {
            (petResults) in
            switch petResults {
            case let .success(pets):
                if pets.count == 0 {
                    self.store.getAllPets { (petsResult)->Void in
                        self.updateData()
                    }
                }
                
                if self.sortBy != .all {
                    self.filterPets = pets.filter { inPet in
                        return inPet.type == self.sortBy.description
                    }
                } else {
                    self.filterPets = pets
                }
                        
                if self.sortByGender != .all {
                    self.filterPets = self.filterPets.filter { inPet in
                        return inPet.gender == self.sortByGender.description
                    }
                }
            case .failure:
                self.filterPets.removeAll()
            }
        
            self.resultTableView.reloadData()
        }
    }
    
    // FUNCTION : viewDidLoad
    // PARAMETERS : None
    // RETURNS : void
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultTableView.delegate = self
        resultTableView.dataSource = self
        store = PetStore()
        //Now that we have a store, get the data
        updateData()
        //Make sure height adjusts proper for contents
        resultTableView.estimatedRowHeight = 175
        resultTableView.rowHeight = UITableView.automaticDimension
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
