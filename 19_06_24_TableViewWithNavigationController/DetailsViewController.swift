//
//  DetailsViewController.swift
//  19_06_24_TableViewWithNavigationController
//
//  Created by Vishal Jagtap on 24/07/24.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    
    var container : Student?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindData()
    }
    
    private func bindData(){
        self.firstNameLabel.text = container?.firstName
        self.lastNameLabel.text = container?.lastName
        self.stateLabel.text = container?.state
    }
}
