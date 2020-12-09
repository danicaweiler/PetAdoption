//
//  Pet+Helper.swift
//  PetAdoption
//
//  Created by user182198 (Danica) on 9/28/20.
//  Copyright © 2020 Conestoga. All rights reserved.
//

import Foundation
import UIKit

//Define acceptable pet types
enum PetType: Int, CustomStringConvertible {
    case all = -1
    case dog = 0
    case cat = 1
    case smallAnimal = 2
    
    var description : String {
      switch self {
          case .all: return "all"
          case .dog: return "dog"
          case .cat: return "cat"
          case .smallAnimal: return "smallAnimal"
      }
     }
    
}

//Define acceptable sizes
enum PetSize : CustomStringConvertible {
    case small
    case medium
    case large
    
    var description : String {
    switch self {
        case .small: return NSLocalizedString("results.small", comment: "")
        case .medium: return NSLocalizedString("results.medium", comment: "")
        case .large: return NSLocalizedString("results.large", comment: "")
    }
  }}

//Define acceptable genders
enum PetGender : CustomStringConvertible {
    case female
    case male
    case other
    case all
    
    var description : String {
     switch self {
         case .female: return NSLocalizedString("results.female", comment: "")
         case .male: return NSLocalizedString("results.male", comment: "")
         case .other: return NSLocalizedString("results.other", comment: "")
         case .all: return "all"
     }
    }
}
