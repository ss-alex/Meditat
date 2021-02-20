//
//  SettingsVC.swift
//  Meditat
//
//  Created by Alexey Kirpichnikov on 2021/2/19.
//

import UIKit

class SettingsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray3
        setupNavigation()
    }
    
    private func setupNavigation() {
        navigationController?.navigationBar.prefersLargeTitles = true
        //self.title = "Настройки"
    }
}

