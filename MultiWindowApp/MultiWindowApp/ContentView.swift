//
//  ContentView.swift
//  MultiWindowApp
//
//  Created by Ryu Kikkawa on 2019/10/14.
//  Copyright © 2019 Asunaro. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let views = [
        PanelView(color: .red, title: "Red"),
        PanelView(color: .green, title: "Green"),
        PanelView(color: .blue, title: "Blue"),
        PanelView(color: .purple, title: "Purple"),
        PanelView(color: .orange),
        PanelView(color: .gray, count: 100)
    ]
    
    var body: some View {
        ZStack {
            VStack{
                self.views[0]
                self.views[1]
                self.views[2]
                self.views[3]
                self.views[4]
                self.views[5]
                HStack {
                    Button(action: {
                        
                    }) {
                        Text("非アクティブ")
                    }
                    .background(Color.orange.opacity(0.5))
                    Spacer()
                        .frame(width: 50.0)
                    Button(action: {
                        
                    }) {
                        Text("非アクティブ")
                    }
                    .background(Color.gray.opacity(0.5))
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
