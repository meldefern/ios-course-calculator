//
//  ViewController.swift
//  retro-calculator
//
//  Created by Melinda Fernandes on 22/03/2016.
//  Copyright © 2016 Melinda Fernandes. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Empty = "Empty"
    }
    
    @IBOutlet weak var outputLbl: UILabel!
    
    //var btnSound: AVAudioPlayer!
    
    var runningNumber = ""
    var leftValStr = ""
    var rightValStr = ""
    var currentOperation: Operation = Operation.Empty
    var result = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
//        let soundUrl = NSURL(fileURLWithPath: path!)
//        
//        do {
//            try btnSound = AVAudioPlayer(contentsOfURL: soundUrl)
//            btnSound.prepareToPlay()
//        } catch let err as NSError {
//            print(err.debugDescription)
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClearPressed(btn: UIButton!) {
        runningNumber = ""
        outputLbl.text = runningNumber
        leftValStr = ""
        rightValStr = ""
        currentOperation = Operation.Empty
        result = ""
    }

    @IBAction func numberPressed(btn: UIButton!) {
        //playSound()
        
        runningNumber += "\(btn.tag)"
        outputLbl.text = runningNumber
    }
    
    @IBAction func onDividePressed(sender: AnyObject) {
        processOperation(Operation.Divide)
    }
    
    @IBAction func onMultiplyPressed(sender: AnyObject) {
        processOperation(Operation.Multiply)
    }
    
    @IBAction func onSubtractPressed(sender: AnyObject) {
        processOperation(Operation.Subtract)
    }
    
    @IBAction func onAddPressed(sender: AnyObject) {
        processOperation(Operation.Add)
    }
    
    @IBAction func onEqualPressed(sender: AnyObject) {
        if currentOperation != Operation.Empty && leftValStr != "" {
            processOperation(currentOperation)
        }
    }
    
    func processOperation(op: Operation) {
        //playSound()
        
        if currentOperation != Operation.Empty {
            // Run some math
            
            //A user selected an operator, but then selected another operator without
            //first entering a number
            if runningNumber != "" {
                rightValStr = runningNumber
                runningNumber = ""
                
            
                if currentOperation == Operation.Multiply {
                    result = "\(Double(leftValStr)! * Double(rightValStr)!)"
                } else if currentOperation == Operation.Divide {
                    result = "\(Double(leftValStr)! / Double(rightValStr)!)"
                } else if currentOperation == Operation.Add {
                    result = "\(Double(leftValStr)! + Double(rightValStr)!)"
                } else if currentOperation == Operation.Subtract {
                    result = "\(Double(leftValStr)! - Double(rightValStr)!)"
                }
                
                leftValStr = result
                outputLbl.text = result
                
            }
            
            currentOperation = op
            
        } else {
            // This is the first time the operator has been pressed
            leftValStr = runningNumber
            runningNumber = ""
            currentOperation = op
            
        }
    }
    
    func playSound() {
//        if btnSound.playing {
//            btnSound.stop()
//        }
//        
//        btnSound.play()
    }
}

