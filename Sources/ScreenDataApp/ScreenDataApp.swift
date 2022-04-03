import Chronicle
import FLet
import ScreenData
import ScreenDataNavigation
import ScreenDataUI
import SwiftUI

public protocol ScreenDataApp: App {
    var util: FLet.Type { get }
    var chrono: Chronicle { get }
    var rootView: AnyView { get }
    
    func configureScreenData()
    func configureDebugging() -> Bool
    func configureScreenProvider() -> ScreenProviding?
    func configureScreenStore() -> ScreenStoring?
    func configureCustomViews() -> [SDCustomizedView]
    func configureImageProvider() -> SDImageProviding
    func configureImageStore() -> SDImageStoring?
    func configureDefaultForegroundColor() -> Color?
    func configureButtonActions() -> [ScreenDataActionable]
    func configureFonts() -> ScreenDataFonts
}

public extension ScreenDataApp {
    var util: FLet.Type { FLet.self }
    
    var screenProvider: ScreenProviding { SDScreenProvider() }
    var screenStore: ScreenStoring { SDScreenStore() }
    
    var body: some Scene {
        WindowGroup {
            rootView
        }
    }
    
    func configureScreenData() {
        SDScreen.isDebugging = configureDebugging()
        
        SDScreenProvider.default = configureScreenProvider()
        SDScreenStore.default = configureScreenStore()
        
        configureCustomViews().forEach(SDCustomView.add)
        
        SDImage.defaultImageProvider = configureImageProvider()
        SDImage.defaultImageStorer = configureImageStore()
        SDImage.defaultForegroundColor = configureDefaultForegroundColor()
        
        configureButtonActions().forEach { action in
            SDButton.add(
                actionWithID: action.id,
                action: action.fire
            )
        }
        
        let screenDataFonts = configureFonts()
        
        SDFont.largeTitleFont = screenDataFonts.largeTitleFont
        SDFont.titleFont = screenDataFonts.titleFont
        SDFont.headlineFont = screenDataFonts.headlineFont
        SDFont.bodyFont = screenDataFonts.bodyFont
        SDFont.footnoteFont = screenDataFonts.footnoteFont
        SDFont.captionFont = screenDataFonts.captionFont
    }
    
    func configureDebugging() -> Bool { false }
}
