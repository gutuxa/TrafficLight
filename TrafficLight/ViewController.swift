//
//  ViewController.swift
//  TrafficLight
//
//  Created by Oksana Tugusheva on 23.03.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var redLightView: UIView!
    @IBOutlet var yellowLightView: UIView!
    @IBOutlet var greenLightView: UIView!
    @IBOutlet var startButton: UIButton!
    
    var lights: [UIView] = []
    var isStartButtonPressed = false
    var nextActiveLightIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lights = [redLightView, yellowLightView, greenLightView]
        
        for light in lights {
            light.layer.cornerRadius = 50
            light.alpha = 0.3
        }
        
        startButton.layer.cornerRadius = 5
    }

    @IBAction func startButtonPressed() {
        if !isStartButtonPressed {
            isStartButtonPressed = true
            startButton.setTitle("Next", for: .normal)
        }
        
        for (lightIndex, light) in lights.enumerated() {
            if lightIndex == nextActiveLightIndex {
                light.alpha = 1
            } else {
                light.alpha = 0.3
            }
        }
        
        nextActiveLightIndex += 1
        
        if nextActiveLightIndex == lights.count {
            nextActiveLightIndex = 0
        }
    }
}

