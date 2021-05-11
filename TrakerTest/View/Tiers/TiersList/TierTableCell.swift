//
//  TierTableCell.swift
//  TrakerTest
//
//  Created by Tony Wang on 5/11/21.
//

import UIKit

class TierTableCell: UITableViewCell {

    var tier: Tier? {
        didSet {
            titleLabel.text = tier?.title
        }
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let checkedMarkLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "✓"
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
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true

        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        checkedMarkLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
    }
}
