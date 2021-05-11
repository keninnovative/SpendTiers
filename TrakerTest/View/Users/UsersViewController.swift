//
//  ViewController.swift
//  TrakerTest
//
//  Created by Ken Nyame on 5/4/21.
//

import UIKit

class UsersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let users = [User(name: "John Doe", spend: 20001),
                 User(name: "Richard Roe", spend: 5002),
                 User(name: "Jane Hoe", spend: 3600)]
    private let cellIdentifier = "UserTaxCell"
    let tableView = UITableView(frame: .zero)
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        self.title = "Users"
        
        tableView.tableFooterView = UIView()
        tableView.register(UserTaxCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true

        tableView.dataSource = self
        tableView.delegate = self
    }
    
    //MARK: - UITableViewDataSource, UITableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? UserTaxCell {
            cell.user = users[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = users[indexPath.row]
        self.navigationController?.pushViewController(TiersProgressViewController(user: user), animated: true)
    }

}

