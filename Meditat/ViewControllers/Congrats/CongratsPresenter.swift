//
//  CongratsPresenter.swift
//  Meditat
//
//  Created by Alexey Kirpichnikov on 2021/6/12.
//

import UIKit
import CoreData

protocol CongratsPresenterProtocol {
    init(view: CongratsViewInput, entity: SessionModel)
    func pushToMeVC()
}

class CongratsPresenter: CongratsPresenterProtocol {
    unowned let view: CongratsViewInput
    let entity: SessionModel?
    
    required init(view: CongratsViewInput, entity: SessionModel) {
        self.view = view
        self.entity = entity
    }
    
    func pushToMeVC() {
        view.showMeScreen()
        saveEntity()
        fetchSavedEntity()
    }
    
    func saveEntity() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let sessionEntity = NSEntityDescription.entity(forEntityName: "Sessions", in: managedContext)!
        let sessions = NSManagedObject(entity: sessionEntity, insertInto: managedContext)
        
        sessions.setValue(entity?.uuid, forKey: "uuid")
        sessions.setValue(entity?.duration, forKey: "duration")
        sessions.setValue(entity?.date, forKey: "date")
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("couldn't save. \(error), \(error.userInfo)")
        }
    }
    
    // this method can be used in MeVC Presenter
    func fetchSavedEntity() {
        let duration = [Float64]()
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchedData = NSFetchRequest<NSFetchRequestResult>(entityName: "Sessions")
        
        do {
            let result = try managedContext.fetch(fetchedData) as! [NSManagedObject]
            /*    print("--->>> result = \(result)")
            let x = result.compactMap { $0 }
            print("--->>> x = \(x)")
            let y = result.compactMap { $0.value(forKey: "duration") }
            print("--->>> x = \(y)")
            
            for data in result /*as! [NSManagedObject]*/ {
                print("--->>> uuid = \(data.value(forKey: "uuid") as Any)")
                print("--->>> duration = \(data.value(forKey: "duration") as Any)")
                //duration.append(data.value(forKey: "duration"))
                print("--->>> date = \(data.value(forKey: "date") as Any)")
            }*/
        } catch {
            print("--->>> error")
        }
    }
    
}
