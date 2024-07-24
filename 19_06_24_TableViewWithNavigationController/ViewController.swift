//
//  ViewController.swift
//  19_06_24_TableViewWithNavigationController
//
//  Created by Vishal Jagtap on 24/07/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var homeTableView: UITableView!
    private let reuseIdentifierForHomeTableViewCell = "HomeTableViewCell"
    private let reuseIdentifierForDetailsViewController = "DetailsViewController"
    
    var students = [
        Student(firstName: "Megha", lastName: "Wanjare", state: "Maharashtra"),
        Student(firstName: "Shrawani", lastName: "Kadam", state: "Maharashtra"),
        Student(firstName: "Bhakti", lastName: "Pawar", state: "Maharashtra"),
        Student(firstName: "Jaideep", lastName: "babar", state: "Maharashtra"),
        Student(firstName: "Saquib", lastName: "Surve", state: "Maharashtra"),
        Student(firstName: "Pallavi", lastName: "Gole", state: "Maharashtra")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializationOfViews()
        registerXIBWithTableView()
    }
    
    private func initializationOfViews(){
        homeTableView.delegate = self
        homeTableView.dataSource = self
    }
    
    private func registerXIBWithTableView(){
        let uiNib = UINib(nibName: reuseIdentifierForHomeTableViewCell, bundle: nil)
        self.homeTableView.register(uiNib, forCellReuseIdentifier: reuseIdentifierForHomeTableViewCell)
    }
}

extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let homeTableViewCell = self.homeTableView.dequeueReusableCell(withIdentifier: reuseIdentifierForHomeTableViewCell, for: indexPath) as! HomeTableViewCell
        
        homeTableViewCell.firstNameLabel.text = students[indexPath.row].firstName
        homeTableViewCell.lastNameLabel.text = students[indexPath.row].lastName
        homeTableViewCell.stateLabel.text = students[indexPath.row].state
        
        return homeTableViewCell
    }
}

extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 116.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsViewContorller = self.storyboard?.instantiateViewController(withIdentifier: reuseIdentifierForDetailsViewController) as! DetailsViewController
        detailsViewContorller.container = students[indexPath.row]
        navigationController?.pushViewController(detailsViewContorller, animated: true)
    }
}
