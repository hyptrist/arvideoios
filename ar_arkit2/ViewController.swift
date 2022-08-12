//
//  ViewController.swift
//  Agreeta_v4_ar
//
//  Created by Mac on 28/01/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
import SceneKit
import ARKit
var view_ty : Int = Int()
class ViewController: UIViewController, ARSCNViewDelegate {
    
    let configuration = ARImageTrackingConfiguration()
    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    let plane = SCNPlane()
    let planeNode = SCNNode()
    var player = AVPlayer()
    var ballNode1 = SCNNode()
    @IBOutlet weak var salad_recipe: UIImageView!
    @IBOutlet weak var pudding_recipe: UIImageView!
    @IBOutlet weak var harvest_rice_recipe: UIImageView!
    @IBOutlet var sceneView: ARSCNView!
    @IBOutlet weak var reset_button: UIButton!
    @IBOutlet weak var recipe_card_view: UIView!
    @IBOutlet weak var back_button: UIButton!
    //let nextViewController = storyBoard.instantiateViewController(withIdentifier: "nextView") as! NextViewController
    @IBOutlet weak var view_scroll: UIScrollView!
    
    @IBOutlet weak var coupon_button: UIButton!
    @IBOutlet weak var salad_card: UIButton!
    @IBOutlet weak var pudding_card: UIButton!
    @IBOutlet weak var harvest_card: UIButton!
    @IBOutlet weak var horizontallyScrollableStackView: UIStackView!
    var coupon_dismissed : Int = Int()
    @IBAction func reset_button(_ sender: UIButton) {
        print("a")
        sceneView.session.pause()
    
        sceneView.scene.rootNode.enumerateChildNodes { (node, _) in
           //print(node)
            node.removeFromParentNode()}
        view_scroll.isHidden = true
        coupon_button.isHidden = true
        
        sceneView.session.run(configuration, options: [.removeExistingAnchors , .resetTracking])
        //sceneView.session.run(configuration)
        
        
        print("added")
    }
    @IBAction func recipe_back(_ sender: Any) {
        salad_recipe.isHidden = true
        harvest_rice_recipe.isHidden = true
        pudding_recipe.isHidden = true
        back_button.isHidden = true
        if coupon_dismissed == 1
        {
        coupon_button.isHidden = true
        }
        else
        {
        coupon_button.isHidden = false
        }
        player.play()
        
    }
    
    @IBAction func action_button(_ sender: Any) {
        print("triggered")
        //sceneView.session.pause()
        print("harvest button clicked")
            view_ty = 1
            print("view_ty",view_ty)
            print("scene view is:",sceneView)
            //sceneView.scene.rootNode.enumerateChildNodes { (node, _) in
             //   node.removeFromParentNode()}
        player.pause()
        self.harvest_rice_recipe.isHidden = false
        self.back_button.isHidden = false
    }
    
    @IBAction func action_pudding(_ sender: Any) {print("triggered")
        //sceneView.session.pause()
        print("harvest button clicked")
        player.pause()
            view_ty = 1
            print("view_ty",view_ty)
            print("scene view is:",sceneView)
            self.pudding_recipe.isHidden = false
        self.back_button.isHidden = false
        //sceneView.scene.rootNode.enumerateChildNodes { (node, _) in
            //    node.removeFromParentNode()}
    }
    
    @IBAction func action_salad(_ sender: Any) {
        //sceneView.session.pause()
        print("harvest button clicked")
        player.pause()
            view_ty = 1
            print("view_ty",view_ty)
        self.salad_recipe.isHidden = false
        self.back_button.isHidden = false
            print("scene view is:",sceneView)
            //sceneView.scene.rootNode.enumerateChildNodes { (node, _) in
            //    node.removeFromParentNode()}
    }
       

    @IBAction func coupon_act(_ sender: Any) {
        print("coupon triggered")
        coupon_dismissed = 1
        //sceneView.session.pause()
        //player.pause()
        //player.play()
        //sceneView.scene.rootNode.enumerateChildNodes { (node, _) in
        //node.removeFromParentNode()}
        //sceneView.session.run(sceneView.session.configuration!)
        print("inside coupon node removal")
        //ballNode1.removeFromParentNode()
        coupon_button.isHidden = true
        print("removed")
        
    }
    
    /*@IBAction func rice_back(_ sender: Any) {
        print("back")
                  //sceneView.session.pause()
              print("Back button clicked")
              let nextViewController = storyBoard.instantiateViewController(withIdentifier: "home") as! ViewController
        nextViewController.modalPresentationStyle = .fullScreen
              self.present(nextViewController, animated:true, completion:nil)
        
    }*/
    
    
    //navigationItem.backBarButtonItem = UIBarButtonItem(action: self.navigationController?.popViewController(animated: true))
    override func viewDidAppear(_ animated: Bool) {
           super.viewDidAppear(animated)
            }
    
    override func viewDidLoad() {
        
                print("view did load")
        print("hiding")
        if view_scroll == nil
        {}
        else{
            self.view_scroll.isHidden = true
            self.coupon_button.isHidden = true
            self.harvest_rice_recipe.isHidden = true
            self.pudding_recipe.isHidden = true
            self.salad_recipe.isHidden = true
            self.back_button.isHidden = true
            self.coupon_button.isHidden = true
        }
        super.viewDidLoad()
       
        print(view_ty)
        // Set the view's delegate
        if (view_ty == 1 )
        {}
        else{print("view_ty",view_ty)
            print("scene view",sceneView)
            if sceneView == nil{}
            else{
                sceneView.delegate = self}}
            super.viewDidLoad()

           self.navigationItem.setHidesBackButton(true, animated:true)
        reset_button.isHidden = true

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        print("view will appear")
        
        super.viewWillAppear(animated)
        
        if view_ty == 1 {view_ty=0}
        else{
        
        
        // first see if there is a folder called "ARImages" Resource Group in our Assets Folder
        if let trackedImages = ARReferenceImage.referenceImages(inGroupNamed: "ARImages", bundle: Bundle.main) {
            print("conf settings")
            // if there is, set the images to track
            configuration.trackingImages = trackedImages
            // at any point in time, only 1 image will be tracked
            configuration.maximumNumberOfTrackedImages = 2
            
            //cell.isHidden = false
        }
        
        // Run the view's session
        
       if sceneView == nil
       {}
       else{print("run configuration")
        sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])}
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("view did disappear")
        super.viewWillDisappear(animated)
        
        if sceneView == nil
            {}
        else{sceneView.session.pause()}
        }
      //self.dismiss(animated: true, completion: nil)
    //self.navigationController?.popViewController(animated: true)
        
    

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        print("session was interrupted")
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        print("ended interrupted")
    }
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
       let screenSize: CGRect = UIScreen.main.bounds
       let screenScale: CGFloat = UIScreen.main.scale
        
        
        //let a = DemoCollectionViewCell()
        //a.isHidden = true
        // if the anchor is not of type ARImageAnchor (which means image is not detected), just return
        //recipe_card_view.isHidden = false
        
        guard let imageAnchor = anchor as? ARImageAnchor, let fileUrlString = Bundle.main.path(forResource: "black12", ofType: "mp4") else {return}
        //find our video file
        guard let name = imageAnchor.referenceImage.name else { return }
        print("image name is : ",name)
        let videoItem = AVPlayerItem(url: URL(fileURLWithPath: fileUrlString))
        //method_label.text = "Abc"
        player = AVPlayer(playerItem: videoItem)
        //player.entersFullScreenWhenPlaybackBegins = true
        //initialize video node with avplayer
        let videoNode = SKVideoNode(avPlayer: player)
        
        player.play()
        
        DispatchQueue.main.async {
            print("unhiding")
            //sceneView.frame =
            
            print("height:",screenSize.size.height)
            print("width:",screenSize.size.width)
            print("scale:",screenScale)
            
            /*for _ in 0...1 {
            if let dayView = Bundle.main.loadNibNamed("DayView", owner: nil, options: nil)!.first as? DayView {
                dayView.translatesAutoresizingMaskIntoConstraints = false
                dayView.widthAnchor.constraint(equalToConstant: self.horizontallyScrollableStackView.frame.height*2).isActive = true
                //dayView.titleLabel.text = "Friday"
                //dayView.detailLabel.text = "A long detail text will be shown here. A long detail text will be shown here. "
                self.horizontallyScrollableStackView.addArrangedSubview(dayView)
                }}*/
            self.horizontallyScrollableStackView.widthAnchor.constraint(equalToConstant: self.horizontallyScrollableStackView.frame.height*(screenSize.size.width/43)).isActive = true
            self.view_scroll.isHidden = false
             self.coupon_button.isHidden = false
            self.pudding_recipe.frame = CGRect(x: 0, y:0 , width: screenSize.size.width, height: screenSize.size.height )
            //self.pudding_recipe.contentMode = UIView.ContentMode.scaleAspectFill
            //self.pudding_recipe.contentMode = UIView.ContentMode.scaleAspectFit
            self.salad_recipe.frame = CGRect(x: 0, y: 0, width: screenSize.size.width , height: screenSize.size.height )
            //self.salad_recipe.contentMode = UIView.ContentMode.scaleAspectFill
            //self.salad_recipe.contentMode = UIView.ContentMode.scaleAspectFit
            self.harvest_rice_recipe.frame = CGRect(x: 0, y: 0, width: screenSize.size.width, height: screenSize.size.height )
            self.back_button.frame = CGRect(x: screenSize.size.width/20, y: screenSize.size.height/25, width: screenSize.size.width/12, height: screenSize.size.height/30 )
            //self.back_button.contentMode = UIView.ContentMode.scaleAspectFill
            //self.back_button.contentMode = UIView.ContentMode.scaleAspectFit
            self.coupon_button.frame = CGRect(x: (self.view.frame.size.width)/4 , y:(3*screenSize.size.height)/8, width: screenSize.size.width/2, height: screenSize.size.height/4)
             self.reset_button.frame = CGRect(x: 0.7*screenSize.size.width, y: 0.001*screenSize.size.height, width: screenSize.size.width/4, height: screenSize.size.height/6 )
            self.reset_button.isHidden = false
            
        }
        // add observer when our player.currentItem finishes player, then start playing from the beginning
        //self.player.pause()
        
       
        //self.sceneView.pointOfView?.removeFromParentNode(ballNode1)

        
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: nil) { (notification) in
            let  timeToAdd :CMTime  = CMTimeMakeWithSeconds(182,preferredTimescale: 1)
            let  resultTime :CMTime  = CMTimeAdd(CMTime.zero,timeToAdd)
            self.player.seek(to: resultTime )
            self.player.play()
            
            //self.recipe_card_view.isHidden = false
            if self.player.rate == 1  {
                print("l play")
                  
               
                self.player.seek(to: CMTime.zero )
                self.player.pause()
                /*let ball1 = SCNPlane(width: screenSize.width/15000, height: screenSize.height/20000)
                let ballNode1 = SCNNode(geometry: ball1)
                ball1.firstMaterial?.diffuse.contents = self.coupon_button
                ballNode1.position = SCNVector3Make(0.0, 0.5, -0.1)
                self.sceneView.pointOfView?.addChildNode(ballNode1)
                self.player.seek(to: resultTime)*/
                
                //find our video file
                
                //let videoItem1 = AVPlayerItem(url: URL(fileURLWithPath: fileUrlString))
                
                //let player1 = AVPlayer(playerItem: videoItem1)
                //initialize video node with avplayer
                //let videoNode1 = SKVideoNode(avPlayer: player1)
                
               // player1.play()
                //guard let imageAnchor = anchor as? ARImageAnchor, let _ = Bundle.main.path(forResource: "black", ofType: "mp4") else {return}
            }
            else{}
            //player.play()
            
            //NotificationCenter.default.addObserver(self, selector: "playerDidFinishPlaying:",
            //name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: player.currentItem)
            //func playerDidFinishPlaying(note: NotificationCenter) {
                //player.play()
            //    print("Looping Video")
            //}

            print("Looping Video")
            //player.play()
        }
        
        // set the size (just a rough one will do)
        let videoScene = SKScene(size: CGSize(width: 852, height: 480))
        // center our video to the size of our video scene
        videoNode.position = CGPoint(x: videoScene.size.width / 2, y: videoScene.size.height / 2)
        // invert our video so it does not look upside down
        videoNode.yScale = -1.0
        // add the video to our scene
        videoScene.addChild(videoNode)
        // create a plan that has the same real world height and width as our detected image
        let plane = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width, height: imageAnchor.referenceImage.physicalSize.height)
        // set the first materials content to be our video scene
        plane.firstMaterial?.diffuse.contents = videoScene
        // create a node out of the plane
        let planeNode = SCNNode(geometry: plane)
        // since the created node will be vertical, rotate it along the x axis to have it be horizontal or parallel to our detected image
        planeNode.eulerAngles.x = -Float.pi / 2
        // finally add the plane node (which contains the video node) to the added node
        node.addChildNode(planeNode)
        let spacing: Float = 0.005
        
        let flag = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width, height: imageAnchor.referenceImage.physicalSize.width / 3)
        flag.firstMaterial?.diffuse.contents = UIImage(named: "2")
        
        let flagNode = SCNNode(geometry: flag)
        //flagNode.pivotOnTopCenter()
        flagNode.position.y -= Float(plane.height ) + (spacing)
        planeNode.addChildNode(flagNode)
        
        //let ball1 = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width/5, height: imageAnchor.referenceImage.physicalSize.width / 3)
        //self.ballNode1 = SCNNode(geometry: ball1)
        //print("ball one")
        //ball1.firstMaterial?.diffuse.contents = self.coupon_button
        //ballNode1.position.y -= Float(plane.height )/1.45 +  spacing
        //ballNode1.position = SCNVector3Make(0.0, 0.02, -0.1)
        //planeNode.addChildNode(self.ballNode1)
        //harvest_.frame = CGRectMake(100, 100, 100, 50)
        
       
    }
    
    
}

