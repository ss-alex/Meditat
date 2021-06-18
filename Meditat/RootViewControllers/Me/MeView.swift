//
//  MeVC.swift
//  Meditat
//
//  Created by Alexey Kirpichnikov on 2021/2/19.
//

import UIKit

protocol MeViewInput: class {
    func setMeditationNumber(_ number: Int)
    func setupOverallTimeLabel(_ timeString: String)
}

class MeView: UIViewController {
    
    let sessionSequence = UILabel()
    let sessionSequenceText = UILabel()
    let meditationNumber = UILabel()
    let meditationText = UILabel()
    let overallTime = UILabel()
    let overallTimeText = UILabel()
    
    var entity: SessionModel?
    var presenter: MePresenter!
    
    init(entity: SessionModel) {
        self.entity = entity
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray2
        setupNavigation()
        setupUI()
        setupLogic()
    }
    
    private func setupLogic() {
        presenter = MePresenter(view: self)
        presenter.setMeditationNumber()
        presenter.setOverallTime()
    }
    
    private func setupNavigation() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupUI() {
        setSessionSequenceLabel()
        setSessionSequenceTextLabel()
        setMeditationNumber()
        setMeditationText()
        setOverallTime()
        setOverallTimeText()
    }
    
    private func setSessionSequenceLabel() {
        view.addSubview(sessionSequence)
        sessionSequence.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            sessionSequence.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            sessionSequence.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            sessionSequence.widthAnchor.constraint(equalToConstant: 40),
            sessionSequence.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        sessionSequence.backgroundColor = .systemPink
    }
    
    private func setSessionSequenceTextLabel() {
        view.addSubview(sessionSequenceText)
        sessionSequenceText.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            sessionSequenceText.topAnchor.constraint(equalTo: sessionSequence.bottomAnchor, constant: 10),
            sessionSequenceText.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            sessionSequenceText.widthAnchor.constraint(equalToConstant: 200),
            sessionSequenceText.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        sessionSequenceText.backgroundColor = .systemPink
        sessionSequenceText.text = "Сессий подряд"
    }
    
    private func setMeditationNumber() {
        view.addSubview(meditationNumber)
        meditationNumber.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            meditationNumber.topAnchor.constraint(equalTo: sessionSequenceText.bottomAnchor, constant: 10),
            meditationNumber.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            meditationNumber.widthAnchor.constraint(equalToConstant: 40),
            meditationNumber.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        meditationNumber.backgroundColor = .systemPink
    }
    
    private func setMeditationText() {
        view.addSubview(meditationText)
        meditationText.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            meditationText.topAnchor.constraint(equalTo: meditationNumber.bottomAnchor, constant: 20),
            meditationText.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            meditationText.widthAnchor.constraint(equalToConstant: 200),
            meditationText.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        meditationText.backgroundColor = .systemPink
        meditationText.text = "Медитаций прослушано"
    }
    
    private func setOverallTime() {
        view.addSubview(overallTime)
        overallTime.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            overallTime.topAnchor.constraint(equalTo: meditationText.bottomAnchor, constant: 10),
            overallTime.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            overallTime.widthAnchor.constraint(equalToConstant: 40),
            overallTime.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        overallTime.backgroundColor = .systemPink
    }
    
    private func setOverallTimeText() {
        view.addSubview(overallTimeText)
        overallTimeText.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            overallTimeText.topAnchor.constraint(equalTo: overallTime.bottomAnchor, constant: 20),
            overallTimeText.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            overallTimeText.widthAnchor.constraint(equalToConstant: 200),
            overallTimeText.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        overallTimeText.backgroundColor = .systemPink
        overallTimeText.text = "Всего минут"
    }
}

extension MeView: MeViewInput {
    
    func setupOverallTimeLabel(_ timeString: String) {
        overallTime.text = "\(timeString)"
    }
    
    func setMeditationNumber(_ number: Int) {
        meditationNumber.text = "\(number)"
    }
}
