//
//  RullesViewController.swift
//  aliasTeamApp
//
//  Created by BSergio on 23.02.2022.
//

import UIKit

class RullesViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet weak var bodyLabel: UILabel!
    
    // MARK: - LifeCicle
    override func viewDidLoad() {
        super.viewDidLoad()

        bodyLabel.text = RullesModel.textBody
    }
    
    // MARK: - IB Action
    @IBAction func closeTapped() {
        dismiss(animated: true)
    }
    

}
