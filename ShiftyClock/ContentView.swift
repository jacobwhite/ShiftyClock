//
//  ContentView.swift
//  ShiftyClock
//
//  Created by Jacob White on 9/4/19.
//  Copyright © 2019 Yet To Be Named Enterprise. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var font: Font = .custom("San Francisco Mono", size: 30)
    let offset: CGFloat = 60
    let margin: CGFloat = 300
    @State var hoursTens: CGFloat = 1
    @State var hoursOnes: CGFloat = 9
    @State var minutesTens: CGFloat = 5
    @State var minutesOnes: CGFloat = 9
    @State var secondsTens: CGFloat = 9
    @State var secondsOnes: CGFloat = 9
    let timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()
    func update(){
        let calendar = Calendar.current
        let dateComponents:DateComponents = calendar.dateComponents([.hour, .minute, .second], from:Date())
        let hour = dateComponents.hour! % 12
        hoursTens = CGFloat(hour / 10)
        hoursOnes = CGFloat(hour % 10)
        if hoursTens == 0 && hoursOnes == 0 {
            hoursTens = 1
            hoursOnes = 2
        }
        minutesTens = CGFloat(dateComponents.minute! / 10)
        minutesOnes = CGFloat(dateComponents.minute! % 10)
        secondsTens = CGFloat(dateComponents.second! / 10)
        secondsOnes = CGFloat(dateComponents.second! % 10)
    }
    var body: some View {
        HStack {
            
            Text("0\n1")
                .font(font)
                .multilineTextAlignment(.center)
                .frame(width: 25, height: hoursTens * offset + margin, alignment: .top).animation(.spring())
                .onReceive(timer) {_ in
                    self.update()
                }
            Text("0\n1\n2\n3\n4\n5\n6\n7\n8\n9")
                .font(font)
                .multilineTextAlignment(.center)
                .frame(width: 25, height: hoursOnes * offset + margin, alignment: .top).animation(.spring())
            Text(":")
                .font(font)
                .multilineTextAlignment(.center)
                .frame(width: 25, height: margin, alignment: .top)
            Text("0\n1\n2\n3\n4\n5")
                .font(font)
                .multilineTextAlignment(.center)
                .frame(width: 25, height: minutesTens * offset + margin, alignment: .top).animation(.spring())
            Text("0\n1\n2\n3\n4\n5\n6\n7\n8\n9")
                .font(font)
                .multilineTextAlignment(.center)
                .frame(width: 25, height: minutesOnes * offset + margin, alignment: .top).animation(.spring())
            Text(":")
                .font(font)
                .multilineTextAlignment(.center)
                .frame(width: 25, height: margin, alignment: .top)
            Text("0\n1\n2\n3\n4\n5\n6\n7\n8\n9")
                .font(font)
                .multilineTextAlignment(.center)
                .frame(width: 25, height: secondsTens * offset + margin, alignment: .top).animation(.spring())
            Text("0\n1\n2\n3\n4\n5\n6\n7\n8\n9")
                .font(font)
                .multilineTextAlignment(.center)
                .frame(width: 25, height: secondsOnes * offset + margin, alignment: .top).animation(.spring())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
