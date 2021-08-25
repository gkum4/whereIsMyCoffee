import PlaygroundSupport
import SpriteKit
import AVFoundation

public class PlantScene: SKScene {
  
  private var sky: SKSpriteNode!
  private var mountains: SKSpriteNode!
  private var sunAndMoon: SKSpriteNode!
  private var ground: SKSpriteNode!
  private var plant: SKSpriteNode!
  private var fruits: SKSpriteNode!
  private var basket: SKSpriteNode!
  private var continueLabel: SKLabelNode!
  private var messageBubble: SKSpriteNode!
  private var isDay = true
  private var step = 0
  private var daysSequence = ["1", "5", "10", "20", "300", "600", "1825"]
  private var plantSequence = ["seed.png", "sprout1.png", "sprout2.png", "firstLeaves.png", "smallBush.png", "tree.png"]
  private var plantPositionYFixSequence = [-300.0, -300.0, -240.0, -240.0, -160.0, -105.0, -56] as Array<CGFloat>
  private var messagesSequence = ["messageLabel2", "messageLabel3", "messageLabel4", "messageLabel5"]
  private var actionRunning = true
  private var plantedSeed = false
  private var plantPosition = CGPoint(x: 0.0, y: -300.0)
  private var dragging: SKSpriteNode!
  
  private var musicPlayer: AVAudioPlayer?
    
  public override func didMove(to view: SKView) {
    sky = childNode(withName: "//sky") as? SKSpriteNode
    mountains = childNode(withName: "//mountains") as? SKSpriteNode
    sunAndMoon = childNode(withName: "//sunAndMoon") as? SKSpriteNode
    ground = childNode(withName: "//ground") as? SKSpriteNode
    continueLabel = childNode(withName: "//continueLabel") as? SKLabelNode
    messageBubble = childNode(withName: "//messageBubble") as? SKSpriteNode
    
    messageBubble.run(.sequence([.move(to: CGPoint(x: 130.5, y: 27.0), duration: 0.5), .playSoundFileNamed("plantSceneMessage1Audio.m4a", waitForCompletion: false), .wait(forDuration: 5), .run {
      self.messageBubble.childNode(withName: "messageLabel1")?.alpha = 0
      self.messageBubble.childNode(withName: "messageLabel2")?.alpha = 1
    }, .playSoundFileNamed("plantSceneMessage2Audio.m4a", waitForCompletion: false), .wait(forDuration: 5), .move(to: CGPoint(x: 400, y: 27.0), duration: 0.5), .run {
      self.messageBubble.childNode(withName: "messageLabel2")?.alpha = 0
    }]))
    // message audio
    
    playMusic(fileName: "farmBackgroundMusic.mp3", volume: 0.5)
    musicPlayer?.numberOfLoops = 100
    
    continueLabel.alpha = 0.0
    actionTimer(time: 13.0, callback: {
      self.continueLabel.text = "Choose where to plant the seed"
      self.showTapToContinue()
    })
  }
  
  private func plantSeed(position: CGPoint) {
    plant = SKSpriteNode(imageNamed: "seed.png")
    plant.zPosition = 20.0
    continueLabel.text = ""
    
    if position.y < -200.0 {
      plant.position = CGPoint(x: position.x, y: -80.0)
    } else {
      plant.position = position
    }
    
    plantPosition = CGPoint(x: position.x, y: -300.0)
    
    plant.run(.move(to: plantPosition, duration: 1))
    
    self.addChild(plant)
    
    self.run(.sequence([.wait(forDuration: 1), .playSoundFileNamed("plantGrowingAudio.m4a", waitForCompletion: false)]))
    
    messageBubble.run(.sequence([.wait(forDuration: 1.2), .move(to: CGPoint(x: 130.5, y: 27.0), duration: 0.5), .run {
      self.messageBubble.childNode(withName: "messageLabel3")?.alpha = 1
    }, .playSoundFileNamed("plantSceneMessage3Audio.m4a", waitForCompletion: false), .wait(forDuration: 5), .move(to: CGPoint(x: 400, y: 27.0), duration: 0.5), .run {
      self.messageBubble.childNode(withName: "messageLabel3")?.alpha = 0
    }]))
    
    actionTimer(time: 7, callback: {
      self.plantedSeed = true
      self.continueLabel.text = "Tap to continue"
      self.step += 1
    })
  }
  
  private func changeDayAndNight() {
    var factor: CGFloat
    var skyColor: UIColor
    var timeToContinue = 2.0
    
    if isDay {
      factor = 0.7 as CGFloat
      skyColor = UIColor(.black)
    } else {
      factor = 0.0 as CGFloat
      skyColor = UIColor(red: 0.61586, green: 0.886274, blue: 0.996078, alpha: 1)
      step += 1
      self.run(.playSoundFileNamed("plantGrowingAudio.m4a", waitForCompletion: false))
    }
    
    sunAndMoon.run(.rotate(byAngle: -CGFloat(Double.pi), duration: 2))
    sky.run(.colorize(with: skyColor, colorBlendFactor: 1, duration: 2))
    mountains.run(.colorize(with: .black, colorBlendFactor: factor, duration: 2))
    ground.run(.colorize(with: .black, colorBlendFactor: factor, duration: 2))
    plant.run(.colorize(with: .black, colorBlendFactor: factor, duration: 2))
    
    if (step != 6) {
      plant.texture = SKTexture(imageNamed: plantSequence[step])
      plant.size = (plant.texture?.size())!
      plant.position = CGPoint(x: plantPosition.x, y: plantPositionYFixSequence[step])
    } else {
      fruits = SKSpriteNode(imageNamed: "fruits.png")
      fruits.zPosition = 32.0
      fruits.position = CGPoint(x: plantPosition.x, y: -44.0)
      fruits.run(.colorize(with: .black, colorBlendFactor: factor, duration: 2))
      basket = SKSpriteNode(imageNamed: "basket.png")
      basket.zPosition = 30.0
      let basketXPosition = plantPosition.x < 50.0 ? plantPosition.x + 120.0 : plantPosition.x - 120.0
      basket.position = CGPoint(x: basketXPosition, y: -232.0)
      basket.run(.colorize(with: .black, colorBlendFactor: factor, duration: 2))
      self.addChild(fruits)
      self.addChild(basket)
      
      timeToContinue = 4.5
      
      messageBubble.run(.sequence([.wait(forDuration: 2.2), .move(to: CGPoint(x: 130.5, y: 27.0), duration: 0.5), .run {
        self.messageBubble.childNode(withName: "messageLabel5")?.alpha = 1
      }, .playSoundFileNamed("plantSceneMessage5Audio.m4a", waitForCompletion: false), .wait(forDuration: 5), .move(to: CGPoint(x: 400, y: 27.0), duration: 0.5), .run {
        self.messageBubble.childNode(withName: "messageLabel5")?.alpha = 0
      }]))
    }
    
    isDay = !isDay
    
    if step == 3 && isDay {
      timeToContinue = 4.5
      messageBubble.run(.sequence([.wait(forDuration: 2.2), .run {
        self.messageBubble.childNode(withName: "messageLabel4")?.alpha = 1
      }, .move(to: CGPoint(x: 130.5, y: 27.0), duration: 0.5), .playSoundFileNamed("plantSceneMessage4Audio.m4a", waitForCompletion: false), .wait(forDuration: 5), .move(to: CGPoint(x: 400, y: 27.0), duration: 0.5), .run {
        self.messageBubble.childNode(withName: "messageLabel4")?.alpha = 0
      }]))
    }
    
    dismissTapToContinue()
    actionTimer(time: timeToContinue, callback: {
      if self.step != 6 {
        self.continueLabel.text = "Tap to continue"
      } else {
        self.continueLabel.text = "harvest coffee fruits"
        self.step += 1
      }
      self.showTapToContinue()
    })
  }
  
  private func harvest(position: CGPoint) {
    if !fruits.contains(position) {
      return
    }
    
    fruits.run(.playSoundFileNamed("harvestSound.mp3", waitForCompletion: false))
    
    dragging = fruits
    
    fruits.setScale(1.5)
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
  
  private func playMusic(fileName: String, volume: Float) {
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
      plantSeed(position: pos)
    case 1...6:
      changeDayAndNight()
    case 7:
      harvest(position: pos)
    case 8:
      musicPlayer?.stop()
      let newScene = ProcessScene(fileNamed: "ProcessScene")!
      newScene.scaleMode = .aspectFit
      let transition = SKTransition.crossFade(withDuration: 5)
      self.view?.presentScene(newScene, transition: transition)
    default:
      return
    }
  }
    
  func touchMoved(toPoint pos: CGPoint) {
    if dragging != nil {
      dragging.position = pos
      
      if basket.contains(pos) {
        dragging.setScale(1)
      } else {
        fruits.setScale(1.5)
      }
    }
  }
  
  func touchUp(atPoint pos : CGPoint) {
    if dragging != nil {
      if basket.contains(pos) {
        fruits.removeFromParent()
        basket.texture = SKTexture(imageNamed: "basketWithFruits.png")
        basket.size = (self.basket.texture?.size())!
        basket.position = CGPoint(x: self.basket.position.x, y: self.basket.position.y + 10.0)
        
        basket.run(.playSoundFileNamed("dropSound.m4a", waitForCompletion: false))
        
        messageBubble.run(.sequence([.wait(forDuration: 0.5), .move(to: CGPoint(x: 130.5, y: 27.0), duration: 0.5), .run {
          self.messageBubble.childNode(withName: "messageLabel6")?.alpha = 1
        }, .playSoundFileNamed("plantSceneMessage6Audio.m4a", waitForCompletion: false), .wait(forDuration: 5), .move(to: CGPoint(x: 400, y: 27.0), duration: 0.5), .run {
          self.messageBubble.childNode(withName: "messageLabel6")?.alpha = 0
        }]))
        
        self.continueLabel.text = "Tap to continue"
        self.step += 1
      } else {
        fruits.position = CGPoint(x: plantPosition.x, y: -44.0)
        fruits.setScale(1.0)
      }
      
      dragging = nil
    }
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

/*
Credits:
 
- farmBackgroundMusic.mp3 by:
 dobroide (https://freesound.org/people/dobroide/)
 freesound (https://freesound.org/)
 
- 
 */
