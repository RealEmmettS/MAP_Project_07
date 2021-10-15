//
//  ExtraUICode.swift
//  RGB Matcher
//
//  Created by Emmett Shaughnessy on 9/30/21.
//

import Foundation
import UIKit

///'words'' in simply an alias for the 'String' type. Use the key 'words' wherever you would normally type 'String'
typealias words = String
///'number' in simply an alias for the 'Int' type. Use the key 'number' wherever you would normally type 'Int'
typealias number = Int
///'decimal' in simply an alias for the 'Double' type. Use the key 'decimal' wherever you would normally type 'Double'
typealias decimal = Double


/// Color data type. This data type has three attributes and one action.
struct RGB_Color {
    ///Red value on the RGB 256 scale
    var r:CGFloat = 0
    ///Green value on the RGB 256 scale
    var g:CGFloat = 0
    ///Blue value on the RGB 256 scale
    var b:CGFloat = 0
    
    ///Compiles the RGB values of the object
    ///- Returns: UIColor from the compiled RGB values
    func getColor() -> UIColor{
        return UIColor(red: r, green: g, blue: b, alpha: 1)
    }
    
    ///Compiles the RGB values of the object
    ///- Returns: UIColor from the compiled RGB values
    func getRGBColor() -> String{
//        return "\(String(format: "%.01f", r*256)), \(String(format: "%.01f", g*256)), \(String(format: "%.01f", b*256))"
        
        return "\(Int(r*256)), \(Int(g*256)), \(Int(b*256))"
    }
    
    ///Compiles the RGB values of the object
    ///- Returns: HEX string from the compiled RGB values
    func getHexColor() -> String {
        return UIColor(red: r, green: g, blue: b, alpha: 1).toHexString()
    }
}



//Returns a random UIColor
func randomColor() -> RGB_Color{
    let r = Float.random(in: 0..<1)
    let g = Float.random(in: 0..<1)
    let b = Float.random(in: 0..<1)

    let randomColor = RGB_Color(r: CGFloat(r), g: CGFloat(g), b: CGFloat(b))
    
    return randomColor
}








//MARK: RGB to HEX String
extension UIColor {
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0

        getRed(&r, green: &g, blue: &b, alpha: &a)

        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0

        return NSString(format:"#%06x", rgb) as String
    }

    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

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
