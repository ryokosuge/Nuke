//
//  WebPDemoViewController.swift
//  NukeWebPDemo
//
//  Created by nagisa-kosuge on 2018/01/12.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit
import NukeWebP

class WebPDemoViewController: UIViewController {

    static func storyboardRef() -> UIViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: "WebPDemoViewController")
    }

    lazy var manager: NukeWebP.Manager = {
        let dataDecoder = NukeWebP.DataDecoderComposition(decoders: [NukeWebP.DataDecoder(), NukeWebP.WebPDataDecoder()])
        let loader = NukeWebP.Loader(loader: DataLoader(), decoder: dataDecoder)
        let manager = NukeWebP.Manager(loader: loader, cache: Cache.shared)
        return manager
    }()

    @IBOutlet weak var imageView: UIImageView?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let url = URL(string: "https://www.gstatic.com/webp/gallery/1.sm.webp")!
        if let imageView = self.imageView {
            NukeWebP.Manager.shared.loadImage(with: url, into: imageView)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
