//
//  ModuleBuilder.swift
//  MVP Practice
//
//  Created by Dmitry Samusenko on 19.02.2023.
//

import UIKit

protocol ModuleBuilderProtocol: AnyObject {
    static func createMain() -> UIViewController
}

class ModuleBuilder: ModuleBuilderProtocol {
    static func createMain() -> UIViewController {
        let view = MainViewController()
        let person = Person(firstName: "Dmitry", secondName: "Samusenko")
        let presenter = MainViewPresenter(view: view, person: person)
        view.presenter = presenter
        return view
    }
    
    
}
