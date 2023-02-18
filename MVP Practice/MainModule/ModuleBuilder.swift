//
//  ModuleBuilder.swift
//  MVP Practice
//
//  Created by Dmitry Samusenko on 18.02.2023.
//

import UIKit

protocol Builder {
    static func createMainModule() -> UIViewController
    }

class ModuleBuilder: Builder {
    
    static func createMainModule() -> UIViewController {
        let view = MainViewController()
        let model = Person(firstName: "Dmitry", secondName: "Samusenko")
        let presenter = MainPresenter(view: view, person: model)
        view.presenter = presenter
        return view
    }
    
    
}
