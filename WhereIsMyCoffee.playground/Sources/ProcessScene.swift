import PlaygroundSupport
import SpriteKit
import AVFoundation

public class ProcessScene: SKScene {
  
  private var cover1: SKSpriteNode!
  private var cover2: SKSpriteNode!
  private var cover3: SKSpriteNode!
  private var separationFruitsRed: SKSpriteNode!
  private var separationFruits: SKSpriteNode!
  private var separationDirt: SKSpriteNode!
  private var sky: SKSpriteNode!
  private var sunAndMoon: SKSpriteNode!
  private var yard: SKSpriteNode!
  private var ground: SKSpriteNode!
  private var fruits: SKSpriteNode!
  private var peelingMachine: SKSpriteNode!
  private var peelingFruits: SKSpriteNode!
  private var continueLabel: SKLabelNode!
  private var messageBubble: SKSpriteNode!
  private var isDay = true
  private var step = 0
  private var actionRunning = true
  
  var musicPlayer: AVAudioPlayer?
    
  public override func didMove(to view: SKView) {
    cover1 = childNode(withName: "//cover1") as? SKSpriteNode
    cover2 = childNode(withName: "//cover2") as? SKSpriteNode
    cover3 = childNode(withName: "//cover3") as? SKSpriteNode
    separationFruitsRed = childNode(withName: "//separationFruitsRed") as? SKSpriteNode
    separationFruits = childNode(withName: "//separationFruits") as? SKSpriteNode
    separationDirt = childNode(withName: "//separationDirt") as? SKSpriteNode
    sky = childNode(withName: "//sky") as? SKSpriteNode
    ground = childNode(withName: "//ground") as? SKSpriteNode
    yard = childNode(withName: "//yard") as? SKSpriteNode
    fruits = childNode(withName: "//fruits") as? SKSpriteNode
    sunAndMoon = childNode(withName: "//sunAndMoon") as? SKSpriteNode
    peelingMachine = childNode(withName: "//peelingMachine") as? SKSpriteNode
    peelingFruits = childNode(withName: "//peelingFruits") as? SKSpriteNode
    continueLabel = childNode(withName: "//continueLabel") as? SKLabelNode
    messageBubble = childNode(withName: "//messageBubble") as? SKSpriteNode
    
    continueLabel.alpha = 0.0
    
    messageBubble.run(.sequence([.wait(forDuration: 1), .move(to: CGPoint(x: 130.5, y: 27.0), duration: 0.5), .playSoundFileNamed("processSceneMessage1Audio.m4a", waitForCompletion: false), .wait(forDuration: 5), .run {
      self.messageBubble.childNode(withName: "messageLabel1")?.alpha = 0
      self.messageBubble.childNode(withName: "messageLabel2")?.alpha = 1
    }, .playSoundFileNamed("processSceneMessage2Audio.m4a", waitForCompletion: false), .wait(forDuration: 5), .move(to: CGPoint(x: 400, y: 27.0), duration: 0.5), .run {
      self.messageBubble.childNode(withName: "messageLabel2")?.alpha = 0
    }]))
    // message audio
    
    cover1.run(.sequence([.wait(forDuration: 11.5), .fadeAlpha(to: 0, duration: 0.5)]))
    
    separationDirt.run(.sequence([.wait(forDuration: 12.5), .move(to: CGPoint(x: 126.0, y: 320.0), duration: 1)]))
    
    self.run(.sequence([.wait(forDuration: 12.5), .playSoundFileNamed("harvestSound.m4a", waitForCompletion: false), .wait(forDuration: 1.5), .playSoundFileNamed("harvestSound.m4a", waitForCompletion: false)]))
    
    separationFruits.run(.sequence([.wait(forDuration: 14), .move(to: CGPoint(x: 139.95, y: 201.5), duration: 1)]))
    
    actionTimer(time: 15, callback: {
      self.showTapToContinue()
    })
  }
  
  private func dryingCoffeeFruits() {
    cover1.run(.fadeAlpha(to: 0.9, duration: 0.5))
    
    messageBubble.run(.sequence([.move(to: CGPoint(x: 130.5, y: 27.0), duration: 0.5), .run {
      self.messageBubble.childNode(withName: "messageLabel3")?.alpha = 1
    }, .playSoundFileNamed("processSceneMessage3Audio.m4a", waitForCompletion: false), .wait(forDuration: 4), .move(to: CGPoint(x: 400, y: 27.0), duration: 0.5), .run {
      self.messageBubble.childNode(withName: "messageLabel3")?.alpha = 0
    }]))
    
    let _ = Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { [self] timer in
      playSound(fileName: "farmBackgroundMusic.mp3", volume: 0.5)
    }
    
    cover2.run(.sequence([.wait(forDuration: 5), .fadeAlpha(to: 0, duration: 0.5)]))
    
    let skyColor = UIColor(red: 0.61586, green: 0.886274, blue: 0.996078, alpha: 1)
    
    sunAndMoon.run(.sequence([.wait(forDuration: 6), .rotate(byAngle: -CGFloat(Double.pi), duration: 1)]))
    
    sky.run(.sequence([.wait(forDuration: 6), .colorize(with: .black, colorBlendFactor: 0.7, duration: 1)]))
    
    ground.run(.sequence([.wait(forDuration: 6), .colorize(with: .black, colorBlendFactor: 0.7, duration: 1)]))
    
    yard.run(.sequence([.wait(forDuration: 6), .colorize(with: .black, colorBlendFactor: 0.7, duration: 1)]))
    
    
    sunAndMoon.run(.sequence([.wait(forDuration: 7.5), .rotate(byAngle: -CGFloat(Double.pi), duration: 1)]))
    
    sky.run(.sequence([.wait(forDuration: 7.5), .colorize(with: skyColor, colorBlendFactor: 0, duration: 1)]))
    
    ground.run(.sequence([.wait(forDuration: 7.5), .colorize(with: .black, colorBlendFactor: 0, duration: 1)]))
    
    yard.run(.sequence([.wait(forDuration: 7.5), .colorize(with: .black, colorBlendFactor: 0, duration: 1)]))
    
    
    sunAndMoon.run(.sequence([.wait(forDuration: 9), .rotate(byAngle: -CGFloat(Double.pi), duration: 1)]))
    
    sky.run(.sequence([.wait(forDuration: 9), .colorize(with: .black, colorBlendFactor: 0.7, duration: 1)]))
    
    ground.run(.sequence([.wait(forDuration: 9), .colorize(with: .black, colorBlendFactor: 0.7, duration: 1)]))
    
    yard.run(.sequence([.wait(forDuration: 9), .colorize(with: .black, colorBlendFactor: 0.7, duration: 1)]))
    
    
    sunAndMoon.run(.sequence([.wait(forDuration: 10.5), .rotate(byAngle: -CGFloat(Double.pi), duration: 1)]))
    
    sky.run(.sequence([.wait(forDuration: 10.5), .colorize(with: skyColor, colorBlendFactor: 0, duration: 1)]))
    
    ground.run(.sequence([.wait(forDuration: 10.5), .colorize(with: .black, colorBlendFactor: 0, duration: 1)]))
    
    yard.run(.sequence([.wait(forDuration: 10.5), .colorize(with: .black, colorBlendFactor: 0, duration: 1)]))
    
    fruits.run(.sequence([.wait(forDuration: 10.5), .colorize(with: .black, colorBlendFactor: 0.7, duration: 1)]))
    
    dismissTapToContinue()
    actionTimer(time: 12, callback: {
      self.musicPlayer?.stop()
      self.step += 1
      self.showTapToContinue()
    })
  }
  
  private func peelingCoffeeFruits() {
    cover2.run(.fadeAlpha(to: 0.9, duration: 0.5))
    
    messageBubble.run(.sequence([.move(to: CGPoint(x: 130.5, y: 27.0), duration: 0.5), .run {
      self.messageBubble.childNode(withName: "messageLabel4")?.alpha = 1
    }, .playSoundFileNamed("processSceneMessage4Audio.m4a", waitForCompletion: false), .wait(forDuration: 4), .move(to: CGPoint(x: 400, y: 27.0), duration: 0.5)]))
    
    cover3.run(.sequence([.wait(forDuration: 5), .fadeAlpha(to: 0, duration: 0.5)]))
    
    peelingFruits.run(.sequence([.wait(forDuration: 6), .move(to: CGPoint(x: -126.253, y: -231.5), duration: 6)]))
    
    dismissTapToContinue()
    
    
    peelingMachine.run(.sequence([.wait(forDuration: 5), .playSoundFileNamed("machineSound.m4a", waitForCompletion: false)]))
    
    let _ = Timer.scheduledTimer(withTimeInterval: 6, repeats: false) { [self] timer in
      shakeSprite(layer: peelingMachine, duration: 6)
      generateCoffeeGrainUnroasted(originPos: CGPoint(x: -71.5, y: -342.205), destinationPosition: CGPoint(x: 129.768, y: -222.415), waitTime: 0.5)
      generateCoffeeGrainUnroasted(originPos: CGPoint(x: -71.5, y: -342.205), destinationPosition: CGPoint(x: 120, y: -252.5), waitTime: 1)
      generateCoffeeGrainUnroasted(originPos: CGPoint(x: -71.5, y: -342.205), destinationPosition: CGPoint(x: 96.268, y: -260.414), waitTime: 1.2)
      generateCoffeeGrainUnroasted(originPos: CGPoint(x: -71.5, y: -342.205), destinationPosition: CGPoint(x: 113.268, y: -233.707), waitTime: 1.6)
      generateCoffeeGrainUnroasted(originPos: CGPoint(x: -71.5, y: -342.205), destinationPosition: CGPoint(x: 141.5, y: -292.415), waitTime: 1.9)
      generateCoffeeGrainUnroasted(originPos: CGPoint(x: -71.5, y: -342.205), destinationPosition: CGPoint(x: 161.638, y: -267), waitTime: 2.4)
      generateCoffeeGrainUnroasted(originPos: CGPoint(x: -71.5, y: -342.205), destinationPosition: CGPoint(x: 124.5, y: -270.883), waitTime: 2.6)
      generateCoffeeGrainUnroasted(originPos: CGPoint(x: -71.5, y: -342.205), destinationPosition: CGPoint(x: 121.5, y: -290), waitTime: 3)
      generateCoffeeGrainUnroasted(originPos: CGPoint(x: -71.5, y: -342.205), destinationPosition: CGPoint(x: 104.5, y: -274.414), waitTime: 3.4)
      generateCoffeeGrainUnroasted(originPos: CGPoint(x: -71.5, y: -342.205), destinationPosition: CGPoint(x: 156.5, y: -230.695), waitTime: 3.8)
      generateCoffeeGrainUnroasted(originPos: CGPoint(x: -71.5, y: -342.205), destinationPosition: CGPoint(x: 144.638, y: -276), waitTime: 4)
      generateCoffeeGrainUnroasted(originPos: CGPoint(x: -71.5, y: -342.205), destinationPosition: CGPoint(x: 163.268, y: -284.883), waitTime: 4.5)
      generateCoffeeGrainUnroasted(originPos: CGPoint(x: -71.5, y: -342.205), destinationPosition: CGPoint(x: 137, y: -238.5), waitTime: 4.7)
      generateCoffeeGrainUnroasted(originPos: CGPoint(x: -71.5, y: -342.205), destinationPosition: CGPoint(x: 98.5, y: -242.883), waitTime: 5)
      generateCoffeeGrainUnroasted(originPos: CGPoint(x: -71.5, y: -342.205), destinationPosition: CGPoint(x: 141.5, y: -256.883), waitTime: 5.4)
      generateCoffeeGrainUnroasted(originPos: CGPoint(x: -71.5, y: -342.205), destinationPosition: CGPoint(x: 161.638, y: -249.823), waitTime: 6)
      
      actionTimer(time: 8, callback: {
        self.step += 1
        self.showTapToContinue()
      })
    }
  }
  
  func shakeSprite(layer: SKSpriteNode, duration: Float) {
      let position = layer.position
      
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
      
      actionsArray.append(SKAction.move(to: position, duration: 0.0))
      
      let actionSeq = SKAction.sequence(actionsArray)
      layer.run(actionSeq)
  }
  
  private func generateCoffeeGrainUnroasted(originPos: CGPoint, destinationPosition: CGPoint, waitTime: TimeInterval) {
    let coffeeGrainUnroasted = SKSpriteNode(imageNamed: "coffeeGrainUnroasted")
    coffeeGrainUnroasted.position = originPos
    coffeeGrainUnroasted.zPosition = 30
    coffeeGrainUnroasted.run(SKAction.sequence([.wait(forDuration: waitTime), .move(to: destinationPosition, duration: 1)]))
    
    self.addChild(coffeeGrainUnroasted)
  }
  
  private func showTapToContinue() {
    continueLabel.run(.repeatForever(SKAction.sequence([.fadeIn(withDuration: 1.5), .fadeOut(withDuration: 1.5)])))
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
  
  private func playSound(fileName: String, volume: Float) {
    let path = Bundle.main.path(forResource: fileName, ofType:nil)!
    let url = URL(fileURLWithPath: path)

    do {
      musicPlayer = try AVAudioPlayer(contentsOf: url)
      musicPlayer?.volume = volume
      musicPlayer?.play()
    } catch {
      print("Problem loading file named: " + fileName)
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
    
    switch step {
    case 0:
      dryingCoffeeFruits()
    case 1:
      peelingCoffeeFruits()
    case 2:
      let newScene = RoastScene(fileNamed: "RoastScene")!
      newScene.scaleMode = .aspectFit
      let transition = SKTransition.crossFade(withDuration: 5)
      self.view?.presentScene(newScene, transition: transition)
    default:
      return
    }
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
