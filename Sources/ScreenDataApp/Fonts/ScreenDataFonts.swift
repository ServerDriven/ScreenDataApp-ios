//
//  ScreenDataFonts.swift
//  
//
//  Created by Leif on 3/29/22.
//

import SwiftUI

public struct ScreenDataFonts {
    public var largeTitleFont: Font?
    public var titleFont: Font?
    public var headlineFont: Font?
    public var bodyFont: Font?
    public var footnoteFont: Font?
    public var captionFont: Font?
    
    public init(
        largeTitleFont: Font? = nil,
        titleFont: Font? = nil,
        headlineFont: Font? = nil,
        bodyFont: Font? = nil,
        footnoteFont: Font? = nil,
        captionFont: Font? = nil
    ) {
        self.largeTitleFont = largeTitleFont
        self.titleFont = titleFont
        self.headlineFont = headlineFont
        self.bodyFont = bodyFont
        self.footnoteFont = footnoteFont
        self.captionFont = captionFont
    }
}
