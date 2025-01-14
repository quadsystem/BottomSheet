//
//  BottomSheetView+KeyboardHeight.swift
//  
//
//  Created by Robin Pel on 06/09/2022.
//

#if !os(macOS)
import UIKit
import SwiftUI

@available(iOS 13.0, *)
internal class KeyboardHeight: ObservableObject {
    
    @Published private(set) internal var value: CGFloat = 0
    
    internal init() {
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            DispatchQueue.main.async {
                self.value = keyboardFrame.cgRectValue.height
            }
        }
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        DispatchQueue.main.async {
            self.value = 0
        }
    }
}
#endif
