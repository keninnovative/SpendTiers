//
//  UserTaxCell.swift
//  TrakerTest
//
//  Created by Ken Nyame on 5/5/21.
//

import UIKit

class UserTaxCell: UITableViewCell {
    
    var user: User? {
        didSet {
            userNameLabel.text = user?.name
            taxLabel.text = String(format: "$%0.2f", user!.spend)
        }
    }
    
    private let userNameLabel:UILabel = {
        let userLabel = UILabel(frame: .zero)
        userLabel.numberOfLines = 0
        userLabel.lineBreakMode = .byWordWrapping
        userLabel.translatesAutoresizingMaskIntoConstraints = false
        return userLabel
    }()
    
    private let spendLabel:UILabel = {
        let taxLabel = UILabel(frame: .zero)
        taxLabel.numberOfLines = 0
        taxLabel.lineBreakMode = .byWordWrapping
        taxLabel.translatesAutoresizingMaskIntoConstraints = false
        return taxLabel
    }()
    
    private lazy var stackView: UIStackView? = {
        let stackView = UIStackView(arrangedSubviews: [userNameLabel, spendLabel])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func commonInit() {
        backgroundColor = .white
        
        addSubview(stackView!)
        stackView?.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        stackView?.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12).isActive = true
        stackView?.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        stackView?.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true

    }

}
