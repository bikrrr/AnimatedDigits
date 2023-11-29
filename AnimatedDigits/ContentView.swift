//
//  ContentView.swift
//  AnimatedDigits
//
//  Created by Uhl Albert on 9/17/23.
//

import SwiftUI

struct AnimatedNumberView: View {
    @State private var numbers: [Int] = []

    var body: some View {
        VStack {
            HStack(spacing: 0) {
                ForEach(numbers, id: \.self) { num in
                    AnimatedDigit(digit: num)
                }
            }
            .frame(minHeight: 80)

            .onTapGesture {
                withAnimation(.easeOut(duration: 0.15)) {
                    addDigit()
                }
            }

            HStack {
                Button {
                    addDigit()
                } label: {
                    Text("Add Digit")
                }
                .buttonStyle(.borderedProminent)
                Button {
                    numbers = [0]
                } label: {
                    Text("Clear")
                }
                .buttonStyle(.bordered)
            }
        }
    }

    private func addDigit() {
        withAnimation(.easeOut(duration: 0.15)) {
            if numbers.count < 10 {
                numbers.append(numbers.count)
            }
        }
    }
}

struct AnimatedDigit: View {
    var digit: Int
    @State private var scale: CGFloat = 0.5
    @State private var opacityValue: Double = 0.2

    var body: some View {
        Text("\(digit)")
            .font(.largeTitle)
            .scaleEffect(scale)
            .opacity(opacityValue)
            .onAppear {
                withAnimation(.easeOut(duration: 0.15)) {
                    scale = 1.0
                    opacityValue = 1.0
                }
            }
    }
}

struct AnimatedNumberView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedNumberView()
    }
}
