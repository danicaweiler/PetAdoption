//
//  PetTableViewCell.swift
//  PetAdoption
//
//  Created by user182198 (Danica) on 9/29/20.
//  Copyright © 2020 Conestoga. All rights reserved.
//

import UIKit

public class PetTableViewCell: UITableViewCell {
    
    @IBOutlet weak var petImage: UIImageView!
    @IBOutlet weak var petNameLabel: UILabel!
    @IBOutlet weak var PetDetailLabel: UILabel!
  
    var pet: Pet? {
        didSet {
            self.updateUI()
        }
    }
    
    private func updateUI() {
        let petIconImage = UIImage(named:"dog-icon")
        petImage?.image = petIconImage ?? UIImage()
        petNameLabel?.text = pet?.name
        
        let size: String
        switch pet?.size {
        case .large:
            size = "Large"
        case .medium:
            size = "Medium"
        default:
            size = "Small"
        }
    
        let year = pet!.age > 0 ? "years" : "year"
        PetDetailLabel?.text = "\(size) | \(String(pet?.age ?? 0)) \(year) old |  \(pet?.breed ?? "")"
    }
}
