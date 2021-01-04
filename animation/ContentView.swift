//
//  ContentView.swift
//  animation
//
//  Created by joon-ho kil on 2021/01/04.
//

import SwiftUI

struct ContentView: View {
    @State private var blur: Bool = false
    @State private var reduction: Bool = false
    
    var body: some View {
        Image("cat")
            .blur(radius: blur ? 5 : 0)
            .scaleEffect(reduction ? 0.7 : 1)
            .onTapGesture {
                withAnimation {
                    self.blur.toggle()
                    self.reduction.toggle()
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
