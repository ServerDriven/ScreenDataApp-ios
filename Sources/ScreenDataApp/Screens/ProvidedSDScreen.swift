//
//  ProvidedSDScreen.swift
//  
//
//  Created by Leif on 3/29/22.
//

import Combine
import ScreenData
import ScreenDataUI
import ScreenDataNavigation
import SwiftUI

public struct ProvidedSDScreen: View {
    public static var applicationWillEnterForegroundNotification: Notification.Name {
        #if os(iOS)
        UIApplication.willEnterForegroundNotification
        #else
        WKExtension.applicationWillEnterForegroundNotification
        #endif
    }
    
    class ScreenProviderStore: ObservableObject {
        private var task: AnyCancellable?
        
        @Published var screen: SomeScreen?
        
        func fetch(screenID id: String?) {
            guard let id = id else {
                return
            }
            
            task = SDScreenProvider().screen(forID: id)
                .sink(
                    receiveCompletion: { _ in },
                    receiveValue: { screen in
                        DispatchQueue.main.async {
                            self.screen = screen
                        }
                    }
                )
        }
    }

    @StateObject private var store = ScreenProviderStore()
    
    public var baseID: String?
    
    public init(baseID: String?) {
        self.baseID = baseID
    }
    
    public var body: some View {
        if let screen = store.screen {
            NavigationView {
                if SDScreen.isDebugging {
                    DebugSDScreen(screen: screen)
                } else {
                    SDScreen(screen: screen)
                }
            }
            .onAppear {
                if let baseID = baseID {
                    store.fetch(screenID: baseID)
                }
            }
            .onReceive(
                NotificationCenter.default.publisher(
                    for: ProvidedSDScreen.applicationWillEnterForegroundNotification
                )
            ) { _ in
                if let baseID = baseID {
                    store.fetch(screenID: baseID)
                }
            }
        } else {
            ProgressView()
                .onAppear {
                    store.fetch(screenID: baseID)
                }
        }
    }
}
