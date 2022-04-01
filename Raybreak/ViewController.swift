//
//  ViewController.swift
//  Raybreak
//
//  Created by Admin on 4/1/22.
//

import UIKit
import MetalKit

enum metalColors{
    static let wenderlichGreen = MTLClearColor(red: 0.0, green: 0.4, blue: 0.21, alpha: 1.0)
}

class ViewController: UIViewController {
    
    var metalView: MTKView{
        return view as! MTKView
    }
    
    var device: MTLDevice!
    var commandQueue: MTLCommandQueue!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        metalView.device = MTLCreateSystemDefaultDevice()
        device = metalView.device
        
        metalView.clearColor = metalColors.wenderlichGreen
        
        commandQueue = device.makeCommandQueue()
        let commandBuffer = commandQueue.makeCommandBuffer()
        
        let commandEncoder = commandBuffer
    }


}

