////
////  testClass.swift
////  FusumaExample
////
////  Created by Abdo Eaita on 2/15/17.
////  Copyright © 2017 ytakzk. All rights reserved.
////
//
//import UIKit
//import AVFoundation
//
//class test: UIViewController{
//    var previewView : UIView!
//    var boxView:UIView!
//    let myButton: UIButton = UIButton()
//    
//    //Camera Capture requiered properties
//    var videoDataOutput: AVCaptureVideoDataOutput!
//    var videoDataOutputQueue: DispatchQueue!
//    var previewLayer:AVCaptureVideoPreviewLayer!
//    var captureDevice : AVCaptureDevice!
//    let session = AVCaptureSession()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        previewView = UIView(frame: CGRect(x: 0,
//                                           y: 0,
//                                           width: UIScreen.main.bounds.size.width,
//                                           height: UIScreen.main.bounds.size.height))
//        previewView.contentMode = UIViewContentMode.scaleAspectFit
//        view.addSubview(previewView)
//        
//        //Add a view on top of the cameras' view
//        boxView = UIView(frame: self.view.frame)
//        
//        myButton.frame = CGRect(x: 0, y: 0, width: 200, height: 40)
//        myButton.backgroundColor = UIColor.red
//        myButton.layer.masksToBounds = true
//        myButton.setTitle("press me", for: UIControlState.normal)
//        myButton.setTitleColor(UIColor.white, for: UIControlState.normal)
//        myButton.layer.cornerRadius = 20.0
//        myButton.layer.position = CGPoint(x: self.view.frame.width/2, y:200)
//        myButton.addTarget(self, action: #selector(self.onClickMyButton(sender:)), for: UIControlEvents.touchUpInside)
//        
//        view.addSubview(boxView)
//        view.addSubview(myButton)
//        
//        self.setupAVCapture()
//    }
//    
//    override var shouldAutorotate: Bool {
//        if (UIDevice.current.orientation == UIDeviceOrientation.landscapeLeft ||
//            UIDevice.current.orientation == UIDeviceOrientation.landscapeRight ||
//            UIDevice.current.orientation == UIDeviceOrientation.unknown) {
//            return false
//        }
//        else {
//            return true
//        }
//    }
//    
//    func onClickMyButton(sender: UIButton){
//        print("button pressed")
//    }
//}
//
//
//// AVCaptureVideoDataOutputSampleBufferDelegate protocol and related methods
//extension test:  AVCaptureVideoDataOutputSampleBufferDelegate{
//    func setupAVCapture(){
//        session.sessionPreset = AVCaptureSessionPreset640x480
//        guard let device = AVCaptureDevice
//            .defaultDevice(withDeviceType: .builtInWideAngleCamera,
//                           mediaType: AVMediaTypeVideo,
//                           position: .back) else{
//                            return
//        }
//        captureDevice = device
//        beginSession()
//    }
//    
//    func beginSession(){
//        var err : NSError? = nil
//        var deviceInput:AVCaptureDeviceInput?
//        do {
//            deviceInput = try AVCaptureDeviceInput(device: captureDevice)
//        } catch let error as NSError {
//            err = error
//            deviceInput = nil
//        }
//        if err != nil {
//            print("error: \(err?.localizedDescription)");
//        }
//        if self.session.canAddInput(deviceInput){
//            self.session.addInput(deviceInput);
//        }
//        
//        videoDataOutput = AVCaptureVideoDataOutput()
//        videoDataOutput.alwaysDiscardsLateVideoFrames=true
//        videoDataOutputQueue = DispatchQueue(label: "VideoDataOutputQueue")
//        videoDataOutput.setSampleBufferDelegate(self, queue:self.videoDataOutputQueue)
//        if session.canAddOutput(self.videoDataOutput){
//            session.addOutput(self.videoDataOutput)
//        }
//        videoDataOutput.connection(withMediaType: AVMediaTypeVideo).isEnabled = true
//        
//        self.previewLayer = AVCaptureVideoPreviewLayer(session: self.session)
//        self.previewLayer.videoGravity = AVLayerVideoGravityResizeAspect
//        
//        let rootLayer :CALayer = self.previewView.layer
//        rootLayer.masksToBounds = true
//        self.previewLayer.frame = rootLayer.bounds
//        rootLayer.addSublayer(self.previewLayer)
//        session.startRunning()
//    }
//    
//    func captureOutput(_ captureOutput: AVCaptureOutput!,
//                       didOutputSampleBuffer sampleBuffer: CMSampleBuffer!,
//                       from connection: AVCaptureConnection!) {
//        // do stuff here
//    }
//    
//    // clean up AVCapture
//    func stopCamera(){
//        session.stopRunning()
//    }
//    
//}
