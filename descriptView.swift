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
                Text(fruit.name)
                    .font(.largeTitle)
                    .frame(height: 90)
                    .frame(width: 200)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(20)
                    .bold()
                    
                Text("Id: \(fruit.id)")
                    .font(.title)
                    .bold()
                Text("Família: \(fruit.family)")
                    .font(.title)
                    .bold()
                Text("Ordem: \(fruit.order)")
                    .font(.title)
                    .bold()
                Text("Gênero: \(fruit.genus)")
                    .font(.title)
                    .bold()
                Text("Nutrição")
                    .font(.largeTitle)
                    .frame(height: 90)
                    .frame(width: 200)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(20)
                    .bold()
                Text("Calorias: \(fruit.nutritions.calories, specifier: "%.2f")")
                    .font(.title)
                    .bold()
                Text("gordura: \(fruit.nutritions.fat, specifier: "%.2f")")
                    .font(.title)
                    .bold()
                Text("açucar: \(fruit.nutritions.sugar, specifier: "%.2f")")
                    .font(.title)
                    .bold()
                Text("Carboidratos: \(fruit.nutritions.carbohydrates, specifier: "%.2f")")
                    .font(.title)
                    .bold()
                Text("Proteína: \(fruit.nutritions.protein, specifier: "%.2f")")
                    .font(.title)
                    .bold()
                Text("")
                    .padding(100)
                
            }.onAppear{
                file.fetch()
                    
            }.padding(.top ,80)
               
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

