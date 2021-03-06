//
//  SubcategoryVC.swift
//  Meditat
//
//  Created by Alexey Kirpichnikov on 2021/2/22.
//

import UIKit

class SubcategoryView: UIViewController {
    
    enum State {
        case subcategory(Subcategory)
    }
    
    let tableView = UITableView()
    var state: State
    var subcatArray: [SubcatModel]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
        setupTableView()
        setupTitle()
    }
    
    init (state: State, subcatArray: [SubcatModel] ) {
        self.state = state
        self.subcatArray = subcatArray
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupVC() {
        view.backgroundColor = .lightGray
    }
    
    private func setupTabBar() {
        //navigationController?.tabBarController.
    }
    
    private func setupTitle() {
        switch state {
        case .subcategory(let subcategory):
            self.title = subcategory.title
            print("subcat.count = \(subcatArray.count)")
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
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.reuseID)
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension SubcategoryView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destVC = PlayerView()
        destVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(destVC, animated: true)
    }
}

extension SubcategoryView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subcatArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseID,
                                                 for: indexPath) as! TableViewCell
        let subcategory = subcatArray[indexPath.row]
        cell.setupCell(model: subcategory)
        return cell
    }
}
