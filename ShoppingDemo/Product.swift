//
//  Product.swift
//  ShoppingDemo
//
//  Created by 罗诗朋 on 2022/1/24.
//

import UIKit

struct Product: Codable {
    var id: Int
    var name: String
    var cover: String
    var images: [String]
    var rating: Int
    var price: Double
    
}

