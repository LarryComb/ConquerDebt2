//
//  Conquer2App.swift
//  Conquer2
//
//  Created by LARRY COMBS on 2/18/23.
//
import SwiftUI

@main
struct Conquer2App: App {
    var body: some Scene {
        WindowGroup {
            // Wrap ViewController in a UIViewRepresentable to use with SwiftUI
            ViewControllerWrapper()
        }
    }
}

// A UIViewRepresentable wrapper for ViewController
struct ViewControllerWrapper: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let viewController = ViewController()
        let view = viewController.view
        return view ?? UIView()
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        // Not needed
    }
}
