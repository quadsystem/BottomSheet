//
//  ColorExtension.swift
//
//  Created by Lucas Zischka.
//  Copyright © 2022 Lucas Zischka. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
internal extension Color {
#if os(macOS)
    static var tertiaryLabel = Color(NSColor.tertiaryLabelColor)
#else
    static var tertiaryLabel = Color(UIColor.tertiaryLabel)
#endif
}
