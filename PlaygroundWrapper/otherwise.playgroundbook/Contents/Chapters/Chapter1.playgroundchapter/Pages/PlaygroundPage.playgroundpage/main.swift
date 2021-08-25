/*:
 */
/*:
 ![Uma imagem explicativa](otherlogo.png)
 
 */
/*:
 ---
 ---
 ---
 
 ## About this game
 
 This is a **game** about celebrating **diversity**. We all come in different **colors** and **shapes** and that is something good! We can all belong by being **ourselves** and that’s what it’s all about.
 
 ---
 
 - Note: For a better experience, play this playground in fullscreen (portrait mode).
 */
/*:
 */

//#-hidden-code
//: A SpriteKit based Playground

import PlaygroundSupport
import SpriteKit
import BookCore


// Load the SKScene from 'GameScene.sks'
let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 480, height: 640))
if let scene = GameScene(fileNamed: "GameScene") {
    // Set the scale mode to scale to fit the window
    scene.scaleMode = .aspectFit
    
    // Present the scene
    sceneView.presentScene(scene)
}

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
PlaygroundPage.current.needsIndefiniteExecution = true
//#-end-hidden-code

