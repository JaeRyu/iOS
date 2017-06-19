//
//  ViewController.swift
//  SiriPhoto
//
//  Created by kpugame on 2017. 6. 7..
//  Copyright © 2017년 Jae Won Yoo. All rights reserved.
//

import UIKit
import Intents
import Photos

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        INPreferences.requestSiriAuthorization({status in
            
        })
    }
    
    func handleActivity(_ userActivity: NSUserActivity) {
        
        let intent = userActivity.interaction?.intent
            as! INSearchForPhotosIntent
        
        if (intent.dateCreated?.startDateComponents) != nil {
            let calendar = Calendar(identifier: .gregorian)
            let startDate = calendar.date(from:
                (intent.dateCreated?.startDateComponents)!)
            let endDate = calendar.date(from:
                (intent.dateCreated?.endDateComponents)!)
            displayPhoto(startDate!, endDate!)
        }
    }
    
    func displayPhoto(_ startDate: Date, _ endDate: Date) {
        
        let fetchOptions = PHFetchOptions()
        
        fetchOptions.predicate = NSPredicate(format: "creationDate > %@ AND creationDate < %@", startDate as CVarArg, endDate as CVarArg)
        let fetchResult = PHAsset.fetchAssets(with:
            PHAssetMediaType.image, options: fetchOptions)
        
        let imgManager = PHImageManager.default()
        
        imgManager.requestImage(for: fetchResult.firstObject! as PHAsset,
                                targetSize: view.frame.size,
                                contentMode: PHImageContentMode.aspectFill,
                                options: nil, 
                                resultHandler: { (image, _) in
                                    self.imageView.image = image
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

