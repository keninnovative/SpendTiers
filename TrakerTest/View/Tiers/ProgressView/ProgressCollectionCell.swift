//
//  ProgressCollectionCell.swift
//  TrakerTest
//
//  Created by Ken Nyame on 5/10/21.
//

import UIKit

class ProgressCollectionCell: UICollectionViewCell {
        
    var progress: Progress? {
        didSet {
            tierFromLabel.text = String(format: "$%0.1fk", progress!.tier.from/1000.0)
            tierToLabel.text = String(format: "$%0.1fk", progress!.tier.to/1000.0)

            if progress!.spend < progress!.tier.from {
                progressBar.setProgress(0.0, animated: true)
                msgLabel.text = "Not yet started"
            }
            else if progress!.spend >= progress!.tier.to {
                progressBar.setProgress(1.0, animated: true)
                msgLabel.text = String(format: "You’ve reached %@", progress!.tier.title)
            }
            else {
                let progressRatio = Float((progress!.spend - progress!.tier.from)/(progress!.tier.to - progress!.tier.from))
                progressBar.setProgress(progressRatio, animated: true)
                
                let amountUntil = progress!.tier.to - progress!.spend
                msgLabel.text = String(format: "$%.f until your next tier", amountUntil)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let tierFromLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let tierToLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let progressBar: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .default)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()
    
    private let msgLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var progressStackView:UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [tierFromLabel, progressBar, tierToLabel])
        stackView.spacing = 6
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var stackView:UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [progressStackView, msgLabel])
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.alignment  = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private func commonInit() {
        backgroundColor = .white
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = 8
        
        addSubview(stackView)
        
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        
        tierFromLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 0).isActive = true
        tierToLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 0).isActive = true
        
        progressBar.heightAnchor.constraint(equalToConstant: 10).isActive = true

    }
}
