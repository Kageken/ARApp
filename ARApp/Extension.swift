//
//  Extension.swift
//  ARApp
//
//  Created by 陰山賢太 on 2019/05/27.
//  Copyright © 2019 Kageken. All rights reserved.
//

import Foundation
import SceneKit
import ARKit

//MARK: - Extension
extension Float {
    var prec2: String {
        return String(format: "%.2f", self)
    }
    var rad2deg: Float {
        return self * 57.296
    }
}

//MARK: - Function
func calcScenePositionDistance(_ posA: SCNVector3, _ posB: SCNVector3) -> Float {
    return GLKVector3Distance(SCNVector3ToGLKVector3(posA), SCNVector3ToGLKVector3(posB))
}
