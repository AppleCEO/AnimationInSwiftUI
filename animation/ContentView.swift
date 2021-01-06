//
//  ContentView.swift
//  animation
//
//  Created by joon-ho kil on 2021/01/04.
//

import SwiftUI

struct ContentView: View {
    @State private var showText: Bool = false
    
    var body: some View {
        VStack {
            if showText {
                Text("Transition")
                    .font(.largeTitle)
                    .padding()
                    .transition(myTransition)
            }
        
        Button("Display Text On / Off") {
            withAnimation {
                self.showText.toggle()
            }
        }.font(.title)
    }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

var myTransition: AnyTransition {
    let insertion = AnyTransition.offset(x: 300, y: -300)
        .combined(with: .scale)
    let removal = AnyTransition.move(edge: .leading)
    return .asymmetric(insertion: insertion, removal: removal)
}
