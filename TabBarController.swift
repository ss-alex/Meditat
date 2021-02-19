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
        let meditationVC = MeditationVC()
        return UINavigationController(rootViewController: meditationVC)
    }
    
    private func setupMeVC() -> UINavigationController {
        let meVC = MeVC()
        return UINavigationController(rootViewController: meVC)
    }
    
    private func setupSettingsVC() -> UINavigationController {
        let settingsVC = SettingsVC()
        return UINavigationController(rootViewController: settingsVC)
    }
}
