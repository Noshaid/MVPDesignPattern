//
//  ViewController.swift
//  MVPDesignPattern
//
//  Created by Noshaid Ali on 08/06/2021.
//

import UIKit

class UsersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UserPresenterDelegate {
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    private var users = [User]()
    private let presenter = UserPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Users"
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        //presenter
        presenter.setViewDelegate(delegate: self)
        presenter.getUsers()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.frame
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = users[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //ask presenter to handle the tap
        presenter.didTap(user: users[indexPath.row])
    }
    
    //presenter delegate methods
    func presentUsers(users: [User]) {
        self.users = users
        DispatchQueue.main.sync {
            self.tableView.reloadData()
        }
    }
    
    func presentAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

