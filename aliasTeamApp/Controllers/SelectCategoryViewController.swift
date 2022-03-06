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
    
    // MARK: - Private Property
    private var categoryArray = CategoryModel.getCategorys()
    
    // MARK: - Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 1, green: 0.6, blue: 0.4823529412, alpha: 1)
    }
}

// MARK: - UICollectionViewDelegate and UICollectionViewDataSource
extension SelectCategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categoryArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as? CategoryCollectionViewCell else{return UICollectionViewCell()}
        
        cell.configure(nameCategory: self.categoryArray[indexPath.row].name)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
        // переход на GameViewController и передача свойства
        let controller = storyboard?.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        controller.categotyModels = categoryArray[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension SelectCategoryViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let side = collectionView.frame.size.width
        return CGSize(width: side, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
        
        35
    }
}
