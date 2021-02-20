//
//  ViewController.swift
//  Meditat
//
//  Created by Kirpichnikov on 2021/2/19.
//

import UIKit

class MeditationVC: UIViewController {
    
    let button1 = Button(title: "СОН")
    let button2 = Button(title: "ПАУЗА")
    let button3 = Button(title: "НА РАБОТЕ")
    let button4 = Button(title: "СЛОЖНЫЙ ДЕНЬ")
    let button5 = Button(title: "НА ПРОГУЛКЕ")
    let button6 = Button(title: "SOS")
    let button7 = Button(title: "УТРО")
    let button8 = Button(title: "ПОСЛЕ РАБОТЫ")
    let button9 = Button(title: "БОЛЬШОЕ СОБЫТИЕ")
    let button10 = Button(title: "В ДОРОГЕ")
    
    
    let firstHStack = UIStackView()
    let secondHStack = UIStackView()
    let thirdHStack = UIStackView()
    let fourthHStack = UIStackView()
    let VStack = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        setupNavigation()
        setupLayout()
    }
    
    private func setupNavigation() {
        navigationController?.navigationBar.prefersLargeTitles = true
        //self.title = "Что вы делаете?"
    }
    
    private func setupLayout() {
        setupButton1()
        setupButton2()
        setupButton3()
        setupButton4()
        setupButton5()
        setupButton6()
        setupButton7()
        setupButton8()
        setupButton9()
        setupButton10()
    }
    
    private func setupButton1() {
        view.addSubview(button1)
        button1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 44),
            button1.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 25),
            button1.widthAnchor.constraint(equalToConstant: view.bounds.size.width/2.5),
            button1.heightAnchor.constraint(equalToConstant: 72)
        ])
        button1.backgroundColor = .systemPink
    }
    
    private func setupButton2() {
        view.addSubview(button2)
        button2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 44),
            button2.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -25),
            button2.widthAnchor.constraint(equalToConstant: view.bounds.size.width/2.5),
            button2.heightAnchor.constraint(equalToConstant: 72)
        ])
        button2.backgroundColor = .systemPink
    }
    
    private func setupButton3() {
        view.addSubview(button3)
        button3.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button3.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 23),
            button3.leftAnchor.constraint(equalTo: button1.leftAnchor),
            button3.widthAnchor.constraint(equalToConstant: view.bounds.size.width/2.5),
            button3.heightAnchor.constraint(equalToConstant: 72)
        ])
        button3.backgroundColor = .systemPink
    }
    
    private func setupButton4() {
        view.addSubview(button4)
        button4.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button4.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 23),
            button4.rightAnchor.constraint(equalTo: button2.rightAnchor),
            button4.widthAnchor.constraint(equalToConstant: view.bounds.size.width/2.5),
            button4.heightAnchor.constraint(equalToConstant: 72)
        ])
        button4.backgroundColor = .systemPink
    }
    
    private func setupButton5() {
        view.addSubview(button5)
        button5.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button5.topAnchor.constraint(equalTo: button3.bottomAnchor, constant: 23),
            button5.leftAnchor.constraint(equalTo: button3.leftAnchor),
            button5.widthAnchor.constraint(equalToConstant: view.bounds.size.width/2.5),
            button5.heightAnchor.constraint(equalToConstant: 72)
        ])
        button5.backgroundColor = .systemPink
    }
    
    private func setupButton6() {
        view.addSubview(button6)
        button6.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button6.topAnchor.constraint(equalTo: button4.bottomAnchor, constant: 23),
            button6.rightAnchor.constraint(equalTo: button4.rightAnchor),
            button6.widthAnchor.constraint(equalToConstant: view.bounds.size.width/2.5),
            button6.heightAnchor.constraint(equalToConstant: 72)
        ])
        button6.backgroundColor = .systemPink
    }
    
    private func setupButton7() {
        view.addSubview(button7)
        button7.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button7.topAnchor.constraint(equalTo: button5.bottomAnchor, constant: 23),
            button7.leftAnchor.constraint(equalTo: button5.leftAnchor),
            button7.widthAnchor.constraint(equalToConstant: view.bounds.size.width/2.5),
            button7.heightAnchor.constraint(equalToConstant: 72)
        ])
        button7.backgroundColor = .systemPink
    }
    
    private func setupButton8() {
        view.addSubview(button8)
        button8.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button8.topAnchor.constraint(equalTo: button6.bottomAnchor, constant: 23),
            button8.rightAnchor.constraint(equalTo: button6.rightAnchor),
            button8.widthAnchor.constraint(equalToConstant: view.bounds.size.width/2.5),
            button8.heightAnchor.constraint(equalToConstant: 72)
        ])
        button8.backgroundColor = .systemPink
    }
    
    private func setupButton9() {
        view.addSubview(button9)
        button9.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button9.topAnchor.constraint(equalTo: button7.bottomAnchor, constant: 23),
            button9.leftAnchor.constraint(equalTo: button7.leftAnchor),
            button9.widthAnchor.constraint(equalToConstant: view.bounds.size.width/2.5),
            button9.heightAnchor.constraint(equalToConstant: 72)
        ])
        button9.backgroundColor = .systemPink
    }
    
    private func setupButton10() {
        view.addSubview(button10)
        button10.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button10.topAnchor.constraint(equalTo: button8.bottomAnchor, constant: 23),
            button10.rightAnchor.constraint(equalTo: button8.rightAnchor),
            button10.widthAnchor.constraint(equalToConstant: view.bounds.size.width/2.5),
            button10.heightAnchor.constraint(equalToConstant: 72)
        ])
        button10.backgroundColor = .systemPink
    }
    
}


/*private func setupLayout() {
    configureButtons()
    HStackOne()
}
 


private func configureButtons() {
    view.addSubview(button1)
    view.addSubview(button2)
    
    NSLayoutConstraint.activate([
        button1.widthAnchor.constraint(equalToConstant: 20)
    ])
}

private func HStackOne() {
    firstHStack.axis = .horizontal
    firstHStack.distribution = .fillEqually
    firstHStack.addArrangedSubview(button1)
    firstHStack.addArrangedSubview(button2)
    firstHStack.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
        firstHStack.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
        firstHStack.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
        firstHStack.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    ])
}

private func HStackTwo() {
    secondHStack.axis = .horizontal
    secondHStack.distribution = .fillEqually
    secondHStack.addArrangedSubview(button3)
    secondHStack.addArrangedSubview(button4)
    secondHStack.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
        secondHStack.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
        secondHStack.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
        secondHStack.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    ])
}

private func HStackThree() {
    thirdHStack.axis = .horizontal
    thirdHStack.distribution = .fillEqually
    thirdHStack.addArrangedSubview(button5)
    thirdHStack.addArrangedSubview(button6)
    thirdHStack.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
        thirdHStack.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
        thirdHStack.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
        thirdHStack.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    ])
}

private func HStackFour() {
    fourthHStack.axis = .horizontal
    fourthHStack.distribution = .fillEqually
    fourthHStack.addArrangedSubview(button7)
    fourthHStack.addArrangedSubview(button8)
    fourthHStack.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
        fourthHStack.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
        fourthHStack.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
        fourthHStack.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    ])
}

private func setupVStack() {
    VStack.axis = .vertical
    VStack.distribution = .fillEqually
    VStack.addArrangedSubview(firstHStack)
    VStack.addArrangedSubview(secondHStack)
    VStack.addArrangedSubview(thirdHStack)
    VStack.addArrangedSubview(fourthHStack)
    
    NSLayoutConstraint.activate([
        VStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        VStack.leftAnchor.constraint(equalTo: view.leftAnchor),
        VStack.rightAnchor.constraint(equalTo: view.rightAnchor),
        VStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
}*/

