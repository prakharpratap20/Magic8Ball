//
//  ContentView.swift
//  Magic8Ball
//
//  Created by Prakhar Pratap.
//

import SwiftUI

struct ContentView: View {
    
    @State var text = "Ask"
    
    let textArray = [
        "It is Certain.",
        "It is decidedly so.",
        "Without a doubt.",
        "Yes definitely.",
        "You may rely on it.",
        "As I see it, yes.",
        "Most likely.",
        "Outlook good.",
        "Yes.",
        "Signs point to yes.",
        "Reply hazy, try again.",
        "Ask again later.",
        "Better not tell you now.",
        "Cannot predict now.",
        "Concentrate and ask again.",
        "Don't count on it.",
        "My reply is no.",
        "My sources say no.",
        "Outlook not so good.",
        "Very doubtful."
    ]
    
    //animation
    @State var opacity: Double = 1
    
    var body: some View {
        
        ZStack {
            
            Image("ball")
                .scaleEffect(CGSize(width: 0.4, height: 0.4))
            
            Text(text)
                .foregroundColor(.white)
                .frame(width: 200, height: 200)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
                .opacity(opacity)
                .font(Font.custom("Stint Ultra Condensed", size: 32))
                .onTapGesture {
                    //animation
                    withAnimation {
                        opacity = 0
                        
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3) {
                            withAnimation {
                                //pick a new text
                                text = textArray[Int.random(in: 0..<textArray.count)]
                                
                                opacity = 1
                            }
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
