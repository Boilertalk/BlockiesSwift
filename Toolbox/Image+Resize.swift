//
//  Image+Resize.swift
//  BlockiesSwift
//
//  Created by Koray Koska on 22.12.17.
//

#if os(iOS) || os(tvOS) || os(watchOS)
    import UIKit
#elseif os(OSX)
    import AppKit
#endif

#if os(iOS) || os(tvOS) || os(watchOS)
    typealias Image = UIImage
#elseif os(OSX)
    typealias Image = NSImage
#endif

extension Image {
}
