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
        
        //Todo esto es para configurar Metal para ser presentado
        metalView.device = MTLCreateSystemDefaultDevice()
        device = metalView.device
        
        metalView.clearColor = metalColors.wenderlichGreen
        metalView.delegate = self
        
        commandQueue = device.makeCommandQueue()
        
        
    }

}

extension ViewController: MTKViewDelegate {
    //Esta funcion renderizara cuando el usuario haga mamadas de girar el dispositivo y asi
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        
    }
    
    //Esto dibujara por cada frame
    func draw(in view: MTKView){
        guard let drawable = view.currentDrawable,
              let descriptor = view.currentRenderPassDescriptor else {
            return}
        
        let commandBuffer = commandQueue.makeCommandBuffer()
        
        let commandEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: descriptor)
        
        commandEncoder?.endEncoding()
        commandBuffer?.present(drawable)
        commandBuffer?.commit()
    }
}

