//
//  PetDetailViewController.swift
//  PetAdoption
//  Author Maja Vrebac
//  The page shows the profile page for the pet

import UIKit

class PetDetailViewController: UIViewController {

    @IBOutlet var petDetailView: UIView!
    @IBOutlet weak var petImageView: UIImageView!
    @IBOutlet weak var petNameLabel: UILabel!
    @IBOutlet weak var petTraitsLabel: UILabel!
    @IBOutlet weak var petDescLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Temp hardcoded pet information 
        let petIconImage = UIImage(named:"dog-icon")
             petImageView?.image = petIconImage ?? UIImage()
        petNameLabel.text = "Hi my name is Buddy!"
        petTraitsLabel.text = "Male | Age: 3 | Breed: Pomeranian"
        petDescLabel.text = "Buddy is very playful and loves to chase his ball. He also loves to cuddle"
        
        
    }
}
