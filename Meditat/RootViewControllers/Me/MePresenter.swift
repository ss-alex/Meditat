//
//  MePresenter.swift
//  Meditat
//
//  Created by Alexey Kirpichnikov on 2021/6/14.
//

import UIKit
import CoreData

// необходимо сделать обвязку с MeView и, затем, сделать
// необходимо прописать логику для для статистики и подать это на MeView

protocol MePresenterProtocol {
    init(view: MeViewInput)
    func setOverallTime()
    func setMeditationNumber()
}

class MePresenter: MePresenterProtocol {
    unowned let view: MeViewInput
    
    required init(view: MeViewInput) {
        self.view = view
    }
    
    func setMeditationNumber() {
        let durationArray = fetchDataFromDB() as! [Float64]
        let meditationNumber = durationArray.count
        view.setMeditationNumber(meditationNumber)
    }
    
    func setOverallTime() {
        let durationArray = fetchDataFromDB() as! [Float64]
        let totalNumber = durationArray.reduce(0, +)
        let roundedNumberIntoString = String(format: "%.0f", totalNumber)
        
        view.setupOverallTimeLabel(roundedNumberIntoString)
    }
    
    private func fetchDataFromDB() -> [Any] {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return [] }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchedData = NSFetchRequest<NSFetchRequestResult>(entityName: "Sessions")
        
        do {
            let result = try managedContext.fetch(fetchedData) as! [NSManagedObject]
            let duration = result.compactMap { $0.value(forKey: "duration") }
            return duration
            
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
}
