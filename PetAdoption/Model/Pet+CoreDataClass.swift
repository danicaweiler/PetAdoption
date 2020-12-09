//
//  Pet+CoreDataClass.swift
//  PetAdoption
//
//  Created by user182198 on 12/8/20.
//  Copyright © 2020 Conestoga. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Pet)
public class Pet: NSManagedObject {
    
    convenience init(name: String?, desc: String?, size: String?, type: String?, gender: String?, imageName: String?, age: Int64?, birthday: Int64?, context: NSManagedObjectContext) {
        
        let entity = NSEntityDescription.entity(forEntityName: "Pet", in: context)
        self.init(entity: entity!, insertInto: context)
        
        self.name = name
        self.desc = desc
        self.size = size
        self.type = type
        self.gender = gender
        self.imagename = imageName
        self.age = Int32(truncatingIfNeeded: age!)
        self.birthday = Int32(truncatingIfNeeded: birthday!)
    }

}
