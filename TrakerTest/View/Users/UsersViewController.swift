//
//  ViewController.swift
//  TrakerTest
//
//  Created by Ken Nyame on 5/4/21.
//

import UIKit

class UsersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var users = [User(name: "John Doe", spend: 20001),
                 User(name: "Richard Roe", spend: 5002),
                 User(name: "Jane Hoe", spend: 3600)]
    private let cellIdentifier = "UserTaxCell"
    private let tableView = UITableView(frame: .zero)
    private var addButton: UIBarButtonItem?
    
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
        
        // user add button on the right of navigation bar
        addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(onAddUser(sender:)))
        navigationItem.rightBarButtonItem = addButton
        
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
    
    @objc func onAddUser(sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "New User", message: "Add name and spend", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "user name"
            textField.keyboardType = .default
        }
        alert.addTextField { textField in
            textField.placeholder = "$spend"
            textField.keyboardType = .decimalPad
        }
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { [weak self] action in
            guard let nameTextField = alert.textFields?.first,
                  let userName = nameTextField.text else {
                return
            }
            guard let spendTextField = alert.textFields?[1],
                  let spend = spendTextField.text else {
                return
            }
            
            self?.users.append(User(name: userName, spend: Double(spend)!))
            self?.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
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

