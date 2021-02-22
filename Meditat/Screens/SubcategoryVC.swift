//
//  SubcategoryVC.swift
//  Meditat
//
//  Created by Alexey Kirpichnikov on 2021/2/22.
//

import UIKit

class SubcategoryVC: UIViewController {
    
    enum State {
        case subcategory(Subcategory)
    }
    
    let tableView = UITableView()
    var state: State
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
        setupTableView()
        setupTitle()
    }
    
    init (state: State) {
        self.state = state
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupVC() {
        view.backgroundColor = .lightGray
    }
    
    private func setupTitle() {
        switch state {
        case .subcategory(let subcategory):
            self.title = subcategory.title
            print("SubcategoryVC. setupVC. subcategory.title = \(subcategory.title)")
        }
        
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        tableView.backgroundColor = .systemGray2
        tableView.delegate = self
    }
}

extension SubcategoryVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension SubcategoryVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
    
    
}
