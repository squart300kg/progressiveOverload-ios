//
//  FloatingViewController.swift
//  overload
//
//  Created by SangYun Song on 2022/02/20.
//

import Foundation
import FloatingPanel
import UIKit

class FloatingViewContoroller: FloatingPanelControllerDelegate {
    
    static let shared = FloatingViewContoroller()
    let fpcView : FloatingPanelController?
    
    enum Scene {
        
    }
    
    private init() {
        self.fpcView = FloatingPanelController()
        fpcView?.delegate = self
    }
    
    func show(scene: Scene, contentVC: UIViewController) -> FloatingPanelController {
        self.fpcView?.set(contentViewController: contentVC)
        contentVC.loadViewIfNeeded()
        let appearance = SurfaceAppearance()
        appearance.cornerRadius = 12
        self.fpcView?.surfaceView.appearance = appearance
        return  self.fpcView ?? FloatingPanelController()
    }
}

