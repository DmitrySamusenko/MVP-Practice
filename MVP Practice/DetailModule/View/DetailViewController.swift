//
//  DetailViewController.swift
//  MVP Practice
//
//  Created by Dmitry Samusenko on 20.02.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var commentLabel: UILabel!
    var presenter: DetailViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.pushComment()
    }

}

extension DetailViewController: DetailViewProtocol {
    func setComment(comment: Comment?) {
        commentLabel.text = comment?.body
    }
}
