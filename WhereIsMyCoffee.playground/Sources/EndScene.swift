import PlaygroundSupport
import SpriteKit
import AVFoundation

public class EndScene: SKScene {
    
  private var speech1: SKSpriteNode!
  private var speech2: SKSpriteNode!
  private var continueLabel: SKLabelNode!
  private var actionRunning = true
  var musicPlayer: AVAudioPlayer?

  public override func didMove(to view: SKView) {
    speech1 = childNode(withName: "//speech1") as? SKSpriteNode
    speech2 = childNode(withName: "//speech2") as? SKSpriteNode
    continueLabel = childNode(withName: "//continueLabel") as? SKLabelNode
    continueLabel.alpha = 0.0

    self.run(.sequence([.wait(forDuration: 1), .playSoundFileNamed("servingCoffeeSound.m4a", waitForCompletion: false), .wait(forDuration: 4.5), .playSoundFileNamed("passingCoffeeCupSound.m4a", waitForCompletion: false)]))
    
    speech2.run(.sequence([.wait(forDuration: 5.5), .move(to: CGPoint(x: 130.5, y: 0.0), duration: 0.5), .playSoundFileNamed("endSceneSpeech2Audio.m4a", waitForCompletion: false), .wait(forDuration: 3), .move(to: CGPoint(x: 413.805, y: 0.0), duration: 0.5)]))
    
    speech1.run(.sequence([.wait(forDuration: 9.5), .move(to: CGPoint(x: -130, y: 0.0), duration: 0.5), .playSoundFileNamed("endSceneSpeech1Step1Audio.m4a", waitForCompletion: false), .wait(forDuration: 3), .run {
      self.speech1.childNode(withName: "speech1Label1")?.alpha = 0
      self.speech1.childNode(withName: "speech1Label2")?.alpha = 1
    }, .playSoundFileNamed("endSceneSpeech1Step2Audio.m4a", waitForCompletion: false), .wait(forDuration: 2), .run {
      self.speech1.childNode(withName: "speech1Label2")?.alpha = 0
      self.speech1.childNode(withName: "speech1Label3")?.alpha = 1
    }, .playSoundFileNamed("endSceneSpeech1Step3Audio.m4a", waitForCompletion: false), .wait(forDuration: 4), .move(to: CGPoint(x: -406.425, y: 0.0), duration: 0.5)]))
    
    playSound(fileName: "coffeeShopBackgroundMusic.mp3", volume: 0.5)

    actionTimer(time: 16.5, callback: {
      self.continueLabel.text = "Tap to replay the story"
      self.showTapToContinue()
    })
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

  func touchDown(atPoint pos : CGPoint) {
    if actionRunning {
      return
    }
    
    dismissTapToContinue()
    musicPlayer?.stop()
    let newScene = TalkScene(fileNamed: "TalkScene")!
    newScene.scaleMode = .aspectFit
    let transition = SKTransition.fade(with: .black, duration: 5)
    self.view?.presentScene(newScene, transition: transition)
  }

  func touchMoved(toPoint pos : CGPoint) {
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

//#-hidden-code

