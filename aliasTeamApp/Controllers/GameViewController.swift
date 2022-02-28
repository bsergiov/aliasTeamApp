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
    private let radius: CGFloat = 80
    private var score = 0
    private var checkPlayPauseButton = true
    // MARK: - Life Cicle

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        setupCard()
        gameCard = startGetCard()
        wordLabel.text = gameCard?.cardWord
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.plusButtonOutlet.layer.cornerRadius = plusButtonOutlet.frame.width / 2
        self.minusButtonOutlet.layer.cornerRadius = minusButtonOutlet.frame.width / 2
        self.pauseButtonOutlet.layer.cornerRadius = pauseButtonOutlet.frame.width / 2
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
        
        if checkPlayPauseButton{
            
           let play =  UIImage.init(systemName: "play.fill")
            
            pauseButtonOutlet.setImage(play, for: .normal)
           // pauseButtonOutlet.setTitle("Resume", for: .normal)
            checkPlayPauseButton = false
        }else{
            let pause =  UIImage.init(systemName: "pause.fill")
             pauseButtonOutlet.setImage(pause, for: .normal)
            checkPlayPauseButton = true

        }
        
    }
   
    // MARK: - Func()


    func playSound(nameFile: String) {
     
        let url = Bundle.main.url(forResource: nameFile, withExtension: "mp3")
               player = try! AVAudioPlayer(contentsOf: url!)
        player!.play()

    }
    
}
