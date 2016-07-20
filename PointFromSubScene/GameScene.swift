//
//  GameScene.swift
//  PointFromSubScene
//
//  Created by Stephen Brennan on 7/20/16.
//  Copyright (c) 2016 Stephen Brennan. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let n = childNodeWithName("//findMe") {
            for touch in touches {
                print(n.position)
                let location = touch.locationInNode(self)
                // print(touch)
                print("location \(location)")
                let nodePos = n.convertPoint(n.position, toNode: self)
                print("nodePos: \(nodePos)")
                
                let size = CGSize(width: 20, height: 20)
                let bullet = SKSpriteNode(color: UIColor.greenColor(), size: size)
                bullet.position = nodePos
                addChild(bullet)
                
                let move = SKAction.moveToX(frame.width, duration: 1)
                let remove = SKAction.removeFromParent()
                let seq = SKAction.sequence([ move, remove ])
                bullet.runAction(seq)
            }
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
