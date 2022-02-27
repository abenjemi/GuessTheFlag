//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Amine Ben Jemia on 2/27/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var countries = ["estonia", "france", "germany", "ireland"]
    @State var countryChosen = Int.random(in: 0...2)
    @State var myScore = 0
    @State var showAlert = false
    @State var answer = ""
        
    var body: some View {
        
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [.blue, .white]), startPoint: .top, endPoint: .bottom)
            
            VStack(spacing: 30) {
                
                Spacer()
                
                VStack {
                    Text("Tap the flag of")
                        .font(.title)
                        .fontWeight(.bold)
                        
                    Text("\(countries[countryChosen])")
                        .font(.largeTitle.bold())
                        .textCase(.uppercase)
                        .padding(.top, 5.0)
                }
                .foregroundColor(.white)
                .padding()

                ForEach(0..<3) { number in
                    Button {
                        answer = isCorrect(countries: countries, randNumber: countryChosen, number: number, &myScore)
                        showAlert = true
                        countries.shuffle()
                        countryChosen = Int.random(in: 0...2)
                    } label: {
                        Image(countries[number])
                            .renderingMode(.original)
                    }
                    .alert(answer, isPresented: $showAlert) {
                        Button("OK") {}
                    } message: {
                        Text("Your score is \(myScore)")
                    }
                    
                }
                
                Spacer()
                
                Button("Restart") {
                    myScore = 0
                }
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()
                .frame(width: 150, height: 50)
                .background(Color.black)
                .cornerRadius(15.0)
                
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}

func isCorrect(countries:[String], randNumber:Int, number:Int, _ score: inout Int) -> String {
    if countries[randNumber] == countries[number] {
        score += 1
        return "Correct Answer"
    }
    return "Wrong Answer"
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
