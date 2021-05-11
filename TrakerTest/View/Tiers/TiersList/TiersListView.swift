//
//  TiersListView.swift
//  TrakerTest
//
//  Created by Ken Nyame on 5/11/21.
//

import UIKit

class TiersListView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.register(TierTableCell.self, forCellReuseIdentifier: CellIdentifiers.tierTableCellId)
        tableView.tableFooterView = UIView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        backgroundColor = .white
        addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true

    }
}
