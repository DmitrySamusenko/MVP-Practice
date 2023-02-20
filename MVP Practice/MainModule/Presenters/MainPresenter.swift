//
//  Presenter.swift
//  MVP Practice
//
//  Created by Dmitry Samusenko on 18.02.2023.
//

import Foundation
// Output Protocol
protocol MainViewProtocol: AnyObject {
    func success()
    func failure(error: Error)
}

protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol)
    func getComments()
    var comments: [Comment]? { get set}
}

class MainViewPresenter: MainViewPresenterProtocol {
    
    var comments: [Comment]?
    weak var view: MainViewProtocol?
    var networkService: NetworkServiceProtocol!
    
    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        getComments() // Сработает вместе с инициализатором
    }
    
    func getComments() {
        networkService.getComment { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let comments):
                    self.comments = comments
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
}
