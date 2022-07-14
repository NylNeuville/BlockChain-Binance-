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
    var body: some View {
        VStack {
            Button(action: {
                getLatestBlockTime()
                print("un string")
            }, label: {
                Label("know latest block time", systemImage: "bitcoinsign.circle").font(.title)
                
            })
            .buttonStyle(.bordered)
            .tint(.purple)
        }
    }
    func getLatestBlockTime() {
        binance.time() { (response) in
            if let error = response.error { return print(error) }
            print(response.time)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
