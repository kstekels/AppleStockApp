//
//  Stock.swift
//  StockAppSwiftUI
//
//  Created by karlis.stekels on 21/09/2022.
//

import Foundation

struct Stock: Decodable {
    let symbol: String
    let description: String
    let price: Double
    let change: String
}
