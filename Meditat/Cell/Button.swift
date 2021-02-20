//
//  MeditatCategoryCell.swift
//  Meditat
//
//  Created by Alexey Kirpichnikov on 2021/2/19.
//

import UIKit

class Button: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(title: String) {
        self.init(frame: .zero)
        self.setTitle(title, for: .normal)
    }
    
    private func configure() {
        layer.cornerRadius = 5
        //backgroundColor = .systemPink
        translatesAutoresizingMaskIntoConstraints = false
    }
}
