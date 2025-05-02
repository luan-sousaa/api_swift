//
//  File.swift
//  apis_json
//
//  Created by Turma02-15 on 29/04/25.
//

import Foundation

struct Fruit : Identifiable, Codable {
    let name: String
    let id: Int
    let family: String
    let order: String
    let genus: String
    let nutritions : nutrition
}
struct nutrition: Codable{
    let calories: Double
    let fat: Double
    let sugar: Double
    let carbohydrates: Double
    let protein: Double
}

class ViewModel: ObservableObject{
    @Published var frutas: [Fruit] = []
    
    func fetch(){
        guard let url = URL(string: "https://www.fruityvice.com/api/fruit/all") else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ data, response, error in
            guard let  data = data, error  == nil else{
                return
            }
            do {
                let parsed = try JSONDecoder().decode([Fruit].self, from: data)
                DispatchQueue.main.async{
                    
                    self.frutas = parsed
                }
            } catch{
                print(error)
            }
        }
        
       
        
        task.resume()
    }
}
