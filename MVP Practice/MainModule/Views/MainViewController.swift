//
//  ViewController.swift
//  MVP Practice
//
//  Created by Dmitry Samusenko on 18.02.2023.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet var greetingLabel: UILabel!
    
    var presenter: MainViewPresenterProtocol! // Инъекция зависимости снаружи
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func didTapButtonAction(_ sender: Any) {
        self.presenter.showGreeting()
    }
}

extension MainViewController: MainViewProtocol {
    func setGreeting(greeting: String) {
        self.greetingLabel.text = greeting
    }
    
    
}
