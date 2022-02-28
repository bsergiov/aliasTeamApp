//
//  ExtensionGameViewController.swift
//  aliasTeamApp
//
//  Created by Vitali on 28.02.2022.
//

import Foundation

extension GameViewController{
    
    func checkAnswer(senderBool: Bool){
        
        if senderBool{
            
        }else{
            
        }
        
       
        
    }
    
    
    
    
    
    func setupCard(){
        cardGameModelArray = CardGameModel.getCardsGame(with: categotyModels?.name ?? "")
        gameArray = cardGameModelArray
    }
    

    func startGetCard() -> CardGameModel{
        _ = gameArray?.shuffled()
        
        guard let checkGameArray = gameArray?.removeFirst() else{ return CardGameModel(cardWord: "", categoryName: "", point: 0)}
        
        return checkGameArray
        
        
    }
    
    
}
