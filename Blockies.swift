//
//  Blockies.swift
//  BlockiesSwift
//
//  Created by Koray Koska on 19.12.17.
//

#if os(iOS) || os(tvOS) || os(watchOS)
    import UIKit
#elseif os(OSX)
    import AppKit
#endif

public final class Blockies {

    // MARK: - Properties

    private var randSeed: [Int]

    public var seed: String

    public var size: Int
    public var scale: Int

    #if os(iOS) || os(tvOS) || os(watchOS)
    public typealias Color = UIColor
    public typealias Image = UIImage
    #elseif os(OSX)
    public typealias Color = NSColor
    public typealias Image = NSImage
    #endif

    public var color: Color
    public var bgColor: Color
    public var spotColor: Color

    // MARK: - Initialization

    public init(
        seed: String? = nil,
        size: Int = 8,
        scale: Int = 4,
        color: Color? = nil,
        bgColor: Color? = nil,
        spotColor: Color? = nil
    ) {
        let seed = seed ?? String(Int64(floor(Double.random * pow(10, 16))))
        self.seed = seed
        self.randSeed = BlockiesHelper.createRandSeed(seed: seed)
        self.size = size
        self.scale = scale
        self.color = color ?? Color()
        self.bgColor = bgColor ?? Color()
        self.spotColor = spotColor ?? Color()

        if color == nil {
            self.color = createColor()
        }
        if bgColor == nil {
            self.bgColor = createColor()
        }
        if spotColor == nil {
            self.spotColor = createColor()
        }
    }

    public func createImage() -> Image? {
        let imageData = createImageData()

        return image(data: imageData)
    }

    private func rand() -> UInt {
        let t = randSeed[0] ^ (randSeed[0] << 11)

        randSeed[0] = randSeed[1]
        randSeed[1] = randSeed[2]
        randSeed[2] = randSeed[3]
        randSeed[3] = (randSeed[3] ^ (randSeed[3] >> 19) ^ t ^ (t >> 8))

        // UInt for zero fill right shift
        let divisor = (UInt((1 << 31)) >> UInt(0))
        return (UInt(randSeed[3]) >> UInt(0)) / divisor
    }

    private func createColor() -> Color {
        let h = Double(rand())
        let s = Double(((rand() * 60) + 40)) / Double(100)
        let l = Double((rand() + rand() + rand() + rand()) * 25) / Double(100)

        return HSL(hue: CGFloat(h), saturation: CGFloat(s), lightness: CGFloat(l)).toDynamicColor()
    }

    private func createImageData() -> [Double] {
        let width = size
        let height = size

        let dataWidth = Int(ceil(Double(width) / Double(2)))
        let mirrorWidth = width - dataWidth

        var data: [Double] = []
        for _ in 0 ..< height {
            var row: [Double] = []
            for x in 0 ..< dataWidth {
                // this makes foreground and background color to have a 43% (1/2.3) probability
                // spot color has 13% chance
                row[x] = floor(Double(rand()) * 2.3)
            }
            let r = [Double](row[0 ..< mirrorWidth]).reversed()
            row.append(contentsOf: r)

            for i in 0 ..< row.count {
                data.append(row[i])
            }
        }

        return data
    }

    private func image(data: [Double]) -> Image? {
        UIGraphicsBeginImageContext(CGSize(width: size, height: size))
        let context = UIGraphicsGetCurrentContext()

        let width = Int(sqrt(Double(data.count)))

        for i in 0 ..< data.count {
            let row = Int(floor(Double(i) / Double(width)))
            let col = i % width

            let number = data[i]

            let uiColor: UIColor
            if number == 0 {
                uiColor = bgColor
            } else if number == 1 {
                uiColor = color
            } else if number == 2 {
                uiColor = spotColor
            } else {
                uiColor = UIColor.black
            }

            context?.setFillColor(uiColor.cgColor)
            context?.fill(CGRect(x: CGFloat(col * scale), y: CGFloat(row * scale), width: CGFloat(scale), height: CGFloat(scale)))
        }

        let output = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()

        return output
    }
}

class BlockiesHelper {

    static func createRandSeed(seed: String) -> [Int] {
        var randSeed = [Int](repeating: 0, count: 4)
        for i in 0 ..< seed.count {
            randSeed[i % 4] = ((randSeed[i % 4] << 5) - randSeed[i % 4])
            let index = seed.index(seed.startIndex, offsetBy: i)
            randSeed[i % 4] += seed[index].asciiValue
        }

        return randSeed
    }

    static func createColor(randSeed: [Int]) {
        let randSeed = randSeed.count == 4 ? randSeed : [Int](repeating: 0, count: 4)
    }
}

extension Double {

    static var random: Double {
        return Double(arc4random()) / 0xFFFFFFFF
    }
}

extension Character {

    var asciiValue: Int {
        get {
            let s = String(self).unicodeScalars
            return Int(s[s.startIndex].value)
        }
    }
}
