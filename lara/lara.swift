//
//  lara.swift
//  lara
//
//  Created by ruter on 23.03.26.
//

import SwiftUI

@main
struct lara: App {
    @Environment(\.scenePhase) private var scenePhase

    init() {
        globallogger.capture()
    }

    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                    .tabItem {
                        Label("lara", systemImage: "ant.fill")
                    }

                LogsView(logger: globallogger)
                    .tabItem {
                        Label("Logs", systemImage: "text.document.fill")
                    }
            }
            .onAppear {
                init_offsets()
            }
            .onChange(of: scenePhase) { phase in
                if phase == .background {
                    globallogger.stopcapture()
                } else if phase == .active {
                    globallogger.capture()
                }
            }
        }
    }
}
