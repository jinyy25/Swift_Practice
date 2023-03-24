//
//  ViewController.swift
//  QRCodeTutorial_Swift
//
//  Created by 윤진영 on 2022/05/29.
//

import UIKit
import WebKit
import AVFoundation
import QRCodeReader

class MainViewController: UIViewController,
                          QRCodeReaderViewControllerDelegate {

    


    @IBOutlet weak var qrcodeBtn: UIButton!
    @IBOutlet weak var webView: WKWebView!
    
    // QRCODE LEADER VIEWCONTROLLER 만들기
    // Good practice: create the reader lazily to avoid cpu overload during the
    // initialization and each time we need to scan a QRCode
    lazy var readerVC: QRCodeReaderViewController = {
        let builder = QRCodeReaderViewControllerBuilder {
            $0.reader = QRCodeReader(metadataObjectTypes: [.qr], captureDevicePosition: .back)
            
            // Configure the view controller (optional)
            $0.showTorchButton        = false
            $0.showSwitchCameraButton = false
            $0.showCancelButton       = false
            $0.showOverlayView        = true
            $0.rectOfInterest         = CGRect(x: 0.2, y: 0.2, width: 0.6, height: 0.6)
        }
        
        return QRCodeReaderViewController(builder: builder)
    }()
    
    
    //MARK: - OVERRIDE METHOD
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let url = URL (string:"https://www.naver.com")
        let requestObj = URLRequest(url:url!)
        webView.load(requestObj)

        qrcodeBtn.layer.borderWidth = 3
        qrcodeBtn.layer.borderColor = UIColor.blue.cgColor
        qrcodeBtn.layer.cornerRadius = 10
        qrcodeBtn.addTarget(self, action: #selector(qrcodeReaderLaunch), for: .touchUpInside)
        
    }

    //MARK: - FILEPRIVATE METHOD
    @objc fileprivate func qrcodeReaderLaunch(){
        print("MainViewController - qrcodeReaderLaunch() called")
        // Retrieve the QRCode content
          // By using the delegate pattern
          readerVC.delegate = self

          // Or by using the closure pattern
          readerVC.completionBlock = { (result: QRCodeReaderResult?) in
              print(result)
              
              guard let scannedUrlString = result?.value else {return}
              print("scannedUrlString : \(scannedUrlString)")
              let scannedUrl = URL(string: scannedUrlString)
              self.webView.load(URLRequest(url: scannedUrl!))
          }

          // Presents the readerVC as modal form sheet
          readerVC.modalPresentationStyle = .formSheet
         
        
          // 설정된 QRCode View Controller를 화면에 보여줌
          present(readerVC, animated: true, completion: nil)
    }
    
    //MARK: - QRCODE LEADER DELEGATE METHOD
    func reader(_ reader: QRCodeReaderViewController, didScanResult result: QRCodeReaderResult) {
        reader.stopScanning()
        
        dismiss(animated: true, completion: nil)
        
    }
    
    func readerDidCancel(_ reader: QRCodeReaderViewController) {
        reader.stopScanning()

        dismiss(animated: true, completion: nil)
    }


}

