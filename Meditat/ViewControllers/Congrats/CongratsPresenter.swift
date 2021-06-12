//
//  CongratsPresenter.swift
//  Meditat
//
//  Created by Alexey Kirpichnikov on 2021/6/12.
//

import Foundation

protocol CongratsPresenterProtocol {
    init(view: CongratsViewInput)
    func pushToMeVC()
}

class CongratsPresenter: CongratsPresenterProtocol {
    unowned let view: CongratsViewInput
    
    required init(view: CongratsViewInput) {
        self.view = view
    }
    
    func pushToMeVC() {
        view.showMeScreen()
    }
}
