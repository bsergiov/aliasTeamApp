//
//  GameViewController.swift
//  aliasTeamApp
//
//  Created by Vitali on 24.02.2022.
//

import UIKit

class GameViewController: UIViewController {

    // MARK: - IB Outlets

    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var pauseButtonOutlet: UIButton!
    @IBOutlet weak var plusButtonOutlet: UIButton!
    @IBOutlet weak var minusButtonOutlet: UIButton!
    @IBOutlet weak var imageViewOutlet: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
 
    // MARK: - Public Property
    var categotyModels: CategoryModel?
    
    var gameArray: [CardGameModel]?
    var gameCard: CardGameModel?
    var cardGameModelArray: [CardGameModel]?

    // MARK: - Private Property
    private let radius: CGFloat = 40
    

    // MARK: - Life Cicle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.plusButtonOutlet.layer.cornerRadius = radius * 2
        self.minusButtonOutlet.layer.cornerRadius = radius * 2
        self.pauseButtonOutlet.layer.cornerRadius = radius / 2
        
        setupCard()
        gameCard = startGetCard()
        
        wordLabel.text = gameCard?.cardWord
    }
    
 
    // MARK: - @IBAction


    @IBAction func buttonSelectAnswer(_ sender: UIButton) {
        
        
        if sender.titleLabel?.text == "+"{
            print("+")
        }else{
            print("-")
        }
    }
    
    
    @IBAction func buttonPause(_ sender: UIButton) {
        
        if pauseButtonOutlet.titleLabel?.text == "Pause"{
            
            pauseButtonOutlet.setTitle("Resume", for: .normal)
        }else{
            
            pauseButtonOutlet.setTitle("Pause", for: .normal)
        }
        
    }
    
    
}
