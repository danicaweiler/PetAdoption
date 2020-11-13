//
//  ViewController.swift
//  PetAdoption
//
//  Created by user182024 (Nathan) on 9/28/20.
//  Copyright © 2020 Conestoga. All rights reserved.
//

import UIKit
import Foundation

class SearchViewController: UIViewController {

    @IBOutlet weak var locationSearchBar: UISearchBar!
    @IBOutlet weak var petType: UISegmentedControl!
    @IBOutlet weak var petPreviewView: UIImageView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Create a new variable to store the instance of Results with PetType for filter
        let destinationVC = segue.destination as! SearchResultViewController
        destinationVC.sortBy = PetType(rawValue: petType.selectedSegmentIndex) ?? .all
    }

    // change photo dynamically when UISegmentedControl is changed
    @IBAction func petTypeChanged(_ sender: Any) {
        let title = petType.titleForSegment(at: petType.selectedSegmentIndex)
        
        switch title {
        case "Dogs":
            let petIconImage = UIImage(named:"buddy-1")
                         petPreviewView?.image = petIconImage ?? UIImage()
            break
        case "Cats":
            let petIconImage = UIImage(named:"casey-1")
                         petPreviewView?.image = petIconImage ?? UIImage()
            break
        case "Small Animals":
            let petIconImage = UIImage(named:"daisy-1")
                         petPreviewView?.image = petIconImage ?? UIImage()
            break
        default:
            break;
        }
    }
    
    @IBAction func searchPet(_ sender: Any) {
        self.performSegue(withIdentifier: "ResultsSegue", sender: self)        
    }
    
    @IBAction func dismissKeyboard(_ sender: Any) {
        locationSearchBar.resignFirstResponder()
    }
    
    // FUNCTION : viewDidLoad
    // PARAMETERS : None
    // RETURNS : void
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // temporary image holder
        let petIconImage = UIImage(named:"buddy-1")
                     petPreviewView?.image = petIconImage ?? UIImage()
    }
}
