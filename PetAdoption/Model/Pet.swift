//
//  Pet.swift
//  PetAdoption
//
//  Created by user182198 (Danica) on 9/28/20.
//  Copyright © 2020 Conestoga. All rights reserved.
//

import Foundation
import UIKit

// Class: Pet
// Base class for defining what a pet is for now
public class Pet {
    var name: String
    var breed: String?
    var age: Int
    var birthday: Date?
    var size: PetSize
    var type: PetType
    var description: String
    var gender: PetGender
    var imageName: String?
    
    init(name: String, age: Int, size: PetSize, type: PetType, description: String, gender: PetGender, breed: String?, birthday: Date?, imageName: String?) {
        self.name = name
        self.age = age
        self.size = size
        self.type = type
        self.description = description
        self.breed = breed
        self.birthday = birthday
        self.gender = gender
        self.imageName = imageName
    }
}

//Define acceptable pet types
enum PetType: Int {
    case all = -1
    case dog = 0
    case cat = 1
    case smallAnimal = 2
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
