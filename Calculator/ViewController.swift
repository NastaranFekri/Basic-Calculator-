
//  ViewController.swift
//  Calculator
//
//  Created by Nastaran Fekri on 22.01.16.
//  Copyright © 2016 Nastaran Fekri. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
     
     enum Operation: String {
          
          case Divide = "/"
          case Multiply = "*"
          case Subtract = "-"
          case Add = "+"
          case Equal = "="
          case Empty = "Empty"
        
     }

     @IBOutlet weak var outputLbl: UILabel!
     
     var btnsound : AVAudioPlayer!
     var runningNumber = ""
     var leftValStr = ""
     var rightValStr = ""
     var currentOperation : Operation = Operation.Empty
     var result = ""
     
     
     override func viewDidLoad() {
          super.viewDidLoad()
         let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
          let soundUrl = NSURL(fileURLWithPath: path!)
         
               do{
                    try  btnsound = AVAudioPlayer(contentsOfURL: soundUrl)
                    btnsound.prepareToPlay()
               }catch let err as NSError {
                    print(err.debugDescription)
                    
          }
          
     }

     override func didReceiveMemoryWarning() {
          super.didReceiveMemoryWarning()
          // Dispose of any resources that can be recreated.
     }
     @IBAction func numberPressed( btn : UIButton! ){
          btnsound.play()
          runningNumber += "\(btn.tag)"
          outputLbl.text = runningNumber
     
     }

     @IBAction func onDivivedpressed(sender: AnyObject) {
          processOperation(Operation.Divide)
          
     }
     
     @IBAction func onMultiplypressed(sender: AnyObject) {
          processOperation(Operation.Multiply)
          
     }
     
     @IBAction func onSubtractpressed(sender: AnyObject) {
          processOperation(Operation.Subtract)
          
     }
     
     @IBAction func onAddpressed(sender: AnyObject) {
          processOperation(Operation.Add)
          
     }
     
     @IBAction func onEqualpressed(sender: AnyObject) {
          processOperation(currentOperation)
          
     }
     func processOperation( op :Operation){
          btnsound.play()
          if currentOperation != Operation.Empty {
               // add some math
               // A user selected an operator, but then selected another operator without 
               // first entering the number
               if runningNumber != "" {
                    
                    rightValStr = runningNumber
                    runningNumber = ""
                    if currentOperation == Operation.Divide {
                         result = "\(Double(leftValStr)! / Double(rightValStr)!)"
                    } else if currentOperation == Operation.Multiply {
                         result = "\(Double(leftValStr)! * Double(rightValStr)!)"
                    } else if currentOperation == Operation.Add {
                         result = "\(Double(leftValStr)! + Double(rightValStr)!)"
                    } else if currentOperation == Operation.Subtract {
                         result = "\(Double(leftValStr)! - Double(rightValStr)!)"
                    }
                    leftValStr = result
                    outputLbl.text = result
                    
               }
               
               currentOperation = op
          

    } else  {
     
               leftValStr = runningNumber
               runningNumber = ""
               currentOperation = op
               
          }
}

}
     


