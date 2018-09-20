//
//  GameScene.swift
//  Game-Starter-Empty
//
//  Created by mitchell hudson on 9/13/18.
//  Copyright © 2018 Make School. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
  
    // Called when the scene has been displayed
    override func didMove(to view: SKView) {

        let aBox = createNode();
        let boxSize = CGPoint(x: aBox.size.width, y: aBox.size.height);
        let midScreen = CGPoint(x: (view.scene?.size.width)! / 2  , y: (view.scene?.size.height)! / 2);

        getGrid(nodeSize: boxSize, midScreenSize: midScreen);
        
    }
    
    func random(num: Int) -> Int {
        return Int(arc4random_uniform(UInt32(num)));
    }
    
    func getGrid(nodeSize: CGPoint, midScreenSize: CGPoint) {
        getColOne(nodeSize: nodeSize, midScreenSize: midScreenSize);
        getColTwo(nodeSize: nodeSize, midScreenSize: midScreenSize);
        getColThree(nodeSize: nodeSize, midScreenSize: midScreenSize);

    }
    
    func getColOne(nodeSize: CGPoint, midScreenSize: CGPoint) {

        let nodeArr = insertNodeRow();
        initiateActionOne(midScreenSize: midScreenSize, nodeSize: nodeSize, nodeArr: nodeArr);
    }
    
    func getColTwo(nodeSize: CGPoint, midScreenSize: CGPoint) {
        
        let nodeArr = insertNodeRow();
        initiateActionTwo(midScreenSize: midScreenSize, nodeSize: nodeSize, nodeArr: nodeArr);
    }
    
    func getColThree(nodeSize: CGPoint, midScreenSize: CGPoint) {
        
        let nodeArr = insertNodeRow();
        initiateActionThree(midScreenSize: midScreenSize, nodeSize: nodeSize, nodeArr: nodeArr);
    }
    
    
    func insertNodeRow() -> [SKSpriteNode] {
        var nodeArr: [SKSpriteNode] = [];
        for _ in 0..<3 {
            let node = createNode();
            nodeArr.append(node);
            addChild(node);
        }
        return nodeArr;
    }
    
    func createNode() -> SKSpriteNode {
        let size = CGSize(width: 30, height: 30);
        let box = SKSpriteNode(texture: nil, color: UIColor.red, size: size);
        box.position.x = CGFloat(random(num: Int((self.scene?.size.width)!)))
        box.position.y = CGFloat(random(num: Int((self.scene?.size.height)!)))
        return box;
    }
    
    func runAction(midScreenSize: CGPoint, leftPos: CGPoint, rightPos: CGPoint, nodeArr: [SKSpriteNode]) {
        
        var count = 0;
        
        let action1 = SKAction.move(to: midScreenSize, duration: 1.7);
        let action2 = SKAction.move(to: rightPos , duration: 2);
        let action3 = SKAction.move(to: leftPos, duration: 2.3);
        
        for _ in nodeArr {
            switch(count) {
            case 0:
                nodeArr[0].run(action1);
                break;
            case 1:
                nodeArr[1].run(action2);
                break;
            case 2:
                nodeArr[2].run(action3);
                break;
            default:
                print("No number being counted")
            }
            count += 1;
        }
    }
    
    func initiateActionOne(midScreenSize: CGPoint, nodeSize: CGPoint, nodeArr: [SKSpriteNode]){
        let rightPos = CGPoint(x: midScreenSize.x + nodeSize.x + 10, y: ((view?.scene?.size.height)! / 2) - 40)
        let leftPos = CGPoint(x: midScreenSize.x - nodeSize.x - 10, y: ((view?.scene?.size.height)! / 2) - 40);
        var midScreen = midScreenSize;
        midScreen.y = midScreen.y - 40;

        runAction(midScreenSize: midScreen, leftPos: leftPos, rightPos: rightPos, nodeArr: nodeArr);
    }
    
    func initiateActionTwo(midScreenSize: CGPoint, nodeSize: CGPoint, nodeArr: [SKSpriteNode]){
        let rightPos = CGPoint(x: midScreenSize.x + nodeSize.x + 10, y: (view?.scene?.size.height)! / 2)
        let leftPos = CGPoint(x: midScreenSize.x - nodeSize.x - 10, y: (view?.scene?.size.height)! / 2);
        
        runAction(midScreenSize: midScreenSize, leftPos: leftPos, rightPos: rightPos, nodeArr: nodeArr);
    }
    
    func initiateActionThree(midScreenSize: CGPoint, nodeSize: CGPoint, nodeArr: [SKSpriteNode]){
        let rightPos = CGPoint(x: midScreenSize.x + nodeSize.x + 10, y: ((view?.scene?.size.height)! / 2) + 40)
        let leftPos = CGPoint(x: midScreenSize.x - nodeSize.x - 10, y: ((view?.scene?.size.height)! / 2) + 40);
        var midScreen = midScreenSize;
        midScreen.y = midScreen.y + 40;
        
        runAction(midScreenSize: midScreen, leftPos: leftPos, rightPos: rightPos, nodeArr: nodeArr);
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
