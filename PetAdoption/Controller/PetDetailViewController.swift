//
//  PetDetailViewController.swift
//  PetAdoption
//  Author Maja Vrebac
//  The page shows the profile page for the pet

import UIKit

class PetDetailViewController: UIViewController {

    @IBOutlet var petDetailView: UIView!
    @IBOutlet weak var petNameLabel: UILabel!
    @IBOutlet weak var petTraitsLabel: UILabel!
    @IBOutlet weak var petDescLabel: UILabel!
    @IBOutlet weak var petImageView: UIImageView!
    
    var petSelect : Pet?

    
    // FUNCTION : viewDidLoad
    // PARAMETERS : None
    // RETURNS : void
    override func viewDidLoad() {
        super.viewDidLoad()
        
        petImageView.roundImageCorners()
        
        let year = petSelect!.age == 1 ? NSLocalizedString("results.year", comment: "") : NSLocalizedString("results.years", comment: "")
        //Get the pet information that was passed in with segue from previous view
        //let breed = NSLocalizedString("detail.breed", comment: "")
        let size = NSLocalizedString("detail.size", comment: "")
        let sex = NSLocalizedString("detail.sex", comment: "")
        let age = NSLocalizedString("detail.age", comment: "")
        let picName = petSelect?.imagename ??  "dog-icon"
        let petIconImage = UIImage(named:picName)
        
        petImageView?.image = petIconImage ?? UIImage()
        petNameLabel.text = petSelect?.name ?? "Unknown"
        petTraitsLabel.numberOfLines = 0
        petTraitsLabel.text = "\(size): \(petSelect?.size ?? "Unknown") \n\(sex): \(petSelect?.gender ?? "Unknown") \n\(age): \(String(petSelect?.age ?? 0)) \(year) "
        
        petDescLabel.text = "\(petSelect?.name ?? "Unknown") is a \(petSelect?.desc ?? "wonderful") that is looking for a loving forever home. \n\(petSelect?.name ?? "Unknown") would make a perfect addition to your family."
        
        // Handles pinches.
        petImageView.isUserInteractionEnabled = true
        let pinchGesture: UIPinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(sender: )))
        petImageView.addGestureRecognizer(pinchGesture)
    }
    
    // FUNCTION : handlePinch
    // PARAMETERS : sender
    // RETURNS : void
    // Calls this function when the pinch is recognized.
    @objc func handlePinch(sender: UIPinchGestureRecognizer) {
        guard sender.view != nil else {
            return
        }
        
        if sender.state == .began || sender.state == .changed {
            sender.view?.transform = (sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale))!
            sender.scale = 1.0
        }
    }
}
