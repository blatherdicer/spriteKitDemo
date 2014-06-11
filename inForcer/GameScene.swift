//
//  GameScene.swift
//  inForcer
//
//  Created by Bret Richdale on 10/06/14.
//  Copyright (c) 2014 3months. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var contentCreated = false
    
    override func didMoveToView(view: SKView) {
        if !self.contentCreated {
            self.createSceneContents()
            self.contentCreated = true;
        }
    }
    
    func createSceneContents() {
        self.backgroundColor = SKColor.blueColor()
        self.scaleMode = SKSceneScaleMode.AspectFit
        self.addChild (self.newHelloNode())
    }
    
    func newHelloNode() -> SKNode {
        /* Setup your scene here */
        let helloNode = SKLabelNode(fontNamed:"Marker Felt")
        helloNode.text = "Hello, World!"
        helloNode.fontSize = 65
        helloNode.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        helloNode.name = "helloNode"
        return helloNode
    }
    
    override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
        var helloNode = self.childNodeWithName("helloNode")
        if helloNode {
            helloNode!.name = nil
            let moveUp = SKAction.moveByX(0, y:100, duration: 0.2)
            let zoom = SKAction.scaleTo(2.0, duration: 0.3)
            let pause = SKAction.waitForDuration(0.5)
            let fadeAway = SKAction.fadeOutWithDuration(0.5)
            let remove = SKAction.removeFromParent()
            
            let moveSequence = SKAction.sequence([moveUp, zoom, pause, fadeAway,remove])
            helloNode.runAction(moveSequence, completion: {
                let spaceShipScene = SpaceShipScene(size: self.size)
                let doors = SKTransition.doorsOpenVerticalWithDuration(0.5)
                self.view.presentScene(spaceShipScene, transition:doors)
                })
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
}
