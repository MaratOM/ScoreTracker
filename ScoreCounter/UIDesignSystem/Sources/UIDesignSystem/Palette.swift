//
//  Palette.swift
//  
//
//  Created by Marat Mikaelyan on 11.09.2023.
//

import SwiftUI

public final class UIDesignSystemStore {
    public static var palette: ColorPalette = .default
}

extension Color {
    init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 1.0

        let length = hexSanitized.count

        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else { return nil }

        if length == 6 {
            r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            b = CGFloat(rgb & 0x0000FF) / 255.0

        } else if length == 8 {
            r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
            g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
            b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
            a = CGFloat(rgb & 0x000000FF) / 255.0

        } else {
            return nil
        }

        self.init(red: r, green: g, blue: b, opacity: a)
    }
}

public protocol PaletteColorsType {
    static var hexes: [String] { get }
    var first: Color { get }
    var second: Color { get }
    var third: Color { get }
    var fourth: Color { get }
    var fifth: Color { get }
    var fontDark: Color { get }
}

enum PaletteColors {
    struct Default: PaletteColorsType {
        static let hexes = ["344E41", "3A5A40", "588157", "A3B18A", "DAD7CD", "282A29",]
        let first = Color(hex: hexes[0]) ?? .gray
        let second = Color(hex: hexes[1]) ?? .gray
        let third = Color(hex: hexes[2]) ?? .gray
        let fourth = Color(hex: hexes[3]) ?? .gray
        let fifth = Color(hex: hexes[4]) ?? .gray
        let fontDark = Color(hex: hexes[5]) ?? .gray
    }

    struct Green: PaletteColorsType {
        static let hexes = ["344E41", "3A5A40", "588157", "A3B18A", "DAD7CD", "282A29",]
        let first = Color(hex: hexes[0]) ?? .gray
        let second = Color(hex: hexes[1]) ?? .gray
        let third = Color(hex: hexes[2]) ?? .gray
        let fourth = Color(hex: hexes[3]) ?? .gray
        let fifth = Color(hex: hexes[4]) ?? .gray
        let fontDark = Color(hex: hexes[5]) ?? .gray
    }
    
    struct Purple: PaletteColorsType {
        static let hexes = ["231942", "5E548E", "9F86C0", "BE95C4", "E0B1CB", "282A29",]
        let first = Color(hex: hexes[0]) ?? .gray
        let second = Color(hex: hexes[1]) ?? .gray
        let third = Color(hex: hexes[2]) ?? .gray
        let fourth = Color(hex: hexes[3]) ?? .gray
        let fifth = Color(hex: hexes[4]) ?? .gray
        let fontDark = Color(hex: hexes[5]) ?? .gray
    }
    
    struct Purple2: PaletteColorsType {
        static let hexes = ["352F44", "5C5470", "", "B9B4C7", "FAF0E6", "",]
        let first = Color(hex: hexes[0]) ?? .gray
        let second = Color(hex: hexes[1]) ?? .gray
        let third = Color(hex: hexes[2]) ?? .gray
        let fourth = Color(hex: hexes[3]) ?? .gray
        let fifth = Color(hex: hexes[4]) ?? .gray
        let fontDark = Color(hex: hexes[5]) ?? .gray
    }
}

public enum ColorPalette {
    case `default`
    case green
    case purple
    case purple2
    
    public var colors: PaletteColorsType {
        switch self {
        case .default:
            return PaletteColors.Default()
        case .green:
            return PaletteColors.Green()
        case .purple:
            return PaletteColors.Purple()
        case .purple2:
            return PaletteColors.Purple2()
        }
    }
}
