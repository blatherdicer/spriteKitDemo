//
//  SpaceShipScene.swift
//  inForcer
//
//  Created by Bret Richdale on 11/06/14.
//  Copyright (c) 2014 3months. All rights reserved.
//

import SpriteKit

class SpaceShipScene: SKScene {
    
    var contentCreated = false
    
    override func didMoveToView(view: SKView) {
        if !self.contentCreated {
            self.createSceneContents()
            self.contentCreated = true;
        }
    }
    
    func createSceneContents() {
        self.backgroundColor = SKColor.blackColor()
        self.scaleMode = SKSceneScaleMode.AspectFit
        
        let spaceShip = self.newSpaceShip()
        spaceShip.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame))
        self.addChild(spaceShip)
        
        let makeRocks = SKAction.sequence([
            SKAction.runBlock(self.addRock),
            SKAction.waitForDuration(0.10, withRange:0.15)
            ])
        self.runAction(SKAction.repeatActionForever(makeRocks))
    }
    
    func newSpaceShip() -> SKSpriteNode {
        let hull = SKSpriteNode(color: SKColor.grayColor(), size: CGSizeMake(64,32))
        hull.physicsBody = SKPhysicsBody(rectangleOfSize:hull.size)
        hull.physicsBody.dynamic = false
        
        let light1 = self.newLight()
        light1.position = CGPointMake(-28.0,6.0)
        hull.addChild(light1)
        
        let light2 = self.newLight()
        light2.position = CGPointMake(28.0, 6.0)
        hull.addChild(light2)
        
        let hover = SKAction.sequence([
            SKAction.waitForDuration(1.0),
            SKAction.moveByX(100, y:50, duration: 1.0),
            SKAction.waitForDuration(1.0),
            SKAction.moveByX(-100, y:-50, duration: 1.0)
        ])
        hull.runAction(SKAction.repeatActionForever(hover))
        return hull
    }
    
    func newLight () -> SKSpriteNode {
        
        let light = SKSpriteNode(color:SKColor.yellowColor(), size:CGSizeMake(8,8))
        let blink = SKAction.sequence([
            SKAction.fadeOutWithDuration(0.25),
            SKAction.fadeInWithDuration(0.25)
            ])
        light.runAction(SKAction.repeatActionForever(blink))
        return light
        
    }
    
    func randInRange (from:CGFloat, to:CGFloat) -> CGFloat {
        let range : UInt32 = UInt32(to-from)
        return CGFloat(arc4random() % range)
    }
    
    func addRock() {
        let rock = SKSpriteNode(color: SKColor.brownColor(), size: CGSizeMake(8, 8))
        rock.position = CGPointMake(randInRange(0,to: self.size.width), self.size.height-50)
        rock.name = "rock"
        rock.physicsBody = SKPhysicsBody(rectangleOfSize:rock.size)
        rock.physicsBody.usesPreciseCollisionDetection = true
        self.addChild(rock)
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
}
