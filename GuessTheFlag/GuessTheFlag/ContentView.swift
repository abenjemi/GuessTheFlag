//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Amine Ben Jemia on 2/27/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var countries = ["estonia", "france", "germany", "ireland"]
    var countryChosen = Int.random(in: 0...2)
    @State var myScore = 0
    @State var showAlert = false
    @State var answer = false
        
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
                        answer = isCorrect(countries: countries, randNumber: countryChosen, number: number, &myScore)
                        showAlert = true
                        countries.shuffle()
                    } label: {
                        Image(countries[number])
                    }
                    .alert("Score", isPresented: $showAlert) {
                        Button("OK") {}
                    } message: {
                        if answer {
                            Text("Correct answer: Your score is \(myScore)")
                        }
                        else {
                            Text("Wrong answer: Your score is \(myScore)")
                        }
                        
                    }
                    
                }
            }
        }
    }
}

func isCorrect(countries:[String], randNumber:Int, number:Int, _ score: inout Int) -> Bool {
    if countries[randNumber] == countries[number] {
        score += 1
        return true
    }
    return false
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
