//
//  PetStore.swift
//  PetAdoption
//
//  Created by user182198 on 12/8/20.
//  Copyright © 2020 Conestoga. All rights reserved.
//

import UIKit
import CoreData

enum PetResult {
    case success([Pet])
    case failure(Error)
}

enum PetError : Error {
    case creationError
}

class PetStore {
    var result: PetResult!
    
    private let mySession: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Pets")
        
        let appName: String = "PetAdoption"
        var persistentStoreDescriptions: NSPersistentStoreDescription
        
        let storeUrl = PetStore.getDocumentsDirectory().appendingPathComponent("Pets.sqlite")
        print(storeUrl)
        
        let description = NSPersistentStoreDescription()
        description.shouldInferMappingModelAutomatically = true
        description.shouldMigrateStoreAutomatically = true
        description.url = storeUrl
        
        container.persistentStoreDescriptions = [description]
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    lazy var context = persistentContainer.viewContext
    
    static func getDocumentsDirectory()-> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    func fetchAllPets(completion: @escaping(PetResult)->Void) {
        let fetch: NSFetchRequest<Pet> = Pet.fetchRequest()
        let viewContext = persistentContainer.viewContext
        viewContext.perform {
            do {
                let fetchPet = try viewContext.fetch(fetch)
                completion(.success(fetchPet))
            } catch {
                completion(.failure(error))
            }
        }
    }
        
    func getAllPets(completion : @escaping(PetResult)->Void) {
        let components = URLComponents(string: "http://localhost:3000/root")
        let url = components!.url!
        let request = URLRequest(url: url)
        let task = mySession.dataTask(with: request) {
            (data, response, error)->Void in
            if let jData = data {
                self.result = self.petsCall(fromJson: jData, into: self.context)
            } else if error != nil {
                print("Error fetching pets")
            } else {
                print ("Other error")
            }
            
            if case .success = self.result {
                do {
                    try self.context.save()
                } catch {
                    self.result = .failure(PetError.creationError)
                }
            } else {
                 self.result = .failure(PetError.creationError)
            }
            OperationQueue.main.addOperation {
                    completion(self.result)
            }
        }
        task.resume()
    }
    
    func petsCall(fromJson data: Data, into context: NSManagedObjectContext)->PetResult {
        do {
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
            
            guard let jsonDict = jsonObject as? [AnyHashable:Any],
                let petArray = jsonDict["pet"] as? [[String:Any]]
                else {
                    return .failure(PetError.creationError)
            }
            var finalPets = [Pet]()
            for petJson in petArray {
                if let pet = pet(fromJson: petJson, into: context) {
                    finalPets.append(pet)
                }
                
            }
            return .success(finalPets)
            
        } catch let error  {
            return .failure(error)
        }
    }
    
    func pet(fromJson json: [String:Any], into context: NSManagedObjectContext)->Pet? {
        guard
            let name = json["name"] as! String?,
            let desc = json["desc"] as! String?,
            let size = json["size"] as! String?,
            let type = json["type"] as! String?,
            let gender = json["gender"] as! String?,
            let age = json["age"] as! Int64?,
            let birthday = json["birthday"] as! Int64?,
            let imageName = json["imageName"] as! String?
        else {
                return nil
        }
        let fetch: NSFetchRequest<Pet> = Pet.fetchRequest()
        let pred = NSPredicate(format: "\(#keyPath(Pet.name)) == \"\(name)\"")
        fetch.predicate = pred
        var fetchPet: [Pet]?
        context.performAndWait {
            fetchPet = try? fetch.execute()
        }
        if  let ePet = fetchPet?.first {
            return ePet
        }
        var pet: Pet!
        context.performAndWait {
            pet = Pet(
            name: name,
            desc: desc,
            size: size,
            type: type,
            gender: gender,
            imageName: imageName,
            age:age,
            birthday:birthday,
            context: context)
        }
        return pet
    }
    
}

