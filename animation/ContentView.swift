//
//  ContentView.swift
//  animation
//
//  Created by joon-ho kil on 2021/01/04.
//

import SwiftUI

struct ContentView: View {
    @State private var trimmedTo: CGFloat = 1.0
    @State private var lineWidth: CGFloat = 7.0
    @State private var isHidden = false
    
    var body: some View {
        VStack {
            MyCircle(trimmedTo: trimmedTo, lineWidth: lineWidth)
                .padding()
                .animation(.easeInOut(duration: 1.5))
            Button(action: {
                self.trimmedTo = self.isHidden ? 1.0 : 0
                self.lineWidth = self.isHidden ? 7 : 1
                self.isHidden.toggle()
            }) {
                Text("Animate!").font(.title)
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MyCircle: Shape {
    var trimmedTo: CGFloat
    var lineWidth: CGFloat
    var animatableData: AnimatablePair<CGFloat, CGFloat> {
        get {
            AnimatablePair(trimmedTo, lineWidth)
        }
        set {
            trimmedTo = newValue.first
            lineWidth = newValue.second
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = rect.width / 2
        let start = Angle(radians: .pi / -2)
        let end = Angle(radians: .pi / 2 * 3)
        
        path.addArc(center: center, radius: radius / 4, startAngle: start, endAngle: end, clockwise: false)
        path.addArc(center: center, radius: radius / 2, startAngle: start, endAngle: end, clockwise: false)
        path.addArc(center: center, radius: radius, startAngle: start, endAngle: end, clockwise: false)
        return path
            .trimmedPath(from: 0.0, to: trimmedTo)
            .strokedPath(.init(lineWidth: lineWidth))
    }
}
