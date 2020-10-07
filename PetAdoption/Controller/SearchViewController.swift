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
    
    @IBAction func searchPet(_ sender: Any) {
         let secondViewController: SearchResultViewController = SearchResultViewController()

        self.present(secondViewController, animated: true, completion: nil)    }
    
    @IBAction func dismissKeyboard(_ sender: Any) {
        locationSearchBar.resignFirstResponder()
    }
    
    // FUNCTION : viewDidLoad
    // PARAMETERS : None
    // RETURNS : void
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // temporary image holder
        let petIconImage = UIImage(named:"dog-icon")
                     petPreviewView?.image = petIconImage ?? UIImage()
    }
}
