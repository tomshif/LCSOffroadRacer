//
//  GameScene.swift
//  OffroadRacer
//
//  Created by LCS Game Design on 1/11/21.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var gameState = -1
    
    var mmAnchor=SKSpriteNode()
    var crAnchor=SKSpriteNode()
    var srAnchor=SKSpriteNode()
    var erAnchor=SKSpriteNode()
    var irAnchor=SKSpriteNode()
    var rpAnchor=SKSpriteNode()
    var upAnchor=SKSpriteNode()
    
    
    var puAnchor=SKSpriteNode()
    
    
    var hudAnchor=SKSpriteNode()
    
    var theHud:HUDClass?
    
    
    var cam=SKCameraNode()
    
    var currentPopUp:PopUpClass?
    
    var currentRaceSelected:Int = -1

    let tempCamSpeed:CGFloat = 5
    
    var playerCar:PCCarClass?

    
    var keyPress=keys()
    
    override func didMove(to view: SKView) {
        
       
        addChild(cam)
        self.camera=cam
        
        
        // add anchors
        cam.addChild(hudAnchor)
        addChild(mmAnchor)
        addChild(crAnchor)
        addChild(erAnchor)
        addChild(irAnchor)
        addChild(srAnchor)
        addChild(rpAnchor)
        addChild(upAnchor)
        cam.addChild(puAnchor)
        puAnchor.name="puAnchor"

        loadStartUp()
        
        
        changeGameState(to: GAMESTATE.MAINMENU)
    }// didMove
    
    func touchDown(atPoint pos : CGPoint) {
        
        // This function will hand off the location of the click
        // to a handler based on the current gameState.
        
        switch gameState
        {
        case GAMESTATE.MAINMENU:
            handleClickMM(at: pos)
            
        case GAMESTATE.CHOOSERACE:
            handleClickCR(at: pos)
            
        case GAMESTATE.STARTRACE:
            changeGameState(to: GAMESTATE.INRACE)
            
        case GAMESTATE.RACEPREVIEW:
            changeGameState(to: GAMESTATE.CHOOSERACE)
            
        case GAMESTATE.INRACE:
            changeGameState(to: GAMESTATE.ENDRACE)
            
        case GAMESTATE.ENDRACE:
            changeGameState(to: GAMESTATE.CHOOSERACE)
            
        case GAMESTATE.UPGRADE:
            changeGameState(to: GAMESTATE.CHOOSERACE)
            
        case GAMESTATE.POPUP:
            handleClickPU(at: pos)
        
        default:
            print("Error - Unhandled click in gameState \(gameState).")
        } // switch gameState
    } // touchDown
    
    func touchMoved(toPoint pos : CGPoint) {
 
    }
    
    func touchUp(atPoint pos : CGPoint) {
  
    }
    
    override func mouseDown(with event: NSEvent) {
        self.touchDown(atPoint: event.location(in: self))
    }
    
    override func mouseDragged(with event: NSEvent) {
        self.touchMoved(toPoint: event.location(in: self))
    }
    
    override func mouseUp(with event: NSEvent) {
        self.touchUp(atPoint: event.location(in: self))
    }
    
    func handleClickMM(at: CGPoint)
    {
        // This function is the handler for mouse clicks on the main menu
        
        for node in self.nodes(at: at)
        {
            if node.name != nil
            {
                if node.name=="mmPlayButton"
                {
                    
                    changeGameState(to: GAMESTATE.CHOOSERACE)
                }
            } // if the name is not nil
        } // for each node
        
        
    } // handleClickMM
    
    func handleClickCR(at: CGPoint)
    {
        // This function is the handler for mouse clicks on the choose race screen
        
        for node in self.nodes(at: at)
        {
            if node.name != nil
            {
                if node.name=="rpButton"
                {
                    
                    changeGameState(to: GAMESTATE.RACEPREVIEW)
                }
                else if node.name == "crRace1"
                {
                    
                    currentRaceSelected=1
                }
                else if node.name == "crRace2"
                {
                    currentRaceSelected=2
                }
                else if node.name == "crRace3"
                {
                    currentRaceSelected=3
                }
                else if node.name == "upButton"
                {
                    changeGameState(to: GAMESTATE.UPGRADE)
                }
                else if node.name == "startButton" && currentRaceSelected > 0
                {
                    changeGameState(to: GAMESTATE.STARTRACE)
                    
                }
                
                // frame currently selected race
                if currentRaceSelected > 0 && gameState==GAMESTATE.CHOOSERACE
                {
                    for node2 in crAnchor.children
                    {
                        if node2.name != nil
                        {
                            if node2.name!.contains("crSelect")
                            {
                                node2.removeFromParent()
                            }
                        } // if not nil
                    } // for each child on the crAnchor
                    
                    let crSelect = SKSpriteNode(imageNamed: "cr_chooseRaceOutline")
                    crSelect.position.x = -size.width*0.3+size.width*0.3*CGFloat(currentRaceSelected-1)
                    crSelect.zPosition=5
                    crSelect.name="crSelect"
                    crAnchor.addChild(crSelect)
                    
                } // if we have a race selected
            } // if the name is not nil
        } // for each node
        
    } // handleClickCR()
    
    func handleClickPU(at: CGPoint) -> Int
    {
        // This function handles clicks when we're showing a pop up window
        // For now, all it does is remove the pop up if the user clicks OK or YES
        
        
        var retValue:Int=PUBUTTONS.ERROR

        
        if (currentPopUp != nil)
        {
            retValue = currentPopUp!.checkClick(pos: at)
            
            if (retValue == PUBUTTONS.OK && currentPopUp!.type == POPTYPE.INFO)
            {
                currentPopUp!.destroy()
            }
            else if (retValue == PUBUTTONS.YES && currentPopUp!.type == POPTYPE.YESNO)
            {
                currentPopUp!.destroy()
            }
            else if (retValue == PUBUTTONS.NO && currentPopUp!.type == POPTYPE.YESNO)
            {
                currentPopUp!.destroy()
                print("User selected no.")
            }
            
        } // if current popup isn't nil
        else
        {
            print("ERROR - No current pop up while in pop up state.")
        }
        
        return retValue
        
    } // handleClickPU()
    
    
    override func keyDown(with event: NSEvent) {
        switch event.keyCode {

        case 0: // a
            keyPress.left=true
            
        case 1: // s
            keyPress.down=true
            
        case 2: // d
            keyPress.right=true
            
        case 13: // w
            keyPress.up=true
            
        case 35: // P -- Testing Pop up Menus
            if (currentPopUp == nil)
            {
                currentPopUp=PopUpClass(theScene: self, popType: POPTYPE.YESNO, parentNode: puAnchor, popText: "This is a test Pop up")
            }
            
        default:
            print("keyDown: \(event.characters!) keyCode: \(event.keyCode)")
        } // switch keyCode
    } // keyDown
    
    
    override func keyUp(with event: NSEvent) {
        switch event.keyCode {
            
        case 0:
            keyPress.left=false
            
        case 1:
            keyPress.down=false
            
        case 2:
            keyPress.right=false

        case 13:
            keyPress.up=false
            
        default:
            break
        } // switch keyCode
    } // keyUp
    
    
    func loadStartUp()
    {
        // This function will handle initialization of the game as a whole.
        // This will include (primarily) sound initialization
        
        
    } // loadStartUp
    
    func loadMainMenu()
    {
        cam.position = CGPoint.zero
        
        let mmBG=SKSpriteNode(imageNamed: "mmTempBack01")
        let mmLogo=SKSpriteNode(imageNamed: "tempLogo")
        let mmFrame=SKSpriteNode(imageNamed: "mmMenuFrame01")
        
        
        mmAnchor.addChild(mmBG)
        
        mmLogo.position = CGPoint(x: -size.width*0.35, y: size.height*0.35)
        mmLogo.zPosition=1
        mmLogo.name="mmLogo"
        mmAnchor.addChild(mmLogo)
        
        mmFrame.position.x = 0
        mmFrame.position.y = -size.height*0.1
        mmFrame.zPosition=2
        mmAnchor.addChild(mmFrame)
        
        let mmPlayButton=SKSpriteNode(imageNamed: "mm_newGameButton")
        mmPlayButton.name="mmPlayButton"
        mmPlayButton.zPosition=5
        mmPlayButton.position.y=mmFrame.size.height*0.15
        mmAnchor.addChild(mmPlayButton)
        
        gameState=GAMESTATE.MAINMENU
        currentRaceSelected = -1
        
        if (currentPopUp == nil)
        {
            currentPopUp=PopUpClass(theScene: self, popType: POPTYPE.YESNO, parentNode: puAnchor, popText: "Testing - Do you know how to use pop up windows?")
        }
        
    } // load main menu
    
    func loadUpgradeScreen()
    {
        var upTemp=SKSpriteNode(imageNamed: "upTemp")
        upTemp.name="upButton"
        upAnchor.addChild(upTemp)
        gameState=GAMESTATE.UPGRADE
        
    } // loadUpgradeScreen
    
    func loadChooseRaceScreen()
    {
        // Temp Images
        let crRace1=SKSpriteNode(imageNamed: "crTemp")
        crRace1.name="crRace1"
        crRace1.position.x = -size.width*0.3
        crAnchor.addChild(crRace1)
        
        let crRace2=SKSpriteNode(imageNamed: "crTemp")
        crRace2.name="crRace2"
        crRace2.position.x = 0
        crAnchor.addChild(crRace2)
        
        let crRace3=SKSpriteNode(imageNamed: "crTemp")
        crRace3.name="crRace3"
        crRace3.position.x = size.width*0.3
        crAnchor.addChild(crRace3)
        
        
        
        // Temp image to go to Race Preview
        let rpButton=SKSpriteNode(imageNamed: "rpTemp")
        rpButton.name="rpButton"
        rpButton.setScale(0.5)
        rpButton.position=CGPoint(x: -size.width*0.35, y: -size.height*0.35)
        crAnchor.addChild(rpButton)
        
        // Temp image to go to upgrade
        let upButton=SKSpriteNode(imageNamed: "upTemp")
        upButton.name="upButton"
        upButton.position.x = 0
        upButton.position.y = -size.height*0.35
        upButton.setScale(0.5)
        crAnchor.addChild(upButton)
        
        let startButton=SKSpriteNode(imageNamed: "cr_startButton")
        startButton.name="startButton"
        startButton.position.x = size.width*0.35
        startButton.position.y = -size.height*0.35
        startButton.setScale(0.5)
        crAnchor.addChild(startButton)
        
        
        gameState=GAMESTATE.CHOOSERACE
        
        if currentRaceSelected > 0 && gameState==GAMESTATE.CHOOSERACE
        {
            for node2 in crAnchor.children
            {
                if node2.name != nil
                {
                    if node2.name!.contains("crSelect")
                    {
                        node2.removeFromParent()
                    }
                } // if not nil
            } // for each child on the crAnchor
            
            let crSelect = SKSpriteNode(imageNamed: "cr_chooseRaceOutline")
            crSelect.position.x = -size.width*0.3+size.width*0.3*CGFloat(currentRaceSelected-1)
            crSelect.zPosition=5
            crSelect.name="crSelect"
            crAnchor.addChild(crSelect)
            
        } // if we have a race selected

        
    } // loadChooseRaceScreen
    
    func loadRacePreviewScreen()
    {
        var rpTemp=SKSpriteNode(imageNamed: "rpTemp")
        rpAnchor.addChild(rpTemp)
        
        gameState=GAMESTATE.RACEPREVIEW
    } // loadRacePreviewScreen()
    
    func loadStartRaceScreen()
    {
        
        // TEMP Show which race # is starting
        let tempRaceNum=SKLabelNode(text: "Race #: \(currentRaceSelected)")
        tempRaceNum.position.y = size.height*0.25
        tempRaceNum.fontSize=36
        tempRaceNum.fontName="Chalkduster"
        srAnchor.addChild(tempRaceNum)
        
        let srTemp=SKSpriteNode(imageNamed: "srTemp")
        srAnchor.addChild(srTemp)
        gameState=GAMESTATE.STARTRACE
        

        
    } // loadStartRaceScreen
    
    func loadInRaceScreen()
    {
        theHud=HUDClass(scene: self)
        let map=MapClass(scene: self)
        playerCar=PCCarClass(mmr: 0, scene: self)
        
        // var irTemp=SKSpriteNode(imageNamed: "irTemp")
        // irAnchor.addChild(irTemp)
        gameState=GAMESTATE.INRACE
        
    } // loadInRaceScreen
    
    func loadEndRaceScreen()
    {
        var erTemp=SKSpriteNode(imageNamed: "erTemp")
        erAnchor.addChild(erTemp)
        gameState=GAMESTATE.ENDRACE
    } // loadEndRaceScreen
    
    func changeGameState(to: Int)
    {
        // This function will change the gameState from one state to another.
        // NOTE: NEVER change gameState directly. ALWAYS call this function to change, not the functions that may load certain screens (such as 'loadMainMenu()') or by altering the currentState variable. This is important because there will be clean up of screens that we're leaving in this function, as well as loading new assets, etc.
        
        if (gameState != to)
        {
            
            switch gameState
            {
            case GAMESTATE.STARTUP:
                if (to == GAMESTATE.MAINMENU)
                {
                    loadMainMenu()
 
                } // to Main Menu
                else
                {
                    print("Error - Unsupported state change: \(gameState) to \(to)")
                }
            
            case GAMESTATE.MAINMENU:
                if(to==GAMESTATE.CHOOSERACE)
                {
                    mmAnchor.removeAllChildren()
                    loadChooseRaceScreen()
                } // to Choose Race Screen
                
            case GAMESTATE.CHOOSERACE:
                if(to==GAMESTATE.STARTRACE)
                {
                    
                    crAnchor.removeAllChildren()
                    
                    loadStartRaceScreen()
                }
                else if to==GAMESTATE.RACEPREVIEW
                {
                    
                    crAnchor.removeAllChildren()
                    
                    loadRacePreviewScreen()
                }
                else if to==GAMESTATE.UPGRADE
                {
                    
                    crAnchor.removeAllChildren()
                    loadUpgradeScreen()
                }
            
            case GAMESTATE.RACEPREVIEW:
                if(to==GAMESTATE.CHOOSERACE)
                {
                    rpAnchor.removeAllChildren()
                    loadChooseRaceScreen()
                }
            case GAMESTATE.STARTRACE:
                if(to==GAMESTATE.INRACE)
                {
                    srAnchor.removeAllChildren()
                    loadInRaceScreen()
                }
                
            case GAMESTATE.INRACE:
                if(to==GAMESTATE.ENDRACE)
                {
                    irAnchor.removeAllChildren()
                    loadEndRaceScreen()
                }
                
            case GAMESTATE.ENDRACE:
                if(to==GAMESTATE.CHOOSERACE)
                {
                    erAnchor.removeAllChildren()
                    loadChooseRaceScreen()
                }
                
            case GAMESTATE.UPGRADE:
                if (to==GAMESTATE.CHOOSERACE)
                {
                    upAnchor.removeAllChildren()
                    loadChooseRaceScreen()
                }
            default:
                print("Error - Unsupported current gameState: \(gameState)")
                break
            } // switch gameState
        
            
        } // if not trying to change to the same gameState
        else
        {
            print("Error - Trying to change to current gameState: \(gameState)")
        }
        
    } // func changeGameState
    
    func checkKeysinRace()
    {
        if keyPress.left
        {
            if(playerCar != nil)
            {
                playerCar!.turnLeft()
            }
        }
        if keyPress.right
        {
            if(playerCar != nil)
            {
                playerCar!.turnRight()
            }
        }
        if keyPress.up
        {
            if(playerCar != nil)
            {
                playerCar!.speedUp()
            }
        }
        if keyPress.down
        {
            if(playerCar != nil)
            {
                playerCar!.reverseSpeed()
            }
        }
    } // checkKeysinRace()
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        switch gameState
        {
        case GAMESTATE.MAINMENU:
            break
            
        case GAMESTATE.INRACE:
            checkKeysinRace()
            if playerCar != nil
            {
                playerCar!.update()
            }
        default:
            //print("Invalid gameState in update()")
            break
             
        } // switch gameState
        
        
        
    } // update()
} // class GameScene
