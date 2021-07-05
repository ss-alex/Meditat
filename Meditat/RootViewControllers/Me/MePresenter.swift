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
    func setSessionSequence()
    func setOverallTime()
    func setMeditationNumber()
}

class MePresenter: MePresenterProtocol {
    
    unowned let view: MeViewInput
    
    required init(view: MeViewInput) {
        self.view = view
    }
    
    func setSessionSequence() {
        
        let result = fetchSessionsFromDB()
        let dateArray = result.compactMap { $0.value(forKey: "date") as! Date }
        let dateArraySorted = dateArray.sorted(by: > )
        
        var counter = 0
        var index = 0
        let arrayOfDates = dateArraySorted
        
        for (prev, next) in zip(arrayOfDates, arrayOfDates.dropFirst()) {
            
            let z = Calendar.current.dateComponents([.hour], from: next, to: prev).hour!
            index += 1
            
            if z <= 24 {
                if index > 0 {
                    if Calendar.current.dateComponents([.hour], from: arrayOfDates[index - 1], to: prev).hour! <= 24 {
                        counter += 1
                    }
                }
            }
        }
        
        view.setSessionSequenceText(counter)
        
        // logic trial:
        // нужно поменять цвета для текста, не тинт калор, а что-то другое
        setupCheckboxes(counter: counter)
    }
    
    func setMeditationNumber() {
        
        let result = fetchSessionsFromDB()
        let durationArray = result.compactMap { $0.value(forKey: "duration") }
        let meditationNumber = durationArray.count
        view.setMeditationNumber(meditationNumber)
    }
    
    func setOverallTime() {
        
        let result = fetchSessionsFromDB()
        let durationArray = result.compactMap { $0.value(forKey: "duration") } as! [Float64]
        let totalNumber = durationArray.reduce(0, +)
        let roundedNumberIntoString = String(format: "%.0f", totalNumber)
        view.setupOverallTimeLabel(roundedNumberIntoString)
    }
    
    private func fetchSessionsFromDB() -> [NSManagedObject] {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return [] }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchedData = NSFetchRequest<NSFetchRequestResult>(entityName: "Sessions")
        
        do {
            let result = try managedContext.fetch(fetchedData) as! [NSManagedObject]
            return result
            
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    private func setupCheckboxes(counter: Int) {

        switch counter {
        case 0..<2:
            print("no checkboxes being filled")
        case 2..<3:
            print("выделяется чекбокс №1")
            view.setupCheckboxStyles(checboxNumber: 1, imageColor: .green, textColor: .green)
        case 3..<5:
            print("выделяется чекбокс №1, 2")
            view.setupCheckboxStyles(checboxNumber: 2, imageColor: .green, textColor: .green)
        case 5..<10:
            print("выделяется чекбокс №1, 2, 3")
            view.setupCheckboxStyles(checboxNumber: 3, imageColor: .green, textColor: .green)
        case 10..<20:
            print("выделяется чекбокс №1, 2, 3, 4")
            view.setupCheckboxStyles(checboxNumber: 4, imageColor: .green, textColor: .green)
        case 20..<30:
            print("выделяется чекбокс №1, 2, 3, 4, 5")
            view.setupCheckboxStyles(checboxNumber: 5, imageColor: .green, textColor: .green)
        case 30... :
            print("выделяется чекбокс №1, 2, 3, 4, 5, 6")
            view.setupCheckboxStyles(checboxNumber: 6, imageColor: .green, textColor: .green)
        default: break
        }
    }
}
