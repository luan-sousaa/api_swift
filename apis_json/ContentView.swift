//
//  ContentView.swift
//  apis_json
//
//  Created by Turma02-15 on 29/04/25.
//

import SwiftUI

import Foundation


struct ContentView: View {
    @StateObject  var file = ViewModel()
    @State private var selectedfruit: Fruit? = nil
    @State private var issheetpresent = false
    var body: some View {
        ZStack{
            RadialGradient(gradient: Gradient(colors: [Color.orange, Color.green]), center: .center, startRadius: /*@START_MENU_TOKEN@*/5/*@END_MENU_TOKEN@*/, endRadius: /*@START_MENU_TOKEN@*/500/*@END_MENU_TOKEN@*/).edgesIgnoringSafeArea(.all)
            
            ScrollView{
                VStack {
                    ForEach(file.frutas){ Fruit in
                        Text(Fruit.name)
                            .font(.title)
                            .frame(height: 50)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(30)
                            .padding(15)
                            .onTapGesture {
                                selectedfruit = Fruit
                                issheetpresent = true
                            }
                    }
                    
                    
                }.onAppear{
                    file.fetch()
                }
            }
        }
        .sheet(isPresented: $issheetpresent) {
            if let selectedfruit = selectedfruit {
                    descriptView(fruit: selectedfruit)
                }
        }
    }
}

#Preview {
    ContentView()
}
