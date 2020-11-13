//
//  ViewController.swift
//  PetAdoption
//
//  Created by user182024 (Nathan) on 9/28/20.
//  Copyright © 2020 Conestoga. All rights reserved.
//

import UIKit
import Foundation

class SearchViewController: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource {
    
    var pickerData:[String] = ["All Genders", "Male", "Female", "Other"]
    
    @IBOutlet weak var genderSelect: UIPickerView!
    @IBOutlet weak var locationSearchBar: UISearchBar!
    @IBOutlet weak var petType: UISegmentedControl!
    @IBOutlet weak var petPreviewView: UIImageView!
    
    // FUNCTION : perform
    // PARAMETERS : segue, sender
    // RETURNS : void
    // Save data to send to segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Create a new variable to store the instance of Results with PetType for filter
        let destinationVC = segue.destination as! SearchResultViewController
        destinationVC.sortBy = PetType(rawValue: petType.selectedSegmentIndex) ?? .all
        let gender = pickerData[genderSelect.selectedRow(inComponent: 0)]
        var genderSelected: PetGender = .all
        if gender == "Female" {
            genderSelected = .female
        } else if gender == "Male" {
            genderSelected = .male
        } else if gender == "Other" {
            genderSelected = .other
        }
        destinationVC.sortByGender = genderSelected
        
    }

    // FUNCTION : petTypeChanged
    // PARAMETERS : Send
    // RETURNS : Isaction
    // change photo dynamically when UISegmentedControl is changed
    @IBAction func petTypeChanged(_ sender: Any) {
        let title = petType.titleForSegment(at: petType.selectedSegmentIndex)
        
        switch title {
        case "Dogs":
            let petIconImage = UIImage(named:"buddy-1")
            petPreviewView?.image = petIconImage ?? UIImage()
        case "Cats":
            let petIconImage = UIImage(named:"casey-1")
            petPreviewView?.image = petIconImage ?? UIImage()
        case "Small Animals":
            let petIconImage = UIImage(named:"daisy-1")
            petPreviewView?.image = petIconImage ?? UIImage()
        default:
            break
        }
    }
    
    // FUNCTION : searchPet - Action
    // PARAMETERS : Sender
    // RETURNS : IsAction
    @IBAction func searchPet(_ sender: Any) {
        self.performSegue(withIdentifier: "ResultsSegue", sender: self)     
    }
    
    // FUNCTION : viewDidLoad
    // PARAMETERS : None
    // RETURNS : void
    override func viewDidLoad() {
        super.viewDidLoad()
        //Programtically handle gestures
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
    
        view.addGestureRecognizer(tap)
        
        self.genderSelect.dataSource = self
        self.genderSelect.delegate = self
        // init image holder
        let petIconImage = UIImage(named:"buddy-1")
        petPreviewView?.image = petIconImage ?? UIImage()
        
        petPreviewView.roundImageCorners()
    }
    
    // FUNCTION : dismissKeyboard
    // PARAMETERS : None
    // RETURNS : void
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
    //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
         return pickerData.count
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
}

