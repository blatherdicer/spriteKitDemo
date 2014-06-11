//
//  GameViewController.swift
//  inForcer
//
//  Created by Bret Richdale on 10/06/14.
//  Copyright (c) 2014 3months. All rights reserved.
//

import UIKit
import SpriteKit

//extension SKNode {
//    class func unarchiveFromFile(file : NSString) -> SKNode? {
//        
//        let path = NSBundle.mainBundle().pathForResource(file, ofType: "sks")
//        
//        var sceneData = NSData.dataWithContentsOfFile(path, options: .DataReadingMappedIfSafe, error: nil)
//        var archiver = NSKeyedUnarchiver(forReadingWithData: sceneData)
//        
//        archiver.setClass(self.classForKeyedUnarchiver(), forClassName: "SKScene")
//        let scene = archiver.decodeObjectForKey(NSKeyedArchiveRootObjectKey) as GameScene
//        archiver.finishDecoding()
//        return scene
//    }
//}

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let skView = self.view as SKView
            skView.showsDrawCount = true
            skView.showsNodeCount = true
            skView.showsDrawCount = true
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
    }

    override func viewWillAppear(animated: Bool) {
        
        var myScene = GameScene(size:CGSizeMake(768, 1024))
        var spriteView = self.view as SKView
        spriteView.presentScene(myScene)
        
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> Int {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return Int(UIInterfaceOrientationMask.AllButUpsideDown.toRaw())
        } else {
            return Int(UIInterfaceOrientationMask.All.toRaw())
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
}
