//
//  CongratsVC.swift
//  Meditat
//
//  Created by Alexey Kirpichnikov on 2021/6/12.
//
import UIKit

protocol CongratsViewInput: class {
    func showMeScreen()
}

class CongratsVC: UIViewController {
    private let congratsLabel = UILabel()
    private let button = UIButton()
    
    var presenter: CongratsPresenter!
    var entity: SessionModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupUI()
        setupLogic()
    }
    
    init(entity: SessionModel) {
        self.entity = entity
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = true
    }
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        setupCongratsLabel()
        setupButton()
    }
    
    func setupLogic() {
        presenter = CongratsPresenter(view: self, entity: entity!)
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
        button.addTarget(self, action: #selector(pushToMeVC), for: .touchUpInside)
    }
    
    @objc func pushToMeVC() {
        presenter.pushToMeVC()
    }
}

extension CongratsVC: CongratsViewInput {
    func showMeScreen() {
        navigationController?.pushViewController(MeVC(), animated: true)
    }
}
