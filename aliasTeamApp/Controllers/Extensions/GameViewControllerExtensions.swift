//
//  GameViewControllerExtensions.swift
//  aliasTeamApp
//
//  Created by Кристина Максимова on 27.02.2022.
//

import Foundation
import UIKit
import AVFAudio


extension GameViewController {
    
    func runTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: TimeInterval(1), repeats: true, block: { timer in
            self.timerLabel.text = "Time: \(self.currentTime)"
            self.currentTime -= Int(timer.timeInterval)
            if self.currentTime == 0 && self.round != 4 {
                self.playTimerSound()
                self.presentRoundAlert()
                timer.invalidate()
            } else if self.round == 4 && self.currentTime == 0 {
                self.playTimerSound()
                self.presentFinishAlert()
                timer.invalidate()
            }
        })
    }
    
    func pauseTimer()  {
        timer.invalidate()
    }
    
    func presentRoundAlert() {
        let roundAlert = UIAlertController(title: "Round \(round) completed!", message: "Current account: \(score)", preferredStyle: .alert)
        let nextRound = UIAlertAction(title: "Next round", style: .default) { _ in
            self.currentTime = 60
            self.round += 1
            self.runTimer()
        }
        let finish = UIAlertAction(title: "Finish the game", style: .cancel) { _ in
            self.navigationController?.popViewController(animated: true)
        }
        roundAlert.addAction(nextRound)
        roundAlert.addAction(finish)
        present(roundAlert, animated: true, completion: nil)
    }
    
    func presentFinishAlert() {
        let finishAlert = UIAlertController(title: "Game over!", message: "Current account: \(score)", preferredStyle: .alert)
        let exitGame = UIAlertAction(title: "Quit the game", style: .cancel) { _ in
            self.navigationController?.popViewController(animated: true)
        }
        finishAlert.addAction(exitGame)
        present(finishAlert, animated: true, completion: nil)
    }
    
    func playTimerSound() {
        guard let url = Bundle.main.url(forResource: "timer", withExtension: "mp3") else { return }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print(error)
        }
    }
}
