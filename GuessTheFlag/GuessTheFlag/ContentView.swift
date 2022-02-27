//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Amine Ben Jemia on 2/27/22.
//

import SwiftUI

struct ContentView: View {
    
    var countries = ["estonia", "france", "germany", "ireland"]
    var countryChosen = Int.random(in: 0...2)
    @State private var myScore = 0
    
    func showScore(score:Int) {
        print("this is my score")
    }
        
    var body: some View {
        
        ZStack {
            
            Color.blue
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                    Text("\(countries[countryChosen])")
                }
                .foregroundColor(.white)

                ForEach(0..<3) { number in
                    Button {
                        showScore(score: myScore)
                    } label: {
                        Image(countries[number])
                    }
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
