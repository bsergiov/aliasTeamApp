//
//  GameViewControllerExtensions.swift
//  aliasTeamApp
//
//  Created by Кристина Максимова on 27.02.2022.
//

import Foundation
import UIKit


extension GameViewController {
    
    func runTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: TimeInterval(1), repeats: true, block: { timer in
            self.timerLabel.text = "Осталось: \(self.currentTime)"
            self.currentTime -= Int(timer.timeInterval)
            if self.currentTime == 0 && self.round != 4 {
//                self.playTimerSound()
                self.presentRoundAlert()
                timer.invalidate()
            } else if self.round == 4 && self.currentTime == 0 {
                self.presentFinishAlert()
                timer.invalidate()
            }
        })
    }
    
    func pauseTimer()  {
        timer.invalidate()
    }
    
    func presentRoundAlert() {
        let roundAlert = UIAlertController(title: "Раунд завершен!", message: "Текущий счет: \(scoreLabel.text!)", preferredStyle: .alert)
        let nextRound = UIAlertAction(title: "Следующий раунд", style: .default) { _ in
            self.currentTime = 60
            self.round += 1
            self.runTimer()
        }
        let finish = UIAlertAction(title: "Закончить игру", style: .cancel) { _ in
            self.navigationController?.popViewController(animated: true)
        }
        roundAlert.addAction(nextRound)
        roundAlert.addAction(finish)
        present(roundAlert, animated: true, completion: nil)
    }
    
    func presentFinishAlert() {
        let finishAlert = UIAlertController(title: "Игра завершена!", message: "Текущий счет: \(scoreLabel.text!)", preferredStyle: .alert)
        let exitGame = UIAlertAction(title: "Выйти из игры", style: .cancel) { _ in
            self.navigationController?.popViewController(animated: true)
        }
        finishAlert.addAction(exitGame)
        present(finishAlert, animated: true, completion: nil)
    }
}
