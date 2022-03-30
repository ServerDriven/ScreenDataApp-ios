//
//  DefaultScreenDataApp.swift
//  
//
//  Created by Leif on 3/29/22.
//

import Chronicle
import ScreenDataNavigation
import ScreenDataUI
import SwiftUI

public struct DefaultScreenDataApp: ScreenDataApp {
    public var chrono: Chronicle = Chronicle(label: "ScreenDataApp.DefaultScreenDataApp")
    
    public static var baseID: String? = nil
    
    public var rootView: AnyView {
        guard let baseID = DefaultScreenDataApp.baseID else {
            return AnyView(Text("Please set `DefaultScreenDataApp.baseID`"))
        }
        
        return AnyView(ProvidedSDScreen(baseID: baseID))
    }
    
    public init() {
        configureScreenData()
    }
    
    public func configureScreenProvider() -> ScreenProviding? { nil }
    public func configureScreenStore() -> ScreenStoring? { nil }
    public func configureCustomViews() -> [SDCustomizedView] { [] }
    public func configureImageProvider() -> SDImageProviding { SDImageURLProvider() }
    public func configureImageStore() -> SDImageStoring? { nil }
    public func configureDefaultForegroundColor() -> Color? { nil }
    public func configureButtonActions() -> [ScreenDataActionable] { [] }
    public func configureFonts() -> ScreenDataFonts { ScreenDataFonts() }
}

