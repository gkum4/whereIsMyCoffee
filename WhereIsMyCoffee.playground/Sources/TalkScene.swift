import PlaygroundSupport
import SpriteKit
import AVFoundation

public class TalkScene: SKScene {
    
  private var speech1: SKSpriteNode!
  private var speech2: SKSpriteNode!
  private var think: SKSpriteNode!
  private var step = 0
  private var actionRunning = false
  
  var musicPlayer: AVAudioPlayer?

  public override func didMove(to view: SKView) {
    speech1 = childNode(withName: "//speech1") as? SKSpriteNode
    speech2 = childNode(withName: "//speech2") as? SKSpriteNode
    think = childNode(withName: "//think") as? SKSpriteNode
    
    think.alpha = 0.0
    
    speech1.run(.sequence([.move(to: CGPoint(x: -17.833, y: 0.0), duration: 0.5), .playSoundFileNamed("talkSceneSpeech1Audio.m4a", waitForCompletion: false), .wait(forDuration: 5), .move(to: CGPoint(x: -467.833, y: 0.0), duration: 0.5)]))
    
    speech2.run(.sequence([.wait(forDuration: 6.2), .move(to: CGPoint(x: 416.334, y: 0.0), duration: 0.5), .playSoundFileNamed("talkSceneSpeech2Audio.m4a", waitForCompletion: false), .wait(forDuration: 5), .move(to: CGPoint(x: 865.5, y: 0.0), duration: 0.5)]))
    
    think.run(.sequence([.wait(forDuration: 12.5), .fadeAlpha(to: 1, duration: 0.5), .playSoundFileNamed("talkSceneThinkAudio.mp3", waitForCompletion: false)]))
    
    playSound(fileName: "coffeeShopBackgroundMusic.mp3", volume: 0.5)
    musicPlayer?.setVolume(0, fadeDuration: 15.5)
    
    let _ = Timer.scheduledTimer(withTimeInterval: 15.5, repeats: false) { [self] timer in
      let newScene = PlantScene(fileNamed: "PlantScene")!
      newScene.scaleMode = .aspectFit
      let transition = SKTransition.fade(with: .white, duration: 6)
      self.view?.presentScene(newScene, transition: transition)
      self.run(.playSoundFileNamed("flashbackSound.mp3", waitForCompletion: false))
      musicPlayer?.stop()
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

  func touchDown(atPoint pos : CGPoint) {}

  func touchMoved(toPoint pos : CGPoint) {}

  func touchUp(atPoint pos : CGPoint) {}
  
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
