import PlaygroundSupport
import SpriteKit

public func main() {
  let frame = CGRect(x: 0 , y: 0, width: 512, height: 768)

  let view = SKView(frame: frame)
  if let scene = TalkScene(fileNamed: "TalkScene") {

      scene.scaleMode = .aspectFit
      view.presentScene(scene)
      
  }
  PlaygroundPage.current.liveView = view
  PlaygroundPage.current.needsIndefiniteExecution = true
}

