//
//  ViewController.swift
//  MVP Practice
//
//  Created by Dmitry Samusenko on 18.02.2023.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet var greetingLabel: UILabel!
   // Make presenter without strong link to class
    var presenter: MainViewPresenterProtocol!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
}
    
    @IBAction func didTapButtonAction(_ sender: Any) {
        presenter.showGreeting()
    }
}

extension MainViewController: MainViewProtocol {
    func setGreeting(greeting: String) {
        DispatchQueue.main.async {
            self.greetingLabel.text = greeting
        }
    }
}




