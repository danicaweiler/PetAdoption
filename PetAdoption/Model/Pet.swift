//
//  Pet.swift
//  PetAdoption
//
//  Created by user182198 on 9/28/20.
//  Copyright © 2020 Conestoga. All rights reserved.
//

import Foundation
import UIKit

public class Pet {
    var name: String
    var breed: String?
    var age: Int
    var birthday: Date?
    var size: PetSize
    var type: PetType
    var description: String
    
    init(name: String, age: Int, size: PetSize, type: PetType, description: String, breed: String?, birthday: Date?) {
        self.name = name
        self.age = age
        self.size = size
        self.type = type
        self.description = description
        self.breed = breed
        self.birthday = birthday
    }
}

enum PetType {
    case dog
    case cat
    case smallAnimal
}

enum PetSize {
    case small
    case medium
    case large
}