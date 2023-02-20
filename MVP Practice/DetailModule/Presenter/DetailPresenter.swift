//
//  DetailPresenter.swift
//  MVP Practice
//
//  Created by Dmitry Samusenko on 20.02.2023.
//

import Foundation

protocol DetailViewProtocol: AnyObject {
    func setComment(comment: Comment?)
}

protocol DetailViewPresenterProtocol: AnyObject {
    init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, comment: Comment? )
    func pushComment()
}

class DetailViewPresenter: DetailViewPresenterProtocol {
    weak var view: DetailViewProtocol?
    let networkService: NetworkServiceProtocol!
    var comment: Comment?
    required init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, comment: Comment?) {
        self.view = view
        self.networkService = networkService
        self.comment = comment
    }
    
    func pushComment() {
        self.view?.setComment(comment: comment)
    }
    
    
}
