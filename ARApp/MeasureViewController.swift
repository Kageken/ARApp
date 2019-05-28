//
//  MeasureViewController.swift
//  ARApp
//
//  Created by 陰山賢太 on 2019/05/27.
//  Copyright © 2019 Kageken. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class MeasureViewController: UIViewController, ARSCNViewDelegate {

    private var startNode: SCNNode?
    private var endNode: SCNNode?
    private var lineNode: SCNNode?

    @IBOutlet weak var sceneView: ARSCNView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.sceneView.delegate = self
        self.sceneView.showsStatistics = true
        let scene = SCNScene()
        self.sceneView.scene = scene

        reset()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingConfiguration()
        self.sceneView.session.run(configuration)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.sceneView.session.pause()
    }

    //MARK: - Private
    private func reset() {
        startNode?.removeFromParentNode()
        startNode = nil
        endNode?.removeFromParentNode()
        endNode = nil
    }

    private func putSphere(at pos: SCNVector3, radius: CGFloat, color: UIColor) -> SCNNode {
        let sphere = SCNSphere(radius: radius)
        let material = SCNMaterial()
        material.diffuse.contents = color
        sphere.materials = [material]
        let node = SCNNode(geometry: sphere)
        node.position = pos
        return node
    }

    //MARK: - Session
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user

    }

    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay

    }

    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required

    }

    //MARK: - Action
    @IBAction func tappedButton(_ sender: Any) {
    }
    
}
