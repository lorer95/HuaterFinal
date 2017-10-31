//
//  PersistenceService.swift
//  HuaterFinal
//
//  Created by Michael Rukavina on 10/29/17.
//  Copyright © 2017 cs329E. All rights reserved.
//
import Foundation
import CoreData

class PersistenceService {
    
    // Provide external access to this Singleton.
    static let shared = PersistenceService()
    
    var users: [NSManagedObject]! = []
    
    // MARK: - Core Data stack
    
    private var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    private lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "HuaterFinal")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    // We want this class to be a Singleton.
    // To keep it that way, don't allow any code outside this class to instantiate an object of this type.
    private init() {}
    
    func count() -> Int {
        return users.count
    }
    
    func getUser(index:Int) -> appUser {
        if index < users.count {
            let p = users[index]
            let fN = p.value(forKey: "firstName") as! String
            let lN = p.value(forKey: "lastName") as! String
            let g = p.value(forKey: "gender") as! String
            let w = p.value(forKey: "weight") as! Int
            let e = p.value(forKey: "email") as! String
            let a = p.value(forKey: "age") as! Int
            let m = p.value(forKey: "metric") as! String
            let pswd = p.value(forKey: "pswd") as! String
            let theme = p.value(forKey: "theme") as! String
            let idNO = p.value(forKey: "idNO") as! Int
            
            let stringInfo = [fN, lN, e, pswd, g, m, theme]
            let numInfo = [a, w]
            
            return appUser(idNO: idNO, stringInfo: stringInfo, numInfo: numInfo)
            
            
        } else {
            let stringInfo = ["<bad>", "<bad>", "<bad>", "<bad>", "<bad>", "<bad>", "<bad>"]
            let numInfo = [0, 0]
            let idNO = 0
            
            return appUser(idNO: idNO, stringInfo: stringInfo, numInfo: numInfo)
        }
    }
    
    func getSignedInUser(email:String, pswdText: String ) -> appUser {
    
        var fN = "<bad>"
        var lN = "<bad>"
        var e = "<bad>"
        var pswd = "<bad>"
        var g = "<bad>"
        var m = "<bad>"
        var theme = "<bad>"
        var a = -1
        var w = -1
        var idNO = -1
        
        for i in 13...users.count {
            let u = self.getUser(index: i-1)

            if( u.email == email && u.pswd == pswdText) {
                let p = users[i-1]
                
                fN = p.value(forKey: "firstName") as! String
                lN = p.value(forKey: "lastName") as! String
                g = p.value(forKey: "gender") as! String
                w = p.value(forKey: "weight") as! Int
                e = p.value(forKey: "email") as! String
                a = p.value(forKey: "age") as! Int
                m = p.value(forKey: "metric") as! String
                pswd = p.value(forKey: "pswd") as! String
                theme = p.value(forKey: "theme") as! String
                idNO = p.value(forKey: "idNO") as! Int
            }
        }
            
            let stringInfo = [fN, lN, e, pswd, g, m, theme]
            let numInfo = [a, w]
            
            return appUser(idNO: idNO, stringInfo: stringInfo, numInfo: numInfo)
        
    }
    
    
    
    func fetchUsers() {
        
        let managedContext = persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"AppUser")
        
        var fetchedResults:[NSManagedObject]? = nil
        
        do {
            try fetchedResults = managedContext.fetch(fetchRequest) as? [NSManagedObject]
        } catch {
            // what to do if an error occurs?
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        
        guard let results = fetchedResults else { return }
        
        users = results
    }
    
    func isUser( email: String, pswd: String ) -> Bool {
        for i in 13...users.count {
            let u = self.getUser(index: i-1)
            if( u.email == email && u.pswd == pswd) {
                return true
            }
            
        }
        return false
    }

    func editUser( idNO: Int, stringInfo: [String], numInfo: [Int] ) {
        
        let managedContext = persistentContainer.viewContext
        
        // Create the entity we want to save
        let entity = NSEntityDescription.entity(forEntityName: "AppUser", in: managedContext)
        
        let _user = NSManagedObject(entity: entity!, insertInto:managedContext)
        
        let sKeys = ["firstName", "lastName", "email", "pswd", "gender",  "metric", "theme"]
        let nKeys = ["age", "weight"]
        
        _user.setValue(idNO, forKey: "idNO")
        
        for i in 1...stringInfo.count {
            _user.setValue(stringInfo[i-1], forKey: sKeys[i-1])
        }
        
        for i in 1...numInfo.count {
            _user.setValue(numInfo[i-1], forKey: nKeys[i-1])
        }
        
        
        // Commit the changes.
        do {
            try managedContext.save()
            users[idNO-1] = _user
            
        } catch {
            // what to do if an error occurs?
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        
        
    }
    
    func saveUser(idNO: Int, stringInfo: [String], numInfo: [Int]) {
        
        let managedContext = persistentContainer.viewContext
        
        // Create the entity we want to save
        let entity = NSEntityDescription.entity(forEntityName: "AppUser", in: managedContext)
        
        let _user = NSManagedObject(entity: entity!, insertInto:managedContext)
        
        let sKeys = ["firstName", "lastName", "email", "pswd", "gender",  "metric", "theme"]
        let nKeys = ["age", "weight"]
        
        
        _user.setValue(idNO, forKey: "idNO")
        
        for i in 1...stringInfo.count {
            _user.setValue(stringInfo[i-1], forKey: sKeys[i-1])
        }
       
        for i in 1...numInfo.count {
            _user.setValue(numInfo[i-1], forKey: nKeys[i-1])
        }

        
        // Commit the changes.
        do {
            try managedContext.save()
            users.append( _user )
            
        } catch {
            // what to do if an error occurs?
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
    }
    
}

