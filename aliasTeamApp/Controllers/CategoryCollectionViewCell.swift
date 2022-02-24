//
//  CategoryCollectionViewCell.swift
//  aliasTeamApp
//
//  Created by Vitali on 24.02.2022.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    func configure(nameCategory: String){
        self.categoryLabel.text = nameCategory
        self.categoryLabel.textColor = .white
        self.cellView.layer.cornerRadius = 20
    }
    
    
    
}
