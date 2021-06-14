//
//  TabBarController.swift
//  Meditat
//
//  Created by Лена Мырленко on 2021/2/19.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [setupMeditationVC(), setupMeVC(), setupSettingsVC()]
    }
    
    private func setupMeditationVC() -> UINavigationController {
        let meditationView = MeditationView()
        meditationView.title = "Meдитация"
        return UINavigationController(rootViewController: meditationView)
    }
    
    private func setupMeVC() -> UINavigationController {
        let meView = MeView(entity: SessionModel())
        meView.title = "Я"
        return UINavigationController(rootViewController: meView)
    }
    
    private func setupSettingsVC() -> UINavigationController {
        let settingsView = SettingsView()
        settingsView.title = "Настройки"
        return UINavigationController(rootViewController: settingsView)
    }
}
