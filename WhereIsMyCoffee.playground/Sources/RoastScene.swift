import PlaygroundSupport
import SpriteKit

public class RoastScene: SKScene {
  
  private var roastMachine: SKSpriteNode!
  private var coffeeGrains: SKSpriteNode!
  private var lightRoastButton: SKSpriteNode!
  private var mediumRoastButton: SKSpriteNode!
  private var darkRoastButton: SKSpriteNode!
  private var smoke: SKSpriteNode!
  private var continueLabel: SKLabelNode!
  private var messageBubble: SKSpriteNode!
  private var step = 0
  private var actionRunning = true
    
  public override func didMove(to view: SKView) {
    roastMachine = childNode(withName: "//roastMachine") as? SKSpriteNode
    coffeeGrains = childNode(withName: "//coffeeGrains") as? SKSpriteNode
    lightRoastButton = childNode(withName: "//lightRoast") as? SKSpriteNode
    mediumRoastButton = childNode(withName: "//mediumRoast") as? SKSpriteNode
    darkRoastButton = childNode(withName: "//darkRoast") as? SKSpriteNode
    smoke = childNode(withName: "//smoke") as? SKSpriteNode
    continueLabel = childNode(withName: "//continueLabel") as? SKLabelNode
    messageBubble = childNode(withName: "//messageBubble") as? SKSpriteNode
    
    continueLabel.alpha = 0.0
    
    messageBubble.run(.sequence([.wait(forDuration: 1), .move(to: CGPoint(x: 130.5, y: 27.0), duration: 0.5), .playSoundFileNamed("roastSceneMessage1Audio.m4a", waitForCompletion: false), .wait(forDuration: 6), .run {
      self.messageBubble.childNode(withName: "messageLabel1")?.alpha = 0
      self.messageBubble.childNode(withName: "messageLabel2")?.alpha = 1
    }, .playSoundFileNamed("roastSceneMessage2Audio.m4a", waitForCompletion: false), .wait(forDuration: 5), .move(to: CGPoint(x: 400, y: 27.0), duration: 0.5), .run {
      self.messageBubble.childNode(withName: "messageLabel2")?.alpha = 0
    }]))
    // message audio
    
    lightRoastButton.run(.sequence([.wait(forDuration: 12), .fadeAlpha(to: 1, duration: 1)]))
    mediumRoastButton.run(.sequence([.wait(forDuration: 12), .fadeAlpha(to: 1, duration: 1)]))
    darkRoastButton.run(.sequence([.wait(forDuration: 12), .fadeAlpha(to: 1, duration: 1)]))
    
    dismissTapToContinue()
    actionTimer(time: 12, callback: {
      self.continueLabel.text = "Choose your roasting profile"
      self.showTapToContinue()
    })
  }
  
  private func chooseCoffeeRoastProfile(pos: CGPoint) {
    if lightRoastButton.contains(pos) {
      mediumRoastButton.removeAllActions()
      mediumRoastButton.alpha = 0.0
      darkRoastButton.removeAllActions()
      darkRoastButton.alpha = 0.0
      lightRoastButton.removeAllActions()
      lightRoastButton.alpha = 1.0
      lightRoastButton.run(.move(to: CGPoint(x: 0.853, y: -211.096), duration: 0.5))
      roastProfile = "light"
    } else if mediumRoastButton.contains(pos) {
      lightRoastButton.removeAllActions()
      lightRoastButton.alpha = 0.0
      darkRoastButton.removeAllActions()
      darkRoastButton.alpha = 0.0
      mediumRoastButton.removeAllActions()
      mediumRoastButton.alpha = 1.0
      roastProfile = "medium"
    } else if darkRoastButton.contains(pos) {
      mediumRoastButton.removeAllActions()
      mediumRoastButton.alpha = 0.0
      lightRoastButton.removeAllActions()
      lightRoastButton.alpha = 0.0
      darkRoastButton.removeAllActions()
      darkRoastButton.alpha = 1.0
      darkRoastButton.run(.move(to: CGPoint(x: 0.853, y: -211.096), duration: 0.5))
      roastProfile = "dark"
    } else {
      return
    }
    
    roastMachine.run(.sequence([.wait(forDuration: 1), .group([.playSoundFileNamed("roastSound.m4a", waitForCompletion: false), shakeSpriteAction(layerPosition: roastMachine.position, duration: 6.5)])]))
    
    coffeeGrains.run(.sequence([.wait(forDuration: 1), .fadeAlpha(to: 1, duration: 0.5), .move(to: CGPoint(x: -27.827, y: -54.226), duration: 3), .group([shakeSpriteAction(layerPosition: coffeeGrains.position, duration: 3), .colorize(with: roastProfileColor(type: roastProfile), colorBlendFactor: 1, duration: 3)]), .run {
      self.coffeeGrains.position = CGPoint(x: -16.829, y: -87.911)
    }, .move(to: CGPoint(x: 125.055, y: -87.912), duration: 1)]))
    
    let coffeeGrainsCover = childNode(withName: "//coffeeGrainsCover") as? SKSpriteNode
    coffeeGrainsCover?.run(.sequence([.wait(forDuration: 5), .run {
      coffeeGrainsCover?.zPosition = 10
    }]))
    
    smoke.run(.sequence([.wait(forDuration: 9), .fadeAlpha(to: 1, duration: 2)]))
    
    messageBubble.run(.sequence([.wait(forDuration: 11), .run {
      self.messageBubble.childNode(withName: "messageLabel3")?.alpha = 1
    }, .move(to: CGPoint(x: 130.5, y: 27.0), duration: 0.5), .playSoundFileNamed("roastSceneMessage3Audio.m4a", waitForCompletion: false), .wait(forDuration: 3), .run {
      self.messageBubble.childNode(withName: "messageLabel3")?.alpha = 0
      self.messageBubble.childNode(withName: "messageLabel4")?.alpha = 1
    }, .playSoundFileNamed("roastSceneMessage4Audio.m4a", waitForCompletion: false), .wait(forDuration: 5)]))
    
    dismissTapToContinue()
    
    let _ = Timer.scheduledTimer(withTimeInterval: 19, repeats: false) { [self] timer in
      self.run(.playSoundFileNamed("flashbackSound.mp3", waitForCompletion: false))
      let newScene = EndScene(fileNamed: "EndScene")!
      newScene.scaleMode = .aspectFit
      let transition = SKTransition.fade(with: .white, duration: 5)
      self.view?.presentScene(newScene, transition: transition)
    }
  }
  
  private func shakeSpriteAction(layerPosition: CGPoint, duration: Float) -> SKAction {
    let position = layerPosition
    
    let amplitudeX:Float = 10
    let amplitudeY:Float = 6
    let numberOfShakes = duration / 0.04
    var actionsArray:[SKAction] = []
    for _ in 1...Int(numberOfShakes) {
        let moveX = Float(arc4random_uniform(UInt32(amplitudeX))) - amplitudeX / 2
        let moveY = Float(arc4random_uniform(UInt32(amplitudeY))) - amplitudeY / 2
        let shakeAction = SKAction.moveBy(x: CGFloat(moveX), y: CGFloat(moveY), duration: 0.02)
        shakeAction.timingMode = SKActionTimingMode.easeOut
        actionsArray.append(shakeAction)
        actionsArray.append(shakeAction.reversed())
    }
    
    actionsArray.append(.move(to: position, duration: 0.0))
    
    let actionSeq = SKAction.sequence(actionsArray)
    
    return actionSeq
  }
  
  private func showTapToContinue() {
    continueLabel.run(.repeatForever(.sequence([.fadeIn(withDuration: 1.5), .fadeOut(withDuration: 1.5)])))
  }
  
  private func dismissTapToContinue() {
    continueLabel.removeAllActions()
    continueLabel.alpha = 0.0
  }
  
  private func actionTimer(time: Double, callback: @escaping () -> Void) {
    actionRunning = true
    let _ = Timer.scheduledTimer(withTimeInterval: time, repeats: false) { [self] timer in
      actionRunning = false
      callback()
    }
  }
  
  
    
  @objc static public override var supportsSecureCoding: Bool {
    // SKNode conforms to NSSecureCoding, so any subclass going
    // through the decoding process must support secure coding
    get {
        return true
    }
  }
    
  func touchDown(atPoint pos: CGPoint) {
    if actionRunning {
      return
    }
    
    chooseCoffeeRoastProfile(pos: pos)
  }
    
  func touchMoved(toPoint pos: CGPoint) {
  }
  
  func touchUp(atPoint pos : CGPoint) {
  }
    
  public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    for t in touches { touchDown(atPoint: t.location(in: self)) }
  }
    
  public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    for t in touches { touchMoved(toPoint: t.location(in: self)) }
  }
    
  public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    for t in touches { touchUp(atPoint: t.location(in: self)) }
  }
    
  public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    for t in touches { touchUp(atPoint: t.location(in: self)) }
  }
    
  public override func update(_ currentTime: TimeInterval) {
    // Called before each frame is rendered
  }
}

