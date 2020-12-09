//
//  Pet+CoreDataProperties.swift
//  PetAdoption
//
//  Created by user182198 on 12/8/20.
//  Copyright © 2020 Conestoga. All rights reserved.
//
//

import Foundation
import CoreData


extension Pet {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pet> {
        return NSFetchRequest<Pet>(entityName: "Pet")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: Int32
    @NSManaged public var birthday: Int32
    @NSManaged public var size: String?
    @NSManaged public var type: String?
    @NSManaged public var desc: String?
    @NSManaged public var gender: String?
    @NSManaged public var imagename: String?
    @NSManaged public var breed: String?

}
