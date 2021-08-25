import Foundation
import AVFoundation
import SpriteKit
import PlaygroundSupport

public class GameScene: SKScene {
    var shapeoriginalposition: CGPoint!
    var currentdragshape: SKSpriteNode!
    var shapeCount = 0
    var filledshapes: [SKSpriteNode] = []
    
    var screem0: SKNode!
    var screem1: SKNode!
    var screen3: SKNode!
    var screen5: SKNode!
    var label1: SKSpriteNode!
    var label2: SKSpriteNode!
    var label3: SKSpriteNode!
    var label4: SKSpriteNode!
    var label5: SKSpriteNode!
    var label6: SKSpriteNode!
    var label7: SKSpriteNode!
    var label8: SKSpriteNode!
    var label9: SKSpriteNode!
    var start: SKSpriteNode!
    var nextbutton1: SKSpriteNode!
    var nextbutton2: SKSpriteNode!
    var nextbutton3: SKSpriteNode!
    var nextbutton4: SKSpriteNode!
    var playagain: SKSpriteNode!
    var square1: SKSpriteNode!
    var square2: SKSpriteNode!
    var square3: SKSpriteNode!
    var square4: SKSpriteNode!
    var square5: SKSpriteNode!
    var square6: SKSpriteNode!
    var shape1: SKSpriteNode!
    var shape2: SKSpriteNode!
    var shape3: SKSpriteNode!
    var shape4: SKSpriteNode!
    var shape5: SKSpriteNode!
    var shape6: SKSpriteNode!
    var canva1: SKSpriteNode!
    var canva2: SKSpriteNode!
    var square7: SKSpriteNode!
    var square8: SKSpriteNode!
    var square9: SKSpriteNode!
    var square10: SKSpriteNode!
    var square11: SKSpriteNode!
    var square12: SKSpriteNode!
    var bigsquare7: SKSpriteNode!
    var bigsquare8: SKSpriteNode!
    var bigsquare9: SKSpriteNode!
    var bigsquare10: SKSpriteNode!
    var bigsquare11: SKSpriteNode!
    var bigsquare12: SKSpriteNode!
    var square13: SKSpriteNode!
    var square14: SKSpriteNode!
    var square15: SKSpriteNode!
    var square16: SKSpriteNode!
    var square17: SKSpriteNode!
    var square18: SKSpriteNode!
    var pinksquare: SKSpriteNode!
    var yellowsquare: SKSpriteNode!
    var bluesquare: SKSpriteNode!
    var greemsquare: SKSpriteNode!
    var orangesquare: SKSpriteNode!
    var purplesquare: SKSpriteNode!
    var coloredshape1: SKSpriteNode!
    var coloredshape2: SKSpriteNode!
    var coloredshape3: SKSpriteNode!
    var coloredshape4: SKSpriteNode!
    var coloredshape5: SKSpriteNode!
    var coloredshape6: SKSpriteNode!
    var bigcoloredshape1: SKSpriteNode!
    var bigcoloredshape2: SKSpriteNode!
    var bigcoloredshape3: SKSpriteNode!
    var bigcoloredshape4: SKSpriteNode!
    var bigcoloredshape5: SKSpriteNode!
    var bigcoloredshape6: SKSpriteNode!
    var xunxo = false
    var otherwisesong = MusicPlayer()
    let otherwisefit = "otherwisefit.m4a"
    let otherwisetap = "otherwisetap.m4a"
    let otherwisecatch = "otherwisecatch.m4a"
    let otherwiseyey = "otherwiseyey.m4a"
    
    var canGoNext = false
    
    var screem2: SKNode!
    var dragareas: [SKSpriteNode] {
        childNode(withName: "Screem2")!.children.filter { (node) -> Bool in
            node.name == "dragarea"
        }.compactMap { (node) in
            node as? SKSpriteNode
        }
    }
    
    var screen4: SKNode!
    var dragareas2: [SKSpriteNode] {
        [
            childNode(withName: "Screen4")!.childNode(withName: "dragarea1") as! SKSpriteNode,
            childNode(withName: "Screen4")!.childNode(withName: "dragarea2") as! SKSpriteNode,
            childNode(withName: "Screen4")!.childNode(withName: "dragarea3") as! SKSpriteNode,
            childNode(withName: "Screen4")!.childNode(withName: "dragarea4") as! SKSpriteNode,
            childNode(withName: "Screen4")!.childNode(withName: "dragarea5") as! SKSpriteNode,
            childNode(withName: "Screen4")!.childNode(withName: "dragarea6") as! SKSpriteNode,
        ]
    }
    
    var currentScreem = 0
    
    
    override public func didMove(to view: SKView) {
        
        //colocar o setup da música geral aqui
        otherwisesong.startBackgroundMusic()
        otherwisesong.audioPlayer?.setVolume(0.3, fadeDuration: 1)
        run(.changeVolume(to: 10, duration: 0))
        //pegando referencia da cena
        //cena 0
        screem0 = childNode(withName: "Screem0")
        start = screem0.childNode(withName: "start") as? SKSpriteNode
        
        
        //cena 1
        screem1 = childNode(withName: "Screem1")
        label1 = screem1.childNode(withName: "label1") as? SKSpriteNode
        label2 = screem1.childNode(withName: "label2") as? SKSpriteNode
        nextbutton1 = screem1.childNode(withName: "nextbutton1") as? SKSpriteNode
        square1 = screem1.childNode(withName: "square1") as? SKSpriteNode
        square2 = screem1.childNode(withName: "square2") as? SKSpriteNode
        square3 = screem1.childNode(withName: "square3") as? SKSpriteNode
        square4 = screem1.childNode(withName: "square4") as? SKSpriteNode
        square5 = screem1.childNode(withName: "square5") as? SKSpriteNode
        square6 = screem1.childNode(withName: "square6") as? SKSpriteNode
        shape1 = screem1.childNode(withName: "shape1") as? SKSpriteNode
        shape2 = screem1.childNode(withName: "shape2") as? SKSpriteNode
        shape3 = screem1.childNode(withName: "shape3") as? SKSpriteNode
        shape4 = screem1.childNode(withName: "shape4") as? SKSpriteNode
        shape5 = screem1.childNode(withName: "shape5") as? SKSpriteNode
        shape6 = screem1.childNode(withName: "shape6") as? SKSpriteNode
        
        //"ocultando" objetos cena 1
        label2.alpha = 0
        nextbutton1.alpha = 0
        shape1.alpha = 0
        shape2.alpha = 0
        shape3.alpha = 0
        shape4.alpha = 0
        shape5.alpha = 0
        shape6.alpha = 0
        
        
        //cena 2
        screem2 = childNode(withName: "Screem2")
        label3 = screem2.childNode(withName: "label3") as? SKSpriteNode
        label4 = screem2.childNode(withName: "label4") as? SKSpriteNode
        nextbutton2 = screem2.childNode(withName: "nextbutton2") as? SKSpriteNode
        canva1 = screem2.childNode(withName: "canva1") as? SKSpriteNode
        square7 = screem2.childNode(withName: "square7") as? SKSpriteNode
        square8 = screem2.childNode(withName: "square8") as? SKSpriteNode
        square9 = screem2.childNode(withName: "square9") as? SKSpriteNode
        square10 = screem2.childNode(withName: "square10") as? SKSpriteNode
        square11 = screem2.childNode(withName: "square11") as? SKSpriteNode
        square12 = screem2.childNode(withName: "square12") as? SKSpriteNode
        bigsquare7 = screem2.childNode(withName: "bigsquare7") as? SKSpriteNode
        bigsquare8 = screem2.childNode(withName: "bigsquare8") as? SKSpriteNode
        bigsquare9 = screem2.childNode(withName: "bigsquare9") as? SKSpriteNode
        bigsquare10 = screem2.childNode(withName: "bigsquare10") as? SKSpriteNode
        bigsquare11 = screem2.childNode(withName: "bigsquare11") as? SKSpriteNode
        bigsquare12 = screem2.childNode(withName: "bigsquare12") as? SKSpriteNode
        
        //cena 3
        screen3 = childNode(withName: "Screen3")
        label5 = screen3.childNode(withName: "label5") as? SKSpriteNode
        label6 = screen3.childNode(withName: "label6") as? SKSpriteNode
        nextbutton3 = screen3.childNode(withName: "nextbutton3") as? SKSpriteNode
        square13 = screen3.childNode(withName: "square13") as? SKSpriteNode
        square14 = screen3.childNode(withName: "square14") as? SKSpriteNode
        square15 = screen3.childNode(withName: "square15") as? SKSpriteNode
        square16 = screen3.childNode(withName: "square16") as? SKSpriteNode
        square17 = screen3.childNode(withName: "square17") as? SKSpriteNode
        square18 = screen3.childNode(withName: "square18") as? SKSpriteNode
        pinksquare = screen3.childNode(withName: "pinksquare") as? SKSpriteNode
        bluesquare = screen3.childNode(withName: "bluesquare") as? SKSpriteNode
        yellowsquare = screen3.childNode(withName: "yellowsquare") as? SKSpriteNode
        greemsquare = screen3.childNode(withName: "greemsquare") as? SKSpriteNode
        orangesquare = screen3.childNode(withName: "orangesquare") as? SKSpriteNode
        purplesquare = screen3.childNode(withName: "purplesquare") as? SKSpriteNode

        //"ocultando" objetos cena 3
        label6.alpha = 0
        nextbutton3.alpha = 0
        pinksquare.alpha = 0
        bluesquare.alpha = 0
        yellowsquare.alpha = 0
        greemsquare.alpha = 0
        orangesquare.alpha = 0
        purplesquare.alpha = 0
        
        //cena 4
        screen4 = childNode(withName: "Screen4")
        label7 = screen4.childNode(withName: "label7") as? SKSpriteNode
        label8 = screen4.childNode(withName: "label8") as? SKSpriteNode
        nextbutton4 = screen4.childNode(withName: "nextbutton4") as? SKSpriteNode
        canva2 = screen4.childNode(withName: "canva2") as? SKSpriteNode
        coloredshape1 = screen4.childNode(withName: "coloredshape1") as? SKSpriteNode
        coloredshape2 = screen4.childNode(withName: "coloredshape2") as? SKSpriteNode
        coloredshape3 = screen4.childNode(withName: "coloredshape3") as? SKSpriteNode
        coloredshape4 = screen4.childNode(withName: "coloredshape4") as? SKSpriteNode
        coloredshape5 = screen4.childNode(withName: "coloredshape5") as? SKSpriteNode
        coloredshape6 = screen4.childNode(withName: "coloredshape6") as? SKSpriteNode
        bigcoloredshape1 = screen4.childNode(withName: "bigcoloredshape1") as? SKSpriteNode
        bigcoloredshape2 = screen4.childNode(withName: "bigcoloredshape2") as? SKSpriteNode
        bigcoloredshape3 = screen4.childNode(withName: "bigcoloredshape3") as? SKSpriteNode
        bigcoloredshape4 = screen4.childNode(withName: "bigcoloredshape4") as? SKSpriteNode
        bigcoloredshape5 = screen4.childNode(withName: "bigcoloredshape5") as? SKSpriteNode
        bigcoloredshape6 = screen4.childNode(withName: "bigcoloredshape6") as? SKSpriteNode
        dragareas2.forEach {node in
            let pb = SKPhysicsBody(texture: node.texture!, size: node.size)
            pb.isDynamic = false
            node.physicsBody = pb
        }
        let pb = SKPhysicsBody(edgeLoopFrom: self.frame)
        pb.friction = 0
        screen4.physicsBody = pb
        
        //cena 5
        screen5 = childNode(withName: "Screen5")
        label9 = screen5.childNode(withName: "label9") as? SKSpriteNode
        playagain = screen5.childNode(withName: "playagain") as? SKSpriteNode
        
        //posicionando todas em x = 0 e y = 0
        screem0.position = CGPoint ()
        screem1.position = CGPoint ()
        screem2.position = CGPoint ()
        screen3.position = CGPoint ()
        screen4.position = CGPoint ()
        screen5.position = CGPoint ()
        
        //escondendo todas, menos a primeira
        //todas exceto a inicial serao alpha = 0
        screem0.alpha = 1
        screem1.alpha = 0
        screem2.alpha = 0
        screen3.alpha = 0
        screen4.alpha = 0
        screen5.alpha = 0
        bigsquare7.alpha = 0
        bigsquare8.alpha = 0
        bigsquare9.alpha = 0
        bigsquare10.alpha = 0
        bigsquare11.alpha = 0
        bigsquare12.alpha = 0
        bigcoloredshape1.alpha = 0
        bigcoloredshape2.alpha = 0
        bigcoloredshape3.alpha = 0
        bigcoloredshape4.alpha = 0
        bigcoloredshape5.alpha = 0
        bigcoloredshape6.alpha = 0
        nextbutton2.alpha = 0
        nextbutton4.alpha = 0
        playagain.alpha = 0
        label4.alpha = 0
        label8.alpha = 0
        label9.alpha = 0
    }
    
    func playSound(_ name: String) {
        run(.playSoundFileNamed(name, waitForCompletion: false))
    }
    
    @objc static override public var supportsSecureCoding: Bool {
        // SKNode conforms to NSSecureCoding, so any subclass going
        // through the decoding process must support secure coding
        get {
            return true
        }
    }
    
    func touchDown(atPoint pos : CGPoint) {
        
        if currentScreem == 0 {
            touchDownScreem0(pos: pos)
        } else if currentScreem == 1 {
            touchDownScreem1(pos: pos)
        } else if currentScreem == 2 {
            touchDownScreem2(pos: pos)
        } else if currentScreem == 3 {
            touchDownScreen3(pos: pos)
        } else if currentScreem == 4 {
            touchDownScreen4(pos: pos)
        } else if currentScreem == 5 {
            touchDownScreen5(pos: pos)
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
        if currentScreem == 2 {
            touchMoveScreem2(pos: pos)
        } else if currentScreem == 4 {
            touchMoveScreen4(pos: pos)
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
        if currentScreem == 2 {
            touchUpScreem2(pos: pos)
        } else if currentScreem == 4 {
            touchUpScreen4(pos: pos)
        }
    }
    
    func touchDownScreem0(pos : CGPoint) {
        if start.contains(pos) {
            playSound(otherwisetap)
            screem0.run(SKAction.fadeOut(withDuration: 1)) {
                self.screem1.run(SKAction.fadeIn(withDuration: 1))
            }
            currentScreem = 1
        }
    }
    
    //controle de clique/forma e troca de formas
    func touchDownScreem1(pos : CGPoint) {
        if square1.contains(pos) && square1.alpha == 1 {
            playSound(otherwisetap)
            square1.run(SKAction.fadeOut(withDuration: 1))
            shape1.run(SKAction.fadeIn(withDuration: 1))
            shapeCount += 1
        }
        
        if square2.contains(pos) && square2.alpha == 1 {
            playSound(otherwisetap)
            square2.run(SKAction.fadeOut(withDuration: 1))
            shape2.run(SKAction.fadeIn(withDuration: 1))
            shapeCount += 1
        }
        
        if square3.contains(pos) && square3.alpha == 1 {
            playSound(otherwisetap)
            square3.run(SKAction.fadeOut(withDuration: 1))
            shape3.run(SKAction.fadeIn(withDuration: 1))
            shapeCount += 1
        }
        
        if square4.contains(pos) && square4.alpha == 1 {
            playSound(otherwisetap)
            square4.run(SKAction.fadeOut(withDuration: 1))
            shape4.run(SKAction.fadeIn(withDuration: 1))
            shapeCount += 1
        }
        
        if square5.contains(pos) && square5.alpha == 1 {
            playSound(otherwisetap)
            square5.run(SKAction.fadeOut(withDuration: 1))
            shape5.run(SKAction.fadeIn(withDuration: 1))
            shapeCount += 1
        }
        
        if square6.contains(pos) && square6.alpha == 1 {
            playSound(otherwisetap)
            square6.run(SKAction.fadeOut(withDuration: 1))
            shape6.run(SKAction.fadeIn(withDuration: 1))
            shapeCount += 1
        }
        
        if nextbutton1.contains(pos) && canGoNext == true {
            playSound(otherwisetap)
            screem1.run(SKAction.fadeOut(withDuration: 1)) {
                self.screem2.run(SKAction.fadeIn(withDuration: 1))
            }
            currentScreem = 2
            canGoNext = false
        }
        
        //contagem de cliques nas formas
        if shapeCount == 6 {
//            playSound(otherwiseyey)
            label1.run(SKAction.fadeOut(withDuration: 1)) {
                self.label2.run(SKAction.fadeIn(withDuration: 1)) {
                    self.nextbutton1.run(.sequence([SKAction.fadeIn(withDuration: 1), .run {
                        canGoNext = true
                    }]))
                }
            }
        }
    }
    
    //controle de clique/forma e troca de formas
    func touchDownScreem2(pos : CGPoint) {
        
        if square7.contains(pos) {
            playSound(otherwisecatch)
            square7.alpha = 0
            bigsquare7.alpha = 1
            currentdragshape = bigsquare7
            shapeoriginalposition = square7.position
        }
        if square8.contains(pos) {
            playSound(otherwisecatch)
            square8.alpha = 0
            bigsquare8.alpha = 1
            currentdragshape = bigsquare8
            shapeoriginalposition = square8.position
        }
        if square9.contains(pos) {
            playSound(otherwisecatch)
            square9.alpha = 0
            bigsquare9.alpha = 1
            currentdragshape = bigsquare9
            shapeoriginalposition = square9.position
        }
        if square10.contains(pos) {
            playSound(otherwisecatch)
            //efeito sonoro
            square10.alpha = 0
            bigsquare10.alpha = 1
            currentdragshape = bigsquare10
            shapeoriginalposition = square10.position
        }
        if square11.contains(pos) {
            playSound(otherwisecatch)
            square11.alpha = 0
            bigsquare11.alpha = 1
            currentdragshape = bigsquare11
            shapeoriginalposition = square11.position
        }
        if square12.contains(pos) {
            playSound(otherwisecatch)
            square12.alpha = 0
            bigsquare12.alpha = 1
            currentdragshape = bigsquare12
            shapeoriginalposition = square12.position
        }
        
        if nextbutton2.contains(pos) {
            playSound(otherwisetap)
            screem2.run(SKAction.fadeOut(withDuration: 1)) {
                self.screen3.run(SKAction.fadeIn(withDuration: 1))
                self.shapeCount = 0
            }
            currentScreem = 3
        }
    }
    
    func touchMoveScreem2(pos : CGPoint) {
        if currentdragshape != nil {
            currentdragshape?.position = pos
        }
    }
    
    func touchUpScreem2(pos : CGPoint) {
        if !canva1.contains(pos) && currentdragshape != nil {
            currentdragshape.position = shapeoriginalposition
            currentdragshape.alpha = 0
            if currentdragshape == bigsquare7 {
                square7.alpha = 1
            }
            if currentdragshape == bigsquare8 {
                square8.alpha = 1
            }
            if currentdragshape == bigsquare9 {
                square9.alpha = 1
            }
            if currentdragshape == bigsquare10 {
                square10.alpha = 1
            }
            if currentdragshape == bigsquare11 {
                square11.alpha = 1
            }
            if currentdragshape == bigsquare12 {
                square12.alpha = 1
            }
            currentdragshape = nil
            shapeoriginalposition = nil
        } else if currentdragshape != nil {
            var smallestdistance: CGFloat = .infinity
            var currentnode: SKSpriteNode!
            for possiblespace in dragareas {
                let distance = CGPointDistance(from: possiblespace.position, to: pos)
                print(smallestdistance, currentnode, filledshapes.contains(possiblespace), distance, filledshapes)
                if distance < smallestdistance && !filledshapes.contains(possiblespace){
                    currentnode = possiblespace
                    smallestdistance = distance
                }
            }
            playSound(otherwisefit)
            filledshapes.append(currentnode)
            print("-------------------")
            currentdragshape.position = currentnode.position
            currentdragshape = nil
            shapeoriginalposition = nil
        }
//        if nextbutton2.contains(pos) {
//                    screem2.run(SKAction.fadeOut(withDuration: 1)) {
//                        self.screen3.run(SKAction.fadeIn(withDuration: 1))
//                    }
//                    currentScreem = 3
//        }
        
        if filledshapes.count == 6 {
//            playSound(otherwiseyey)
            label3.run(SKAction.fadeOut(withDuration: 1)) {
                self.label4.run(SKAction.fadeIn(withDuration: 1)) {
                    self.nextbutton2.run(SKAction.fadeIn(withDuration: 1))
                }
            }
        }
    }
    
    //controle de clique/forma e troca de formas
    func touchDownScreen3(pos : CGPoint) {
        if square13.contains(pos) && square13.alpha == 1 {
            playSound(otherwisetap)
            square13.run(SKAction.fadeOut(withDuration: 1))
            pinksquare.run(SKAction.fadeIn(withDuration: 1))
            shapeCount += 1
        }

        if square14.contains(pos) && square14.alpha == 1 {
            playSound(otherwisetap)
            square14.run(SKAction.fadeOut(withDuration: 1))
            bluesquare.run(SKAction.fadeIn(withDuration: 1))
            shapeCount += 1
        }

        if square15.contains(pos) && square15.alpha == 1 {
            playSound(otherwisetap)
            square15.run(SKAction.fadeOut(withDuration: 1))
            yellowsquare.run(SKAction.fadeIn(withDuration: 1))
            shapeCount += 1
        }

        if square16.contains(pos) && square16.alpha == 1 {
            playSound(otherwisetap)
            square16.run(SKAction.fadeOut(withDuration: 1))
            greemsquare.run(SKAction.fadeIn(withDuration: 1))
            shapeCount += 1
        }

        if square17.contains(pos) && square17.alpha == 1 {
            playSound(otherwisetap)
            square17.run(SKAction.fadeOut(withDuration: 1))
            orangesquare.run(SKAction.fadeIn(withDuration: 1))
            shapeCount += 1
        }

        if square18.contains(pos) && square18.alpha == 1 {
            playSound(otherwisetap)
            square18.run(SKAction.fadeOut(withDuration: 1))
            purplesquare.run(SKAction.fadeIn(withDuration: 1))
            shapeCount += 1
        }
        
        if nextbutton3.contains(pos) {
            self.filledshapes = []
            playSound(otherwisetap)
            screen3.run(SKAction.fadeOut(withDuration: 1)) {
                self.screen4.run(SKAction.fadeIn(withDuration: 1))
            }
            currentScreem = 4
        }
        
        //contagem de cliques nas formas
        if shapeCount == 6 {
//            playSound(otherwiseyey)
            label5.run(SKAction.fadeOut(withDuration: 1)) {
                self.label6.run(SKAction.fadeIn(withDuration: 1)) {
                    self.nextbutton3.run(SKAction.fadeIn(withDuration: 1))
                }
            }
        }
    }
    
    //controle de clique/forma e troca de formas
    func touchDownScreen4(pos : CGPoint) {
        
        if (coloredshape1.contains(pos) || bigcoloredshape1.contains(pos)) && !filledshapes.contains(bigcoloredshape1) {
            playSound(otherwisecatch)
            coloredshape1.alpha = 0
            bigcoloredshape1.alpha = 1
            currentdragshape = bigcoloredshape1
            shapeoriginalposition = coloredshape1.position
        }
       
        if (coloredshape2.contains(pos) || bigcoloredshape2.contains(pos)) && !filledshapes.contains(bigcoloredshape2) {
            playSound(otherwisecatch)
            coloredshape2.alpha = 0
            bigcoloredshape2.alpha = 1
            currentdragshape = bigcoloredshape2
            shapeoriginalposition = coloredshape2.position
        }
        
        if (coloredshape3.contains(pos) || bigcoloredshape3.contains(pos)) && !filledshapes.contains(bigcoloredshape3) {
            playSound(otherwisecatch)
            coloredshape3.alpha = 0
            bigcoloredshape3.alpha = 1
            currentdragshape = bigcoloredshape3
            shapeoriginalposition = coloredshape3.position
        }
        
        if (coloredshape4.contains(pos) || bigcoloredshape4.contains(pos)) && !filledshapes.contains(bigcoloredshape4) {
            playSound(otherwisecatch)
            coloredshape4.alpha = 0
            bigcoloredshape4.alpha = 1
            currentdragshape = bigcoloredshape4
            shapeoriginalposition = coloredshape4.position
        }
        
        if (coloredshape5.contains(pos) || bigcoloredshape5.contains(pos)) && !filledshapes.contains(bigcoloredshape5) {
            playSound(otherwisecatch)
            coloredshape5.alpha = 0
            bigcoloredshape5.alpha = 1
            currentdragshape = bigcoloredshape5
            shapeoriginalposition = coloredshape5.position
        }
        
        if (coloredshape6.contains(pos) || bigcoloredshape6.contains(pos)) && !filledshapes.contains(bigcoloredshape6) {
            playSound(otherwisecatch)
            coloredshape6.alpha = 0
            bigcoloredshape6.alpha = 1
            currentdragshape = bigcoloredshape6
            shapeoriginalposition = coloredshape6.position
        }
        
        if nextbutton4.contains(pos) {
            playSound(otherwisetap)
            screen4.run(SKAction.fadeOut(withDuration: 1)) {
                self.screen5.run(SKAction.fadeIn(withDuration: 1))
                self.label9.run(SKAction.fadeIn(withDuration: 1)) {
                    self.playagain.run(SKAction.fadeIn(withDuration: 1))
                }
//                self.shapeCount = 0
            }
            currentScreem = 5
        }
    }
    
    func touchMoveScreen4(pos : CGPoint) {
        if currentdragshape != nil && !filledshapes.contains(currentdragshape){
            currentdragshape?.position = pos
        }
    }
    
    func touchUpScreen4(pos : CGPoint) {
        if !canva2.contains(pos) && currentdragshape != nil {
            currentdragshape.position = shapeoriginalposition
            currentdragshape.alpha = 0
            if currentdragshape == bigcoloredshape1 {
                coloredshape1.alpha = 1
            }
            if currentdragshape == bigcoloredshape2 {
                coloredshape2.alpha = 1
            }
            if currentdragshape == bigcoloredshape3 {
                coloredshape3.alpha = 1
            }
            if currentdragshape == bigcoloredshape4 {
                coloredshape4.alpha = 1
            }
            if currentdragshape == bigcoloredshape5 {
                coloredshape5.alpha = 1
            }
            if currentdragshape == bigcoloredshape6 {
                coloredshape6.alpha = 1
            }
            currentdragshape = nil
            shapeoriginalposition = nil
        } else if currentdragshape != nil && !filledshapes.contains(currentdragshape){
            var currentnode: SKSpriteNode? = nil
            var touchedBody: SKPhysicsBody? = nil
            physicsWorld.enumerateBodies(at: pos) { body, stop in
                if body != self.scene?.physicsBody {
                    touchedBody = body
                }
            }
            guard let node = touchedBody?.node as? SKSpriteNode else {
                return
            }
            print(node)
            if currentdragshape == bigcoloredshape1 {
                if node == dragareas2[0] {
                    currentnode = currentdragshape
                    playSound(otherwisefit)
                }
            }
            if currentdragshape == bigcoloredshape2 {
                if node == dragareas2[1] {
                    currentnode = currentdragshape
                    playSound(otherwisefit)
                }
            }
            if currentdragshape == bigcoloredshape3 {
                if node == dragareas2[2] {
                    currentnode = currentdragshape
                    playSound(otherwisefit)
                }
            }
            if currentdragshape == bigcoloredshape4 {
                if node == dragareas2[3] {
                    currentnode = currentdragshape
                    playSound(otherwisefit)
                }
            }
            if currentdragshape == bigcoloredshape5 {
                if node == dragareas2[4] {
                    currentnode = currentdragshape
                    playSound(otherwisefit)
                }
            }
            if currentdragshape == bigcoloredshape6 {
                if node == dragareas2[5] {
                    currentnode = currentdragshape
                    playSound(otherwisefit)
                }
            }
           print(currentnode ?? "nil")
            if let currentnode = currentnode {
                filledshapes.append(currentnode)
                print("-------------------")
                currentnode.position = node.position
                currentdragshape = nil
                shapeoriginalposition = nil
            }
        }
//        playSound(otherwisefit)
        
        if filledshapes.count == 6 /*&& xunxo*/ {
//            playSound(otherwiseyey)
            label7.run(SKAction.fadeOut(withDuration: 1)) {
                self.label8.run(SKAction.fadeIn(withDuration: 1)) {
                    self.nextbutton4.run(SKAction.fadeIn(withDuration: 1))
                }
            }
        }
//        xunxo = true
    }
    
    func touchDownScreen5(pos : CGPoint) {
        self.playagain.run(SKAction.fadeIn(withDuration: 5))
        if playagain.contains(pos) {
            playSound(otherwisetap)
            if let scene = GameScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFit
                
                // Present the scene
                otherwisesong.audioPlayer?.setVolume(0, fadeDuration: 1)
                view?.presentScene(scene, transition: SKTransition.fade(withDuration: 2))
                self.removeFromParent()
            }
        }
    }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchDown(atPoint: t.location(in: self)) }
    }
    
    override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchMoved(toPoint: t.location(in: self)) }
    }

    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchUp(atPoint: t.location(in: self)) }
    }

    override public func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchUp(atPoint: t.location(in: self)) }
    }

    override public func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    func CGPointDistanceSquared(from: CGPoint, to: CGPoint) -> CGFloat {
        return (from.x - to.x) * (from.x - to.x) + (from.y - to.y) * (from.y - to.y)
    }

    func CGPointDistance(from: CGPoint, to: CGPoint) -> CGFloat {
        return sqrt(CGPointDistanceSquared(from: from, to: to))
    }
}

