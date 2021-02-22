//
//  TableViewCell.swift
//  Meditat
//
//  Created by Alexey Kirpichnikov on 2021/2/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    static let reuseID = "SubcatTableViewCell"
    
    let subcategoryTitle = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubcatTitle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubcatTitle() {
        self.addSubview(subcategoryTitle)
        subcategoryTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            subcategoryTitle.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            subcategoryTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            subcategoryTitle.widthAnchor.constraint(equalToConstant: 200),
            subcategoryTitle.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    public func setupCell(model: SubcatModel) {
        subcategoryTitle.text = model.subcategoryName
    }
}
