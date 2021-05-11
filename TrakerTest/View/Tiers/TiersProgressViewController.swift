//
//  TaxProgressViewController.swift
//  TrakerTest
//
//  Created by Ken Nyame on 5/4/21.
//

import UIKit

class TiersProgressViewController: UIViewController {

    var user: User?
    var arrProgress: [Progress]?
    
    let progresssView: TiersProgressView = TiersProgressView(frame: .zero)
    let tiersListView: TiersListView = TiersListView(frame: .zero)
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [progresssView, tiersListView])
        stackView.axis = .vertical
        stackView.spacing = 60
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = user?.name
        view.backgroundColor = .white
        fetchProgressArray()
        
        view.addSubview(stackView)
        tiersListView.tableView.delegate = self
        tiersListView.tableView.dataSource = self
        
        progresssView.collectionView.dataSource = self
        progresssView.collectionView.delegate = self
        
        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        progresssView.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 0).isActive = true
        progresssView.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: 100).isActive = true
        progresssView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 0).isActive = true
        progresssView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 0).isActive = true
        
        tiersListView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 0).isActive = true
        tiersListView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 0).isActive = true
        tiersListView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 0).isActive = true

        //tiersListView.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: 60).isActive = true

    }
    
    init(user: User) {
        self.user = user 
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func fetchProgressArray() {
        arrProgress = [Progress]()
        for tier in tiers {
            let progress = Progress(tier: tier, spend: user!.spend)
            arrProgress?.append(progress)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

extension TiersProgressViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tiers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.tierTableCellId, for: indexPath) as? TierTableCell {
            cell.tier = tiers[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
}

extension TiersProgressViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrProgress!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifiers.progressCollectionCellId, for: indexPath) as? ProgressCollectionCell {
            cell.progress = arrProgress![indexPath.row]
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}
