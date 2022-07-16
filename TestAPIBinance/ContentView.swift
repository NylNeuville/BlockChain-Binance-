//
//  ContentView.swift
//  TestAPIBinance
//
//  Created by Nyl Neuville on 14/07/2022.
//

import SwiftUI
import BinanceChain

struct ContentView: View {
    let binance = BinanceChain()
    @State private var isPressed = false
    var tokenList: [[String]] = [[]]
    var body: some View {
        ScrollView {
            VStack {
                Text(isPressed ? "vrai" : "false")
//                Text(isPressed ? )
                
                Button(action: {
                    isPressed = true
                    getLatestBlockTime()
                    getTokenList()
                    print("un string")
                }, label: {
                    Label("know latest block time", systemImage: "bitcoinsign.circle").font(.title)
                    
                })
                .buttonStyle(.bordered)
                .tint(.purple)
            }
        }
    }
    func getLatestBlockTime() {
        binance.time() { (response) in
            if let error = response.error { return print(error) }
            print(response.time)
        }
    }
    
    func getTokenList() {
        binance.tokens(limit: .fiveHundred, offset: 0) { (response) in
            print(response.tokens)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
