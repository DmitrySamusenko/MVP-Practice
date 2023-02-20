//
//  ViewController.swift
//  MVP Practice
//
//  Created by Dmitry Samusenko on 18.02.2023.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
 
   // Make presenter without strong link to class
    var presenter: MainViewPresenterProtocol!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.delegate = self
        tableView.dataSource = self
}
    

}
extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.comments?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let comment = presenter.comments?[indexPath.row].body
        cell.textLabel?.text = comment
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let comment = presenter.comments?[indexPath.row]
        let detailViewController = ModuleBuilder.createDetail(comment: comment)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    
}

extension MainViewController: MainViewProtocol {
    func success() {
        tableView.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
    

}




