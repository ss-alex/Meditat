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
    }
    
    /*func setSessionSequence() {
        var counter = 0
        
        let result = fetchSessionsFromDB()
        let dateArray = result.compactMap { $0.value(forKey: "date") as! Date }
        
        var array: [Int] = []
        
        let dateArraySorted = dateArray.sorted(by: > )
        //print("--->>> dateArraySorted = \(dateArraySorted)")
        //print("--->>> dateArraySorted.count = \(dateArraySorted.count)")
        
        let dayDiffs = dateArraySorted.map { (date) in
        
            //print("--->>> counter = \(counter)")
            
            if counter == 0 {
                let y = Calendar.current.dateComponents([.hour], from: date, to: Date()).hour!
                array.append(y)
                counter += 1
            } else {
                //print("--->>> date = \(date)")
                //print("--->>> dateArraySorted[counter] = \(dateArraySorted[counter - 1])")
                let x = Calendar.current.dateComponents([.hour], from: date, to: dateArraySorted[counter - 1]).hour!
                array.append(x)
                
                if counter < dateArraySorted.count - 1 {
                    counter += 1
                }
            }
        }
        
        //print("--->>> array = \(array)")
        var counter2 = 0
        //var index = 0
        
        for (prev, next) in zip(array, array.dropFirst()) {
            
            //index += 1
            
            if next - prev <= 24 {
                
                //let z = Calendar.current.dateComponents([.hour], from: prev, to: Date() )
                //if Date()array[index - 1]{
                    
                //}
                
                counter2 += 1
                //print("--->>> counter2 = \(counter2)")
            }
        }
        
        print("--------->>>>>>>>>>>>")
        var counter3 = 0
        let arrayOfDates = dateArraySorted
 
        var index = 0
        
        for (prev, next) in zip(arrayOfDates, arrayOfDates.dropFirst()) {
            
            let z = Calendar.current.dateComponents([.hour], from: next, to: prev).hour!
            print("--->>> z = \(z)")
            index += 1
            print("--->>> index  = \(index)")
            
            if z <= 24 {
                if index > 0 {
                    if Calendar.current.dateComponents([.hour], from: arrayOfDates[index - 1], to: prev).hour! <= 24 {
                        counter3 += 1
                    }
                }
            }
        }
    }*/
    
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
}

extension Date {
    /// Returns the amount of years from another date
    func years(from date: Date) -> Int {
        return Calendar.current.dateComponents([.year], from: date, to: self).year ?? 0
    }
    /// Returns the amount of months from another date
    func months(from date: Date) -> Int {
        return Calendar.current.dateComponents([.month], from: date, to: self).month ?? 0
    }
    /// Returns the amount of weeks from another date
    func weeks(from date: Date) -> Int {
        return Calendar.current.dateComponents([.weekOfMonth], from: date, to: self).weekOfMonth ?? 0
    }
    /// Returns the amount of days from another date
    func days(from date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }
    /// Returns the amount of hours from another date
    func hours(from date: Date) -> Int {
        return Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
    }
    /// Returns the amount of minutes from another date
    func minutes(from date: Date) -> Int {
        return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
    }
    /// Returns the amount of seconds from another date
    func seconds(from date: Date) -> Int {
        return Calendar.current.dateComponents([.second], from: date, to: self).second ?? 0
    }
    /// Returns the a custom time interval description from another date
    func offset(from date: Date) -> String {
        if years(from: date)   > 0 { return "\(years(from: date))y"   }
        if months(from: date)  > 0 { return "\(months(from: date))M"  }
        if weeks(from: date)   > 0 { return "\(weeks(from: date))w"   }
        if days(from: date)    > 0 { return "\(days(from: date))d"    }
        if hours(from: date)   > 0 { return "\(hours(from: date))h"   }
        if minutes(from: date) > 0 { return "\(minutes(from: date))m" }
        if seconds(from: date) > 0 { return "\(seconds(from: date))s" }
        return ""
    }
}
