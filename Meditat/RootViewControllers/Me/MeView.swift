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
    func setupCheckboxStyles(checboxNumber: Int, imageColor: UIColor, textColor: UIColor)
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
    
    var checkboxView1 = CheckboxView(text: "2 дня медитаций")
    var checkboxView2 = CheckboxView(text: "3 дня медитаций")
    var checkboxView3 = CheckboxView(text: "5 дней медитаций")
    var checkboxView4 = CheckboxView(text: "10 дней медитаций")
    var checkboxView5 = CheckboxView(text: "20 дней медитаций")
    var checkboxView6 = CheckboxView(text: "30 дней медитаций")
    
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
        view.backgroundColor = .systemBackground
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
        horizontalStackViewOne.distribution = .fillEqually
        horizontalStackViewOne.addArrangedSubview(checkboxView1)
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
        horizontalStackViewTwo.distribution = .fillProportionally
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
    
    func setupCheckboxStyles(checboxNumber: Int, imageColor: UIColor, textColor: UIColor) {
   
        switch checboxNumber {
        case 1:
            print("checboxNumber - 1")
            checkboxView1.checkboxImage.tintColor = imageColor
            checkboxView1.checkboxText.textColor = textColor
        case 2:
            print("checboxNumber - 2")
            checkboxView1.checkboxImage.tintColor = imageColor
            checkboxView1.checkboxText.textColor = textColor
            checkboxView2.checkboxImage.tintColor = imageColor
            checkboxView2.checkboxText.textColor = textColor
        case 3:
            print("checboxNumber - 3")
            checkboxView1.checkboxImage.tintColor = imageColor
            checkboxView1.checkboxText.textColor = textColor
            checkboxView2.checkboxImage.tintColor = imageColor
            checkboxView2.checkboxText.textColor = textColor
            checkboxView3.checkboxImage.tintColor = imageColor
            checkboxView3.checkboxText.textColor = textColor
        case 4:
            print("checboxNumber - 4")
            checkboxView1.checkboxImage.tintColor = imageColor
            checkboxView1.checkboxText.textColor = textColor
            checkboxView2.checkboxImage.tintColor = imageColor
            checkboxView2.checkboxText.textColor = textColor
            checkboxView3.checkboxImage.tintColor = imageColor
            checkboxView3.checkboxText.textColor = textColor
            checkboxView4.checkboxImage.tintColor = imageColor
            checkboxView4.checkboxText.textColor = textColor
        case 5:
            print("checboxNumber - 5")
            checkboxView1.checkboxImage.tintColor = imageColor
            checkboxView1.checkboxText.textColor = textColor
            checkboxView2.checkboxImage.tintColor = imageColor
            checkboxView2.checkboxText.textColor = textColor
            checkboxView3.checkboxImage.tintColor = imageColor
            checkboxView3.checkboxText.textColor = textColor
            checkboxView4.checkboxImage.tintColor = imageColor
            checkboxView4.checkboxText.textColor = textColor
            checkboxView5.checkboxImage.tintColor = imageColor
            checkboxView5.checkboxText.textColor = textColor
        case 6:
            print("checboxNumber - 6")
            checkboxView1.checkboxImage.tintColor = imageColor
            checkboxView1.checkboxText.textColor = textColor
            checkboxView2.checkboxImage.tintColor = imageColor
            checkboxView2.checkboxText.textColor = textColor
            checkboxView3.checkboxImage.tintColor = imageColor
            checkboxView3.checkboxText.textColor = textColor
            checkboxView4.checkboxImage.tintColor = imageColor
            checkboxView4.checkboxText.textColor = textColor
            checkboxView5.checkboxImage.tintColor = imageColor
            checkboxView5.checkboxText.textColor = textColor
            checkboxView6.checkboxImage.tintColor = imageColor
            checkboxView6.checkboxText.textColor = textColor
        default: return
        }
    }
    
}
