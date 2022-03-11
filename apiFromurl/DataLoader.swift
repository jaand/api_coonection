//
//  DataLoader.swift
//  apiFromurl
//
//  Created by Guest123 on 06/03/2022.
//

import Foundation

public class DataLoader {
    
    @Published var userData = [UserData]()
    
    init() {
        loadFromInternet()
        sort()
    }
    
    func loadFromInternet() {
        
        if let url = URL(string: "https://beersapi.herokuapp.com/Beers") {
             
            URLSession.shared.dataTask(with: url) {data, response, error in
                if let data = data {
                    
                    do {
                        let jsonDecoder = JSONDecoder()
                        let dataFromJson = try jsonDecoder.decode([UserData].self, from: data)
                        
                        //print(dataFromJson)
                        self.userData = dataFromJson
                    }
                    catch let error {
                        print (error) }
                }
            }.resume()
        }
    }
    
    func load() {
        
        if let fileLocation = Bundle.main.url(forResource: "mydata", withExtension: "json") {
            
            //do catch in case of an error
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([UserData].self, from: data)
                
                self.userData = dataFromJson
            } catch {
                print(error)
            }
        }
    }
    
    func sort() {
        self.userData = self.userData.sorted(by: { $0.name < $1.name })
    }
}
