//
//  Presenter.swift
//  MVP Practice
//
//  Created by Dmitry Samusenko on 18.02.2023.
//

import Foundation
// Output Protocol
protocol MainViewProtocol: AnyObject {
    func setGreeting(greeting: String)
}

protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, person: Person)
    func showGreeting()
}

class MainViewPresenter: MainViewPresenterProtocol {
    var view: MainViewProtocol
    var person: Person
    
    required init(view: MainViewProtocol, person: Person) {
        self.view = view
        self.person = person
    }
    
    func showGreeting() {
        let greeting = "Hello World! This is \(person.firstName) \(person.secondName)!"
        self.view.setGreeting(greeting: greeting)
    }
}
