//
//  MePresenter.swift
//  Meditat
//
//  Created by Alexey Kirpichnikov on 2021/6/14.
//

import Foundation

// необходимо сделать обвязку с MeView и, затем, сделать
// необходимо прописать логику для для статистики и подать это на MeView

protocol MePresenterProtocol {
    init(view: MeViewInput)
}

class MePresenter: MePresenterProtocol {
    unowned let view: MeViewInput
    
    required init(view: MeViewInput) {
        self.view = view
    }
}
