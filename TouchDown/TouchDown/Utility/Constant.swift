import SwiftUI

//COLOR
let colorBackground: Color = Color.colorBackground
let colorGray: Color = Color(UIColor.systemGray4)

//DATA
let players: [Player] = Bundle.main.decode(from: "player.json")
let categories: [Category] = Bundle.main.decode(from: "category.json")
let products: [Product] = Bundle.main.decode(from: "product.json")
let brands: [Brand] = Bundle.main.decode(from: "brand.json")

//LAYOUT
let columnSpacing: CGFloat = 12.0
let rowSpacing: CGFloat = 12.0
var horizontalGridItems: [GridItem] {
    return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 2)
}
var verticalGridItems: [GridItem] {
    return Array(repeating: GridItem(.flexible(), spacing: columnSpacing), count: 2)
}

//HAPTICS
let hapticFeedback = UIImpactFeedbackGenerator(style: .medium)
