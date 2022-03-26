//
//  UIKitPreview.swift
//  
//
//  Created by 林博文 on 2022/3/16.
//

#if DEBUG && canImport(SwiftUI)

import SwiftUI

@available(iOS 13.0, *)
public struct ViewControllerPreview<ViewController: UIViewController>: UIViewControllerRepresentable {
    
    let viewController: ViewController
    
    public init(_ builder: () -> ViewController) {
        viewController = builder()
    }
    
    public func makeUIViewController(context: Context) -> ViewController { viewController }
    
    public func updateUIViewController(_ uiViewController: ViewController, context: Context) {}
    
}

@available(iOS 13.0, *)
public struct ViewPreview<View: UIView>: UIViewRepresentable {
    
    let view: View
    
    public init(_ builder: () -> View) {
        view = builder()
    }
    
    public func makeUIView(context: Context) -> UIView { view }
    
    public func updateUIView(_ view: UIView, context: Context) {
        view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
    
}

#endif
