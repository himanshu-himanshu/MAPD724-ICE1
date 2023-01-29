//
//  Cloud.swift
//  MAPD724-ICE1
//
//  Created by Himanshu on 2023-01-29.
//

import GameplayKit
import SpriteKit

class Cloud : GameObject {
    // initializer / constructor
    init() {
        super.init(imageString: "cloud", initialScale: 1.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCylce Functions
    override func Start() {
        zPosition = Layers.cloud.rawValue
        
        // Set opacity to random between 0 & 1
        alpha = Double.random(in: 0...1)
        Reset()
    }
    
    override func Update() {
        Move()
        CheckBounds()
    }
    
    override func CheckBounds() {
        if(position.y <= -902)
        {
            Reset()
        }
    }
    
    override func Reset() {
        // randomize the vertical speed
        verticalSpeed = CGFloat((randomSource?.nextUniform())! * 5.0) + 5.0
        
        // randomize the horizontal speed
        horizontalSpeed = CGFloat((randomSource?.nextUniform())! * 4.0) - 2.0
        
        // get a pseudo random number -313 to 313
        let randomX:Int = (randomSource?.nextInt(upperBound: 524))! - 262
        position.x = CGFloat(randomX)
        
        // get a pseudo random number 902 to 932
        let randomY:Int = (randomSource?.nextInt(upperBound: 30))! + 902
        position.y = CGFloat(randomY)
        
        isColliding = false
    }
    
    func Move() {
        position.x -= horizontalSpeed!
        position.y -= verticalSpeed!
       
    }
}
