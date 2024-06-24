//
//  NavigationStackDemoView.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2022/10/17.
//

import SwiftUI

struct NavigationStackDemoView: View {
    let companies: [Company] = [
        .init(name: "Apple"),
        .init(name: "Facebook"),
        .init(name: "Google"),
        .init(name: "Microsoft"),
        .init(name: "Dell")
    ]
    
    let stocks: [Stock] = [
        .init(ticker: "AAPL"),
        .init(ticker: "FB"),
        .init(ticker: "GOOG"),
        .init(ticker: "MSFT"),
        .init(ticker: "DELL")
    ]
    
    @State private var path: [Company] = []
    
    var body: some View {
//        NavigationStack {
//            List {
//                Section("Section A") {
//                    ForEach(companies) { company in
//                        NavigationLink(company.name, value: company)
//                    }
//                }
//
//                Section("Section B") {
//                        ForEach(stocks) { stock in
//                            NavigationLink(stock.ticker, value: stock)
//                        }
//                }
//
//            }
//            .navigationDestination(for: Company.self) { company in
//                Text(company.name)
//            }
//
//            .navigationDestination(for: Stock.self) { stock in
//                Text(stock.ticker)
//            }
//        }
        
        NavigationStack(path: $path) {
            VStack {
                List(companies) { company in
                    NavigationLink(company.name, value: company)
                    
                }
                .navigationDestination(for: Company.self) { company in
                    VStack {
                        Text(company.name)
                        
                        Button("Go Back To Root") {
                            path = [
//                                companies[1],
//                                companies[0],
//                                companies[2]
                            ] //even to popToRootViewController in UIKit
                        }
                        .padding()
                        .buttonStyle(BlueButton())
                    }
                }
                
                Button("Go To Google") {
                    path = [
                        companies[1],
                        companies[0],
                        companies[2]
                        
                    ]}
                
                .padding()
                .buttonStyle(GrowingButton())
            }
            
        }
    }
}

struct NavigationStackDemoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStackDemoView()
    }
}
