//
//  MeVC.swift
//  Meditat
//
//  Created by Alexey Kirpichnikov on 2021/2/19.
//

import UIKit

protocol MeViewInput: class {
    func setSessionSequenceText(_ number: Int)
    func setMeditationNumber(_ number: Int)
    func setupOverallTimeLabel(_ timeString: String)
}

class MeView: UIViewController {
    
    let progressLabel = UILabel()
    let sessionSequence = UILabel()
    let sessionSequenceText = UILabel()
    let meditationNumber = UILabel()
    let meditationText = UILabel()
    let overallTime = UILabel()
    let overallTimeText = UILabel()
    let achievementsLabel = UILabel()
    
    let horizontalStackViewOne = UIStackView()
    let horizontalStackViewTwo = UIStackView()
    
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
        presenter.setSessionSequence()
        presenter.setMeditationNumber()
        presenter.setOverallTime()
    }
    
    private func setupNavigation() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupUI() {
        
        setProgressLabel()
        setSessionSequenceLabel()
        setSessionSequenceTextLabel()
        setMeditationNumber()
        setMeditationText()
        setOverallTime()
        setOverallTimeText()
        setAchievementsLabel()
        
        initStackViewOne()
        initStackViewTwo()
    }
    
    private func setProgressLabel() {
        view.addSubview(progressLabel)
        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            progressLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            progressLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            progressLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            progressLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        progressLabel.backgroundColor = .systemPink
        progressLabel.text = "Прогресс"
    }
    
    private func setSessionSequenceLabel() {
        view.addSubview(sessionSequence)
        sessionSequence.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            sessionSequence.topAnchor.constraint(equalTo: progressLabel.bottomAnchor, constant: 20),
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
            sessionSequenceText.topAnchor.constraint(equalTo: sessionSequence.topAnchor),
            sessionSequenceText.leftAnchor.constraint(equalTo: sessionSequence.rightAnchor, constant: 20),
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
            meditationNumber.topAnchor.constraint(equalTo: sessionSequenceText.bottomAnchor, constant: 20),
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
            meditationText.topAnchor.constraint(equalTo: meditationNumber.topAnchor),
            meditationText.leftAnchor.constraint(equalTo: meditationNumber.rightAnchor, constant: 20),
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
            overallTime.topAnchor.constraint(equalTo: meditationText.bottomAnchor, constant: 20),
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
            overallTimeText.topAnchor.constraint(equalTo: overallTime.topAnchor),
            overallTimeText.leftAnchor.constraint(equalTo: overallTime.rightAnchor, constant: 20),
            overallTimeText.widthAnchor.constraint(equalToConstant: 200),
            overallTimeText.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        overallTimeText.backgroundColor = .systemPink
        overallTimeText.text = "Всего минут"
    }
    
    private func setAchievementsLabel() {
        view.addSubview(achievementsLabel)
        achievementsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            achievementsLabel.topAnchor.constraint(equalTo: overallTimeText.bottomAnchor, constant: 10),
            achievementsLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            achievementsLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            achievementsLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        achievementsLabel.backgroundColor = .systemPink
        achievementsLabel.text = "Достижения"
    }
    
    private func initStackViewOne() {
        
        horizontalStackViewOne.axis = .horizontal
        horizontalStackViewOne.distribution = .equalSpacing
        
        let checkboxView = makeCheckboxView(text: "2 дня медитаций")
        let checkboxView2 = makeCheckboxView(text: "3 дня медитаций")
        let checkboxView3 = makeCheckboxView(text: "5 дней медитаций")
        
        horizontalStackViewOne.addArrangedSubview(checkboxView)
        horizontalStackViewOne.addArrangedSubview(checkboxView2)
        horizontalStackViewOne.addArrangedSubview(checkboxView3)
        
        view.addSubview(horizontalStackViewOne)
        horizontalStackViewOne.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            horizontalStackViewOne.topAnchor.constraint(equalTo: achievementsLabel.bottomAnchor, constant: 20),
            horizontalStackViewOne.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            horizontalStackViewOne.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            horizontalStackViewOne.heightAnchor.constraint(equalToConstant: 110)
        ])
    }
    
    private func initStackViewTwo() {
        
        horizontalStackViewTwo.axis = .horizontal
        horizontalStackViewTwo.distribution = .equalSpacing
        
        let checkboxView4 = makeCheckboxView(text: "10 дней медитаций")
        let checkboxView5 = makeCheckboxView(text: "20 дней медитаций")
        let checkboxView6 = makeCheckboxView(text: "30 дней медитаций")
        
        horizontalStackViewTwo.addArrangedSubview(checkboxView4)
        horizontalStackViewTwo.addArrangedSubview(checkboxView5)
        horizontalStackViewTwo.addArrangedSubview(checkboxView6)
        
        view.addSubview(horizontalStackViewTwo)
        horizontalStackViewTwo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            horizontalStackViewTwo.topAnchor.constraint(equalTo: horizontalStackViewOne.bottomAnchor, constant: 20),
            horizontalStackViewTwo.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            horizontalStackViewTwo.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            horizontalStackViewTwo.heightAnchor.constraint(equalToConstant: 110)
        ])
    }
}

extension MeView {
    
    private func makeCheckboxView(text: String) -> UIView {
        
        let checkboxView = UIView()
        checkboxView.backgroundColor = .yellow
        checkboxView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            checkboxView.widthAnchor.constraint(equalToConstant: 82),
            checkboxView.heightAnchor.constraint(equalToConstant: 104)
        ])
        
        let verticalStack = UIStackView()
        verticalStack.axis = .vertical
        verticalStack.backgroundColor = .blue
        
        checkboxView.addSubview(verticalStack)
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            verticalStack.topAnchor.constraint(equalTo: checkboxView.topAnchor, constant: 4),
            verticalStack.leftAnchor.constraint(equalTo: checkboxView.leftAnchor, constant: 4),
            verticalStack.rightAnchor.constraint(equalTo: checkboxView.rightAnchor, constant: -4),
            verticalStack.bottomAnchor.constraint(equalTo: checkboxView.bottomAnchor, constant: -4)
        ])
        
        let checkboxImage = UIImageView()
        checkboxImage.image = UIImage(systemName: "checkmark.square")
        
        verticalStack.addSubview(checkboxImage)
        checkboxImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            checkboxImage.widthAnchor.constraint(equalToConstant: 54),
            checkboxImage.heightAnchor.constraint(equalToConstant: 54),
            checkboxImage.centerXAnchor.constraint(equalTo: verticalStack.centerXAnchor),
            checkboxImage.topAnchor.constraint(equalTo: verticalStack.topAnchor, constant: 4)
        ])
        
        let checkboxText = UILabel()
        checkboxText.text = text
        checkboxText.font = UIFont.systemFont(ofSize: 12)
        checkboxText.numberOfLines = 2
        checkboxText.textAlignment = .center
        checkboxText.backgroundColor = .white
        
        verticalStack.addSubview(checkboxText)
        checkboxText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            checkboxText.topAnchor.constraint(equalTo: checkboxImage.bottomAnchor, constant: 6),
            checkboxText.leftAnchor.constraint(equalTo: verticalStack.leftAnchor),
            checkboxText.rightAnchor.constraint(equalTo: verticalStack.rightAnchor),
            checkboxText.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        return checkboxView
    }
}

extension MeView: MeViewInput {
    
    func setupOverallTimeLabel(_ timeString: String) {
        overallTime.text = "\(timeString)"
    }
    
    func setMeditationNumber(_ number: Int) {
        meditationNumber.text = "\(number)"
    }
    
    func setSessionSequenceText(_ number: Int) {
        sessionSequence.text = "\(number)"
    }
}
