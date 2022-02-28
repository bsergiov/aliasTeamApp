//
//  GameViewController.swift
//  aliasTeamApp
//
//  Created by Vitali on 24.02.2022.
//

import UIKit
import AVFoundation

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
    private var player: AVAudioPlayer?
    private let radius: CGFloat = 40
    private var score = 0
    
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
      
        var tempScore = score

        if sender.titleLabel?.text == "+"{
            tempScore = checkAnswer(senderBool: true, scoreGame: score, gameCard: gameCard!.point)
            playSound(nameFile: "well")
        }else{
            tempScore = checkAnswer(senderBool: false, scoreGame: score, gameCard: gameCard!.point)
            playSound(nameFile: "skip")

        }
        score = tempScore
        scoreLabel.text = "Score: \(score)"
        gameCard = startGetCard()
        wordLabel.text = gameCard?.cardWord
    }
    
    
    @IBAction func buttonPause(_ sender: UIButton) {
        
        if pauseButtonOutlet.titleLabel?.text == "Pause"{
            
            pauseButtonOutlet.setTitle("Resume", for: .normal)
        }else{
            
            pauseButtonOutlet.setTitle("Pause", for: .normal)
        }
        
    }
   
    // MARK: - Func()


    func playSound(nameFile: String) {
     
        let url = Bundle.main.url(forResource: nameFile, withExtension: "mp3")
               player = try! AVAudioPlayer(contentsOf: url!)
        player!.play()

    }
    
}
