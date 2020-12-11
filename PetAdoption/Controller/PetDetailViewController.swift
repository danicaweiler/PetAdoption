//
//  PetDetailViewController.swift
//  PetAdoption
//  Author Maja Vrebac
//  The page shows the profile page for the pet

import UIKit

class PetDetailViewController: UIViewController, UIContextMenuInteractionDelegate {
    
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
        
        let interaction = UIContextMenuInteraction(delegate: self)
        petImageView.addInteraction(interaction)
        petImageView.isUserInteractionEnabled = true
        
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
    // FUNCTION : contextMenuInteraction
    // DESC: Links context menu
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
       return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ -> UIMenu? in
           return self.createContextMenu()
       }
    }
    // FUNCTION : createContextMenu
    // PARAMETERS : None
    // RETURNS : void
    // When a picture is tapped for a longer period of time, a context menu pops up so we can share, copy or save
    func createContextMenu() -> UIMenu {
        let shareAction = UIAction(title: "Share", image: UIImage(systemName: "square.and.arrow.up")) { _ in
            print("Share")
        }
        
        let copy = UIAction(title: "Copy", image: UIImage(systemName: "doc.on.doc")) { _ in
            print("Copy")
        }
        
        let saveToPhotos = UIAction(title: "Add To Photos", image: UIImage(systemName: "photo")) { _ in
            print("Save to Photos")
        }
        
        return UIMenu(title: "", children: [shareAction, copy, saveToPhotos])
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
