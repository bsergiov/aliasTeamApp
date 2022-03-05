//
//  ExtensionGameViewController.swift
//  aliasTeamApp
//
//  Created by Vitali on 28.02.2022.
//

import Foundation

extension GameViewController{
    
    func checkAnswer(senderBool: Bool, scoreGame: Int, gameCard: Int) -> Int {
        var tempScore = scoreGame
        
        if senderBool{
            tempScore += gameCard
        } else {
            tempScore -= gameCard
            if tempScore < 1{
                tempScore = 0
            }
        }
        return tempScore
    }
    
    
    func setupCard(){
        gameArray = CardGameModel.getCardsGame(with: categotyModels?.name ?? "")
    }
    

    func startGetCard() -> CardGameModel {
        if gameArray!.count < 1 {
            setupCard()
        }
        var tempArray = gameArray?.shuffled()
        return (tempArray?.removeFirst())!
    }
}
