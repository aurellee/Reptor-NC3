//
//  HideKeyboard.swift
//  Reptor-NC3
//
//  Created by Jaqueline Aurelia Langi on 16/07/24.
//


import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
