//
//  ModuleBuilder.swift
//  MVP Practice
//
//  Created by Dmitry Samusenko on 19.02.2023.
//

import UIKit

protocol ModuleBuilderProtocol: AnyObject {
    static func createMain() -> UIViewController
    static func createDetail(comment: Comment?) -> UIViewController
}

class ModuleBuilder: ModuleBuilderProtocol {

    static func createMain() -> UIViewController {
        let view = MainViewController()
        let networkService = NetworkService()
        let presenter = MainViewPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
    
    static func createDetail(comment: Comment?) -> UIViewController {
        let view = DetailViewController()
        let networkService = NetworkService()
        let presenter = DetailViewPresenter(view: view, networkService: networkService, comment: comment)
        view.presenter = presenter
        return view
    }
}
