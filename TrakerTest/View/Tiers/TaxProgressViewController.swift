//
//  TaxProgressViewController.swift
//  TrakerTest
//
//  Created by Ken Nyame on 5/4/21.
//

import UIKit

class TaxProgressViewController: UIViewController {

    var user: User?
    let progressCollectionView: UICollectionView = UICollectionView(frame: .zero)
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = user?.name
    }
    
    init(user: User) {
        self.user = user 
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
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
