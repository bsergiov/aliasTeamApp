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
        }else{
            tempScore -= gameCard
            if tempScore < 1{
                tempScore = 0
            }
        }
    
       return tempScore
        
    }
    

    func setupCard(){
        cardGameModelArray = CardGameModel.getCardsGame(with: categotyModels?.name ?? "")
        gameArray = cardGameModelArray
    }
    

    func startGetCard() -> CardGameModel{
        _ = gameArray?.shuffled()
        guard let checkGameArray = gameArray?.removeFirst() else{
            setupCard()
            return gameArray?.first ?? CardGameModel(cardWord: "", categoryName: "", point: 0)}

        return checkGameArray
        
        
    }
    
    
}
