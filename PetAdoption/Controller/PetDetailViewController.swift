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
    
    var petSelect : Pet?

    
    // FUNCTION : viewDidLoad
    // PARAMETERS : None
    // RETURNS : void
    override func viewDidLoad() {
        super.viewDidLoad()
        let year = petSelect!.age == 1 ? NSLocalizedString("results.year", comment: "") : NSLocalizedString("results.years", comment: "")
        //Get the pet information that was passed in with segue from previous view
        let breed = NSLocalizedString("detail.breed", comment: "")
        let size = NSLocalizedString("detail.size", comment: "")
        let sex = NSLocalizedString("detail.sex", comment: "")
        let age = NSLocalizedString("detail.age", comment: "")
        let picName = petSelect?.imageName ??  "dog-icon"
        let petIconImage = UIImage(named:picName)
        
        petImageView?.image = petIconImage ?? UIImage()
        petNameLabel.text = petSelect?.name ?? "Unknown"
        petTraitsLabel.numberOfLines = 0
        petTraitsLabel.text = "\(breed): \(petSelect?.breed ?? "") \n\(size): \(petSelect?.size.description ?? "Unknown") \n\(sex): \(petSelect?.gender.description ?? "Unknown") | \(age): \(String(petSelect?.age ?? 0)) \(year) "
        
        petDescLabel.text = "\(petSelect?.name ?? "Unknown") is a \(petSelect?.description ?? "wonderful") that is looking for a loving forever home. \n\(petSelect?.name ?? "Unknown") would make a perfect addition to your family."
        
    }
}
