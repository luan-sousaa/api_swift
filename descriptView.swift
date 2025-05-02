//
//  descriptView.swift
//  apis_json
//
//  Created by luan on 02/05/25.
//

import SwiftUI

struct descriptView: View {
    @StateObject  var file = ViewModel()
    var fruit: Fruit
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.green, Color.yellow]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/).edgesIgnoringSafeArea(.all)
            VStack {
                Text("Fruta: \(fruit.name)")
                    .font(.largeTitle)
                    .frame(height: 50)
                    .foregroundColor(.black)
                Text("Id: \(fruit.id)")
                Text("Família: \(fruit.family)")
                Text("Ordem: \(fruit.order)")
                Text("Gênero: \(fruit.genus)")
                Text("Nutrição")
                    .font(.largeTitle)
                    .frame(height: 50)
                    .foregroundColor(.black)
                Text("Calorias: \(fruit.nutritions.calories, specifier: "%.2f")")
                Text("gordura: \(fruit.nutritions.fat, specifier: "%.2f")")
                Text("açucar: \(fruit.nutritions.sugar, specifier: "%.2f")")
                Text("Carboidratos: \(fruit.nutritions.carbohydrates, specifier: "%.2f")")
                Text("Proteína: \(fruit.nutritions.protein, specifier: "%.2f")")
                Text("")
                    .padding(100)
                
            }.onAppear{
                file.fetch()
                
            }
        }}
}



#Preview {
    descriptView(fruit: Fruit(
        name: "Maçã",
        id: 1,
        family: "Rosaceae",
        order: "Rosales",
        genus: "Malus",
        nutritions: nutrition(
            calories: 52.0,
            fat: 0.17,
            sugar: 10.39,
            carbohydrates: 13.81,
            protein: 0.26
        )
    ))
}

