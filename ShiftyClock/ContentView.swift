//
//  ContentView.swift
//  ShiftyClock
//
//  Created by Jacob White on 9/4/19.
//  Copyright © 2019 Yet To Be Named Enterprise. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello World")
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
