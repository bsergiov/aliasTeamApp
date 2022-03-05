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
    
    @IBOutlet weak var pauseButtonOutlet: UIButton! {
        didSet{
            pauseButtonOutlet.layer.cornerRadius = pauseButtonOutlet.frame.height / 2
        }
    }
    @IBOutlet weak var plusButtonOutlet: UIButton! {
        didSet {
            plusButtonOutlet.layer.cornerRadius = plusButtonOutlet.frame.height / 2
        }
    }
    @IBOutlet weak var minusButtonOutlet: UIButton! {
        didSet {
            minusButtonOutlet.layer.cornerRadius = minusButtonOutlet.frame.height / 2
        }
    }
    
    @IBOutlet weak var imageViewOutlet: UIImageView!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var currentRaundLabel: UILabel!
    
    // MARK: - Public Property
    var selectedWord: String?
    var timer = Timer()
    var player: AVAudioPlayer?
    var networkManager = NetworkManager()
    var currentJoke = ""
    var currentTime = 60
    var round = 1
    var score = 0
    
    var categotyModels: CategoryModel?
    var gameArray: [CardGameModel]?
    var gameCard: CardGameModel?
    var cardGameModelArray: [CardGameModel]?
    
    // MARK: - Private Property
    private let radius: CGFloat = 80
    private var checkPlayPauseButton = true
    
    // MARK: - Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        networkManager.delegate = self
       
        setupCard()
        gameCard = startGetCard()
        setupStartScreenGame()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        runTimer()
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
        
        let image = UIImage(
            systemName: checkPlayPauseButton
            ? "play.fill"
            : "pause.fill"
        )
        pauseButtonOutlet.setImage(image, for: .normal)
        checkPlayPauseButton.toggle()
        
        controlPauseGame()
    }
}

// MARK: - Private Methodes
extension GameViewController {
    
    private func setupStartScreenGame() {
        wordLabel.text = selectedWord
        timerLabel.text = "Time: 60"
        scoreLabel.text = "Score: \(score)"
        currentRaundLabel.text = "Round: \(round)"
        wordLabel.text = gameCard?.cardWord
        
    }
    
    private func playSound(nameFile: String) {
        let url = Bundle.main.url(forResource: nameFile, withExtension: "mp3")
               player = try! AVAudioPlayer(contentsOf: url!)
        player!.play()
    }
    
    private func controlPauseGame() {
        
        plusButtonOutlet.isEnabled.toggle()
        minusButtonOutlet.isEnabled.toggle()
        checkPlayPauseButton ? runTimer() : pauseTimer()
//
//        if checkPlayPauseButton {
////            pauseButtonOutlet.setTitle("Resume", for: .normal)
//            pauseTimer()
//            plusButtonOutlet.isEnabled = false
//            minusButtonOutlet.isEnabled = false
//        } else {
////            pauseButtonOutlet.setTitle("Pause", for: .normal)
//            runTimer()
//            plusButtonOutlet.isEnabled = true
//            minusButtonOutlet.isEnabled = true
//        }
    }
}
