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
    var selectedWord: String?
    var player: AVAudioPlayer?
    var timer = Timer()
    var networkManager = NetworkManager()
    var currentJoke = ""
    var currentTime = 60
    var round = 1
    var score = 0
    // MARK: - Private Property
    private let radius: CGFloat = 40
    
    // MARK: - Life Cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.plusButtonOutlet.layer.cornerRadius = radius * 2
        self.minusButtonOutlet.layer.cornerRadius = radius * 2
        self.pauseButtonOutlet.layer.cornerRadius = radius / 2
        self.wordLabel.text = self.selectedWord
        timerLabel.text = "Time: 60"
        networkManager.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        runTimer()
    }
    
    // MARK: - @IBAction
    
    
    @IBAction func buttonSelectAnswer(_ sender: UIButton) {
    }
    
    @IBAction func buttonPause(_ sender: UIButton) {
        
        if pauseButtonOutlet.titleLabel?.text == "Pause"{
            pauseButtonOutlet.setTitle("Resume", for: .normal)
            pauseTimer()
            plusButtonOutlet.isEnabled = false
            minusButtonOutlet.isEnabled = false
        } else {
            pauseButtonOutlet.setTitle("Pause", for: .normal)
            runTimer()
            plusButtonOutlet.isEnabled = true
            minusButtonOutlet.isEnabled = true
        }
    }
}
