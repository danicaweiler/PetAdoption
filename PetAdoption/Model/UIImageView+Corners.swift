//
//  UIImageView+Corners.swift
//  PetAdoption
//
//  Created by user182198 on 11/13/20.
//  Copyright © 2020 Conestoga. All rights reserved.
//

import UIKit

extension UIImageView {
    
        // FUNCTION : roundImageCorners
        // PARAMETERS : None
        // RETURNS : void
    public func roundImageCorners() {
        self.layer.borderWidth = 5
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.purple.cgColor
        self.layer.cornerRadius = 50
        self.clipsToBounds = true
    }

}
