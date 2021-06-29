//
//  CheckboxView.swift
//  Meditat
//
//  Created by Alexey Kirpichnikov on 2021/6/28.
//

import UIKit

class CheckboxView: UIView {
    
    let checkboxView = UIView()
    let checkboxImage = UIImageView()
    let checkboxText = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    convenience init(text: String) {
        self.init(frame: .zero)
        checkboxText.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        addSubview(checkboxView)
        checkboxView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            checkboxView.widthAnchor.constraint(equalToConstant: 82),
            checkboxView.heightAnchor.constraint(equalToConstant: 104),
            checkboxView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            checkboxView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
        
        checkboxView.addSubview(checkboxImage)
        checkboxImage.image = UIImage(systemName: "checkmark.square")
        checkboxImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            checkboxImage.widthAnchor.constraint(equalToConstant: 54),
            checkboxImage.heightAnchor.constraint(equalToConstant: 54),
            checkboxImage.centerXAnchor.constraint(equalTo: checkboxView.centerXAnchor),
            checkboxImage.topAnchor.constraint(equalTo: checkboxView.topAnchor, constant: 4)
        ])
        
        checkboxText.font = UIFont.systemFont(ofSize: 12)
        checkboxText.numberOfLines = 2
        checkboxText.textAlignment = .center
        checkboxText.backgroundColor = .white
        checkboxView.addSubview(checkboxText)
        checkboxText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            checkboxText.topAnchor.constraint(equalTo: checkboxImage.bottomAnchor, constant: 6),
            checkboxText.leftAnchor.constraint(equalTo: checkboxView.leftAnchor),
            checkboxText.rightAnchor.constraint(equalTo: checkboxView.rightAnchor),
            checkboxText.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
