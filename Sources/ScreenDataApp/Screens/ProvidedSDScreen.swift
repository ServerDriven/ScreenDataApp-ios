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
                SDScreen(screen: screen)
            }
            .onAppear {
                if let baseID = baseID {
                    store.fetch(screenID: baseID)
                }
            }
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
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
