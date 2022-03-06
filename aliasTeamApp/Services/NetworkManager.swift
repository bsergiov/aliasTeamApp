//
//  NetworkManager.swift
//  aliasTeamApp
//
//  Created by BSergio on 23.02.2022.
//

import Foundation

protocol NetworkManagerDelegate {
    func didUpdateJoke(with model: JokesModel)
}

struct NetworkManager {
    let jokeURL = "https://v2.jokeapi.dev/joke/Any?type=single"
    var delegate: NetworkManagerDelegate?
    
    func performRequest() {
        guard let url = URL(string: jokeURL) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
            } else {
                guard let data = data else { return }
                guard let jokeModel = parseJSON(data) else { return }
                delegate?.didUpdateJoke(with: jokeModel)
            }
        }
        task.resume()
    }
    
    func parseJSON(_ data: Data) -> JokesModel? {
        let decoder = JSONDecoder()
        do {
            let decode = try decoder.decode(JokesModel.self, from: data)
            let joke = decode.joke
            let jokeModel = JokesModel(joke: joke)
            return jokeModel
        } catch {
            print(error)
            return nil
        }
    }
}
