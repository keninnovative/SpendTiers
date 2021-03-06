//
//  TierTableCell.swift
//  TrakerTest
//
//  Created by Ken Nyame on 5/11/21.
//

import UIKit

class TierTableCell: UITableViewCell {

    var tierProgress: Progress? {
        didSet {
            titleLabel.text = tierProgress?.tier.title
            if tierProgress!.spend < tierProgress!.tier.to {
                checkedMarkLabel.text = ""
            }
            else {
                checkedMarkLabel.text = "✓"
            }
        }
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let checkedMarkLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .blue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel,checkedMarkLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        backgroundColor = .white
        addSubview(stackView)
        
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true

        titleLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 0).isActive = true
        checkedMarkLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 0).isActive = true
    }
}
