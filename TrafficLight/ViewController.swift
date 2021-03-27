//
//  ViewController.swift
//  TrafficLight
//
//  Created by Oksana Tugusheva on 23.03.2021.
//

import UIKit

enum Lights {
    case red, yellow, green
}

class ViewController: UIViewController {
    
    @IBOutlet var startButton: UIButton!
    
    @IBOutlet var redLightView: UIView!
    @IBOutlet var yellowLightView: UIView!
    @IBOutlet var greenLightView: UIView!
    
    private let lightOn: CGFloat = 1
    private let lightOff: CGFloat = 0.3
    private var isStartButtonPressed = false
    private var nextActiveLight = Lights.red
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.layer.cornerRadius = 5
        
        redLightView.alpha = lightOff
        yellowLightView.alpha = lightOff
        greenLightView.alpha = lightOff
    }
    
    override func viewWillLayoutSubviews() {
        redLightView.layer.cornerRadius = redLightView.frame.width / 2
        yellowLightView.layer.cornerRadius = yellowLightView.frame.width / 2
        greenLightView.layer.cornerRadius = greenLightView.frame.width / 2
    }

    @IBAction func startButtonPressed() {
        if !isStartButtonPressed {
            isStartButtonPressed = true
            startButton.setTitle("Next", for: .normal)
        }
        
        switch nextActiveLight {
        case .red:
            redLightView.alpha = lightOn
            greenLightView.alpha = lightOff
            nextActiveLight = .yellow
        case .yellow:
            yellowLightView.alpha = lightOn
            redLightView.alpha = lightOff
            nextActiveLight = .green
        case .green:
            greenLightView.alpha = lightOn
            yellowLightView.alpha = lightOff
            nextActiveLight = .red
        }
    }
}

