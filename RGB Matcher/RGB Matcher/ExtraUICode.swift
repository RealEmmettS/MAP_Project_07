//
//  ExtraUICode.swift
//  RGB Matcher
//
//  Created by Emmett Shaughnessy on 9/30/21.
//

import Foundation
import UIKit


//Returns a random UIColor
func randomColor() -> UIColor{
    let r1 = Float.random(in: 0..<1)
    let r2 = Float.random(in: 0..<1)
    let r3 = Float.random(in: 0..<1)

    let randomColor = UIColor(red: CGFloat(r1), green: CGFloat(r2), blue: CGFloat(r3), alpha: 1)
    
    return randomColor
}











//For the TicTacToe Buttons (the code below gives more option in Xcode Storyboard interface
//https://spin.atomicobject.com/2017/07/18/swift-interface-builder/
extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }

    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}
