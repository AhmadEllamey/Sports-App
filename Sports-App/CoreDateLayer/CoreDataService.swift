//
//  CoreDataService.swift
//  Sports-App
//
//  Created by Ahmad Ellamey on 5/13/22.
//  Copyright © 2022 Ahmad Ellamey & Marawan Adel. All rights reserved.
//

import Foundation
import CoreData
import UIKit
 

class CoreDataService: CoreDataProtocol {
    var managedObjectContext : NSManagedObjectContext!
    
    static var coreDataServiceIntanace = CoreDataService()
    
    private init(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedObjectContext = appDelegate.persistentContainer.viewContext
    }
    
    
    func insertLeagueToCoreData(league : FavouriteLeague) -> Int{
        let entity = NSEntityDescription.entity(forEntityName: "League", in: managedObjectContext)
            
            let leagueData = NSManagedObject(entity: entity!, insertInto: managedObjectContext)
        
            let imagetStrBase64 = league.image.base64EncodedString(options: .lineLength64Characters)
        
            leagueData.setValue(league.name, forKey: "name")
            leagueData.setValue(imagetStrBase64, forKey: "image")
            leagueData.setValue(league.ytLink, forKey: "ytLink")
            
            do{
                try managedObjectContext.save()
                print("Insert Done")
            }catch{
                print(error.localizedDescription)
                print("Insert Fail")
                return 0
            }
        
        return 1
    }
       
    func getAllFavLeagueFromCoreData() -> [FavouriteLeague]{
        var favList : [FavouriteLeague] = []
        let data = NSFetchRequest<NSManagedObject>(entityName: "League")
        
        do{
            let returnedArray = try managedObjectContext.fetch(data)
            
            for i in 0..<returnedArray.count{
                let name = returnedArray[i].value(forKey: "name") as? String
                let image = returnedArray[i].value(forKey: "image") as? String
                let ytLink = returnedArray[i].value(forKey: "ytLink") as? String
                
                let imageData = NSData(base64Encoded: image!)
                
                let obj = FavouriteLeague(image: imageData!, name: name!, ytLink: ytLink!)
                
                favList.append(obj)
            }
        }catch{
            print("Retrieveing Fail")
            print(error.localizedDescription)
            return favList
        }
        
        return favList
    }
    
    func deleteFavLeagueFromCoreData(league: FavouriteLeague) -> Int{
        let obj = searchByObject(league: league)
        guard let object = obj else{
            return 0
        }
        
        managedObjectContext.delete(object)
        return 1
    }
    
    func checkForFavLeagueInCoreData(league: FavouriteLeague) -> Int{
        let obj = searchByObject(league: league)
        guard obj != nil else{
            return 0
        }
        
        return 1
    }
    
    func searchByObject(league: FavouriteLeague) -> NSManagedObject? {
        let data = NSFetchRequest<NSManagedObject>(entityName: "League")
        
        do{
            let returnedArray = try managedObjectContext.fetch(data)
            
            for i in 0..<returnedArray.count{
                let name = returnedArray[i].value(forKey: "name") as? String
                let image = returnedArray[i].value(forKey: "image") as? String
                let ytLink = returnedArray[i].value(forKey: "ytLink") as? String
                
                let imageData = NSData(base64Encoded: image!, options: .ignoreUnknownCharacters)
                
                
                if name == league.name{
                    return returnedArray[i]
                }
            }
        }catch{
            print("Retrieveing Fail")
            print(error.localizedDescription)
            return nil
        }
        
        return nil
    }
}


/*  //// 3nd l controller
let imageData: NSData =  cell.leagueImage.image!.pngData() as! NSData


 
 // 3nd l controller
cell.imageView?.image = UIImage(data: Data(base64Encoded: x, options: .ignoreUnknownCharacters)!)  ?? UIImage(named:"apple.png")

print("Image Data: \(imageData)")
*/
