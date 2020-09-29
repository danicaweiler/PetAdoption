//
//  SearchResultViewController.swift
//  PetAdoption
//
//  Created by user182198 on 9/28/20.
//  Copyright © 2020 Conestoga. All rights reserved.
//

import UIKit

class SearchResultViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var resultTableView: UITableView!
    
    internal var pets: [Pet] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pets.append(Pet(name: "Amigo", age: 2, size: .medium, type: .dog, description: "Cute puppy", breed: "Cockapoo", birthday: Date(timeIntervalSince1970: 1506653497)))
        
        pets.append(Pet(name: "Buddy", age: 3, size: .large, type: .dog, description: "Cute doggo", breed: "Golden Retriever", birthday: Date(timeIntervalSince1970: 1506653497)))
        
        resultTableView.delegate = self
        resultTableView.dataSource = self
        
        resultTableView.estimatedRowHeight = 175
        resultTableView.rowHeight = UITableView.automaticDimension
    }
    
    //Populate tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "petCell", for: indexPath as IndexPath) as! PetTableViewCell
        
        cell.pet = pets[indexPath.row]
        return cell
    }}
