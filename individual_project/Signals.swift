//
//  Signals.swift
//  individual_project
//
//  Created by Alexan Gomez on 10/31/17.
//  Copyright © 2017 Alexan Gomez. All rights reserved.
//

import Foundation
import GameplayKit // required to access to random number genertor

class Signals{
    var bodyTemperature: Double
    var heartBeat: Int
    
    init(temperatureValue: Double, heartBeatValue: Int) {
        bodyTemperature = temperatureValue
        heartBeat = heartBeatValue
    }
    
    // Creates random temperature values that are normally distributed with mean at 37°C and 0.5 StDev
    func randomTemperature() {
        self.bodyTemperature = drand48() + 37
    }
    
    // Generates a random hearthbead around 75BPM
    func randomHeartRate(){
        let lower : UInt32 = 70
        let upper : UInt32 = 80
        let randomNumber = arc4random_uniform(upper - lower) + lower
        self.heartBeat = Int(randomNumber)
    }
}
