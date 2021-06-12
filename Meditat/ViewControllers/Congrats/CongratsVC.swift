//
//  CongratsVC.swift
//  Meditat
//
//  Created by Лена Мырленко on 2021/6/12.
//
import UIKit

class CongratsVC: UIViewController {
    private let congratsLabel = UILabel()
    private let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupUI()
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = true
    }
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        setupCongratsLabel()
        setupButton()
    }
    
    private func setupCongratsLabel() {
        view.addSubview(congratsLabel)
        congratsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            congratsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            congratsLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            congratsLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            congratsLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            congratsLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        congratsLabel.backgroundColor = .systemIndigo
        congratsLabel.text = "Молодец, так держать!"
    }
    
    private func setupButton() {
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            button.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        button.backgroundColor = .systemIndigo
        button.setTitle("Ок", for: .normal)
    }
}
