//
//  PanelView.swift
//  MultiWindowApp
//
//  Created by Ryu Kikkawa on 2019/10/14.
//  Copyright © 2019 Asunaro. All rights reserved.
//

import SwiftUI
import Combine

class MyTimer {
    let currentTimePublisher = Timer.TimerPublisher(interval: 1, runLoop: .main, mode: .default)
    let cancellable: AnyCancellable?

    init() {
        self.cancellable = currentTimePublisher.connect() as? AnyCancellable
    }

    deinit {
        self.cancellable?.cancel()
    }
}

let timer = MyTimer()

struct PanelView: View {
    
    @State var color: Color
    @State var title: String? = nil
    @State var count: Int = 0
    
    var body: some View {
        ZStack {
            
            // Background
            self.color.opacity(0.7)
            
            // テキスト
            Text(self.title ?? "\(self.count)")
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
                .padding(.top)
                .onReceive(timer.currentTimePublisher) { time in
                    self.count += 1
            }
            
        }
    }
    
}

struct PanelView_Previews: PreviewProvider {
    static var previews: some View {
        PanelView(color: .red)
    }
}
