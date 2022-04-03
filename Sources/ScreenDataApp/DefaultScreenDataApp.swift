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
    
    public var baseID: String?
    public var isDebugging: Bool
    public var screenProvider: ScreenProviding?
    public var screenStore: ScreenStoring?
    public var customViews: [SDCustomizedView]
    public var imageProvider: SDImageProviding
    public var imageStore: SDImageStoring?
    public var defaultForegroundColor: Color?
    public var buttonActions: [ScreenDataActionable]
    public var fonts: ScreenDataFonts
    
    public var rootView: AnyView {
        guard let baseID = baseID else {
            return AnyView(Text("Please set `DefaultScreenDataApp.baseID`"))
        }
        
        return AnyView(ProvidedSDScreen(baseID: baseID))
    }
    
    public init() {
        self.baseID = nil
        self.isDebugging = false
        self.screenProvider = nil
        self.screenStore = nil
        self.customViews = []
        self.imageProvider = SDImageURLProvider()
        self.imageStore = nil
        self.defaultForegroundColor = nil
        self.buttonActions = []
        self.fonts = ScreenDataFonts()
        
        configureScreenData()
    }
    
    public init(
        baseID: String,
        isDebugging: Bool = false,
        screenProvider: ScreenProviding? = nil,
        screenStore: ScreenStoring? = nil,
        customViews: [SDCustomizedView] = [],
        imageProvider: SDImageProviding = SDImageURLProvider(),
        imageStore: SDImageStoring? = nil,
        defaultForegroundColor: Color? = nil,
        buttonActions: [ScreenDataActionable] = [],
        fonts: ScreenDataFonts = ScreenDataFonts()
    ) {
        self.baseID = baseID
        self.isDebugging = isDebugging
        self.screenProvider = screenProvider
        self.screenStore = screenStore
        self.customViews = customViews
        self.imageProvider = imageProvider
        self.imageStore = imageStore
        self.defaultForegroundColor = defaultForegroundColor
        self.buttonActions = buttonActions
        self.fonts = fonts
        
        configureScreenData()
    }
    
    public func configureDebugging() -> Bool { isDebugging }
    public func configureScreenProvider() -> ScreenProviding? { screenProvider }
    public func configureScreenStore() -> ScreenStoring? { screenStore }
    public func configureCustomViews() -> [SDCustomizedView] { customViews }
    public func configureImageProvider() -> SDImageProviding { imageProvider }
    public func configureImageStore() -> SDImageStoring? { imageStore }
    public func configureDefaultForegroundColor() -> Color? { defaultForegroundColor }
    public func configureButtonActions() -> [ScreenDataActionable] { buttonActions }
    public func configureFonts() -> ScreenDataFonts { fonts }
}

