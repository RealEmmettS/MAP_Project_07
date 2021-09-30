//
//  ViewController.swift
//  RGB Matcher
//
//  Created by Emmett Shaughnessy on 9/30/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userColor: UILabel!
    @IBOutlet weak var matchColor: UILabel!
    
    @IBOutlet weak var redSliderOutlet: UISlider!
    @IBOutlet weak var greenSliderOutlet: UISlider!
    @IBOutlet weak var blueSliderOutlet: UISlider!
    
    var color = usersColor(r: 0, g: 0, b: 0)
    
    struct usersColor {
        var r:CGFloat = 0{
            didSet{
                print("R: \(r)")
            }
        }
        var g:CGFloat = 0{
            didSet{
                print("G: \(g)")
            }
        }
        var b:CGFloat = 0{
            didSet{
                print("B: \(b)")
            }
        }
        
        func getColor() -> UIColor{
            return UIColor(red: r, green: g, blue: b, alpha: 1)
        }
    }
    
    let colorToMatch = randomColor()
    
    
    
    //MARK: viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        userColor.backgroundColor = color.getColor()
        matchColor.backgroundColor = colorToMatch
        
        userColor.layer.masksToBounds = true
        matchColor.layer.masksToBounds = true


    }
    
    
    
    //MARK: Slider Functions
    
    //Ask Mr. Bunn about slider "NSInvalidArgumentException" error that triggers when slider is moved by the user
    @IBAction func redSlider(_ sender: Any) {
        let currentValue:CGFloat = CGFloat(redSliderOutlet.value)
        
        printContent(currentValue)
        
        color.r = CGFloat(currentValue)
        userColor.backgroundColor = color.getColor()
    }
    
    @IBAction func greenSlider(_ sender: Any) {
        let currentValue:CGFloat = CGFloat(greenSliderOutlet.value)
        
        printContent(currentValue)
        
        color.g = CGFloat(currentValue)
        userColor.backgroundColor = color.getColor()
    }
    
    @IBAction func blueSlider(_ sender: Any) {
        let currentValue:CGFloat = CGFloat(blueSliderOutlet.value)
        
        printContent(currentValue)
        
        color.b = CGFloat(currentValue)
        userColor.backgroundColor = color.getColor()
    }
    
}

