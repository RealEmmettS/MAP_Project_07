//
//  ViewController.swift
//  RGB Matcher
//
//  Created by Emmett Shaughnessy on 9/30/21.
//

import UIKit

class ViewController: UIViewController {

    //Color Views
    @IBOutlet weak var userColor: UILabel!
    @IBOutlet weak var matchColor: UILabel!
    
    //Color HEX Lables
    @IBOutlet weak var userColorLabel: UILabel!
    var userColorHex:String = ""
    @IBOutlet weak var matchColorLabel: UILabel!
    
    //Countdown Label
    @IBOutlet weak var timeLabel: UILabel!
    
    //RGB Sliders
    @IBOutlet weak var redSliderOutlet: UISlider!
    @IBOutlet weak var greenSliderOutlet: UISlider!
    @IBOutlet weak var blueSliderOutlet: UISlider!
    
    var color = RGB_Color(r: 0, g: 0, b: 0)
    var colorToMatch = randomColor()
    var totalTimeInGame = 15
    
    func startGame(){
        
        color = RGB_Color(r: 0, g: 0, b: 0)
        colorToMatch = randomColor()
        
        redSliderOutlet.value = 0
        greenSliderOutlet.value = 0
        blueSliderOutlet.value = 0
        
        redSliderOutlet.isEnabled = true
        greenSliderOutlet.isEnabled = true
        blueSliderOutlet.isEnabled = true
        
        userColor.backgroundColor = color.getColor()
        matchColor.backgroundColor = colorToMatch.getColor()
        
        userColor.layer.masksToBounds = true
        matchColor.layer.masksToBounds = true
        
        userColorLabel.text = "..."
        matchColorLabel.text = colorToMatch.getHexColor()
        
        timeLabel.text = "\(totalTimeInGame)"

        gameTimer(totalTimeInGame)
    }
    
    
    //MARK: -viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //The line below is for testing. DO NOT UNCOMMENT
        //savedValues.set(false, forKey: "playedAgain")
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        if !playedBefore{
            print("\n\nNot played before. Showing initial alert...")
            
            showAlert(title: "Welcome", message: "\nWelcome to RGB Matcher! The goal of this game is to match your color to the goal color using three RGB sliders (red, green, and blue respectivly).\n\nGood Luck!\n\n", continueText: "Start Game", continueStartsGame: true, allowCancel: false)
            
            savedValues.set(true, forKey: "playedAgain")

        }else{
            startGame()
        }
    }
    
    
    
    
    
    
    //MARK: -Slider Functions
    
    //Ask Mr. Bunn about slider "NSInvalidArgumentException" error that triggers when slider is moved by the user
    @IBAction func redSlider(_ sender: UISlider!) {
        let currentValue:CGFloat = CGFloat(redSliderOutlet.value)

        //print("R: \(currentValue)")

        color.r = CGFloat(currentValue)
        userColor.backgroundColor = color.getColor()
        userColorHex = color.getColor().toHexString()
    }
    
    @IBAction func greenSlider(_ sender: UISlider!) {
        let currentValue:CGFloat = CGFloat(greenSliderOutlet.value)

        //print("G: \(currentValue)")

        color.g = CGFloat(currentValue)
        userColor.backgroundColor = color.getColor()
        userColorHex = color.getColor().toHexString()
    }
    
    @IBAction func blueSlider(_ sender: UISlider!) {
        let currentValue:CGFloat = CGFloat(blueSliderOutlet.value)

        //print("B: \(currentValue)")

        color.b = CGFloat(currentValue)
        userColor.backgroundColor = color.getColor()
        userColorHex = color.getColor().toHexString()
    }
    
    
    
    
    
    //MARK: Timer
    
    func gameTimer(_ totalTime: Int = 10, repeats: Bool = true){
                    
            print("Game Timer Started")
            var timeLeft = totalTime
            
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: repeats) { timer in
            
                //This code runs every second
                //print("Time Left: \(timeLeft)")
                timeLeft -= 1
                self.timeLabel.text = "\(timeLeft)"
                
                if timeLeft == 0 {
                    //This code runs when the timer is up
                    self.userColorLabel.text = self.userColorHex
                    
                    self.redSliderOutlet.isEnabled = false
                    self.greenSliderOutlet.isEnabled = false
                    self.blueSliderOutlet.isEnabled = false
                    
                    self.showAlert(title: "Score", message: self.displayScoreAsString(), continueText: "New Game", continueStartsGame: true, allowCancel: false)
                    
                    timer.invalidate()
                }

            }//End of Timer
    }//End of restartTimer
    
    //MARK: -showAlert()
    func showAlert(title: String, message: String, continueText: String, continueStartsGame continueStarts:Bool, allowCancel cancel: Bool,  cancelText: String = "Cancel"){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
                
        print("Adding alert action...")
        alert.addAction(UIAlertAction(title: continueText, style: .default, handler: {action in
            
            if !continueStarts{
                print("\n\nContinue does not start game\n\n")
            }else{
                print("\n\nContinue starts game\n\n")
                self.startGame()
            }
            
            }))
        
        if cancel {
            alert.addAction(UIAlertAction(title: cancelText, style: .cancel, handler: nil))
        }
        
        print("Running alert...\n\n")
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    
    //MARK: Find Score
    func displayScoreAsString() -> String{
        let rDiff = colorToMatch.r - color.r
        let gDiff = colorToMatch.g - color.g
        let bDiff = colorToMatch.b - color.b
        
        let diff = sqrt(pow(rDiff, 2) + pow(gDiff, 2) + pow(bDiff, 2))
        let score:number = Int(((1-diff)*100))
        
        
        
        let scorePercent:number = abs(score) //absolute value of score
        
//        let displayScore = """
//                    Raw Score: \(score)
//                    Accuracy: \(scorePercent)%
//        """
                
        let displayScore = "Accuracy: \(scorePercent)%\n\nYour RGB: \(color.getRGBColor())\nGoal RGB: \(colorToMatch.getRGBColor())"
        
        return displayScore
    }
    
}

