//
//  CategoryCollectionViewCell.swift
//  aliasTeamApp
//
//  Created by Vitali on 24.02.2022.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IB Outlets
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    // MARK: - Public Methodes
    func configure(nameCategory: String){
        self.categoryLabel.text = nameCategory
        self.categoryLabel.textColor = .white
        self.cellView.layer.cornerRadius = 20
    }
}
