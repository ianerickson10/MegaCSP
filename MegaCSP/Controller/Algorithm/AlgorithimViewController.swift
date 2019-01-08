//
//  ViewController.swift
//  AlgorithmIan
//
//  Created by Erickson, Ian on 10/23/18.
//  Copyright © 2018 CTEC. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var algorithimText: UILabel!
    
    @IBOutlet weak var swiftImage: UIImageView!
    
    public override func viewDidLoad() -> Void
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        formatAlgorithim()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //changes the basic text format for each step
    private func formatAlgorithim() -> Void
    {
        let title : String = "How to Xcode work"
        
        let stepOne : String = "On the Welcome to Xcode screen click “Create a new Xcode project”"
        let stepTwo : String = "Select “Single View App”"
        let stepThree : String = "Name your project"
        let stepFour : String = "Organize the project"
        let stepFive : String = "Make sure that the info.plist file is linked"
        
        let algorithim = [stepOne, stepTwo, stepThree, stepFour, stepFive]
        
        let attributesDictionary = [NSAttributedStringKey.font : algorithimText.font]
        let fullAttributedString = NSMutableAttributedString(string: title, attributes: attributesDictionary)
        
        for step in algorithim
        {
            let bullet : String = "😏"
            let formattedStep : String = "\n\(bullet) \(step)"
            let attributedStringStep : NSMutableAttributedString = NSMutableAttributedString(string: formattedStep)
            let outlineStyle = createOutlineStyle()
            
        attributedStringStep.addAttributes([NSAttributedStringKey.paragraphStyle : outlineStyle], range : NSMakeRange(0,attributedStringStep.length))
            
            fullAttributedString.append(attributedStringStep)
        }
        algorithimText.attributedText = fullAttributedString
        
    }
    
    private func createOutlineStyle() -> NSParagraphStyle
    {
        let outlineStyle : NSMutableParagraphStyle = NSMutableParagraphStyle()
        
        outlineStyle.alignment = .left
        outlineStyle.defaultTabInterval = 15
        outlineStyle.firstLineHeadIndent = 20
        outlineStyle.headIndent = 35
        
        return outlineStyle
    }

}

