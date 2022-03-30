# ScreenDataApp

*Semi or Fully ServerDriven SwiftUI App using [ScreenData](https://serverdriven.github.io/ScreenData/)*

## Usage

There are two different ways to make a ScreenDataApp

### 1) Use `DefaultScreenDataApp`

```swift
import ScreenData
import ScreenDataApp
import ScreenDataNavigation
import SwiftUI

@main
struct DemoScreenDataApp: App {
    let screenDataApp = DefaultScreenDataApp(
        baseID: "some id",
        screenProvider: MockScreenProvider(
            mockScreen: SomeScreen(
                title: "Hello Demo!",
                backgroundColor: SomeColor(red: 0.05, green: 0.6, blue: 0.1),
                someView: SomeLabel(
                    title: "Mock Screen",
                    font: .title
                )
                .someView
            )
        )
    )
    
    var body: some Scene { screenDataApp.body }
}
```


### 2) Conform the @main App to be a `ScreenDataApp`

```swift
import Chronicle
import ScreenData
import ScreenDataApp
import ScreenDataNavigation
import ScreenDataUI
import SwiftUI

@main
struct DemoScreenDataApp: ScreenDataApp {
    var chrono: Chronicle = DefaultScreenDataApp().chrono
    
    init() {
        configureScreenData()
    }
    
    var rootView: AnyView {
        AnyView(
            ProvidedSDScreen(baseID: "Anything...")
        )
    }
    
    func configureScreenProvider() -> ScreenProviding? {
        MockScreenProvider(
            mockScreen: SomeScreen(
                title: "Hello Demo!",
                backgroundColor: SomeColor(red: 0.05, green: 0.6, blue: 0.1),
                someView: SomeLabel(
                    title: "Mock Screen",
                    font: .title
                )
                .someView
            )
        )
    }
    
    func configureScreenStore() -> ScreenStoring? { nil }
    func configureCustomViews() -> [SDCustomizedView] { [] }
    func configureImageProvider() -> SDImageProviding { SDImageURLProvider() }
    func configureImageStore() -> SDImageStoring? { nil }
    func configureDefaultForegroundColor() -> Color? { nil }
    func configureButtonActions() -> [ScreenDataActionable] { [] }
    func configureFonts() -> ScreenDataFonts { ScreenDataFonts() }
}
```
