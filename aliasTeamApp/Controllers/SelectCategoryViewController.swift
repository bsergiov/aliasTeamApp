//
//  SelectCategoryViewController.swift
//  aliasTeamApp
//
//  Created by BSergio on 23.02.2022.
//

import UIKit

class SelectCategoryViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet weak var collectionView: UICollectionView!

    // MARK: - Public Property
    
    // MARK: - Private Property
    private let categoryArray:[String] = ["item1","item2","item3","item4"]
    // MARK: - Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
}

// MARK: - Private Methodes
extension SelectCategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.categoryArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return
    }
    
   
    
    
}
