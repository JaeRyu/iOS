//
//  PagedScrollViewController.swift
//  UIView
//
//  Created by kpugame on 2017. 4. 18..
//  Copyright © 2017년 Jae Won Yoo. All rights reserved.
//

import UIKit

class PagedScrollViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet var scsrollView: UIScrollView!
    @IBOutlet var pageControl: UIPageControl!
    
    var pageImages: [UIImage] = []
    var pageViews: [UIImageView?] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pageImages = [UIImage(named: "photo1.png")!,
                    UIImage(named: "photo2.png")!,
                    UIImage(named: "photo3.png")!,
                    UIImage(named: "photo4.png")!,
                    UIImage(named: "photo5.png")!]
        
        let pageCount = pageImages.count
        
        pageControl.currentPage = 0
        pageControl.numberOfPages = pageCount
        
        for _ in 0..<pageCount {
            pageViews.append(nil)
        }
        
        let pageScrollViewSize = scsrollView.frame.size
        scsrollView.contentSize = CGSize(width: pageScrollViewSize.width * CGFloat(pageImages.count), height: pageScrollViewSize.height)
        
        loadVisiblePages()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadPage(_ page: Int){
        if page<0 || page >= pageImages.count{
            return
        }
        
        if let pageView = pageViews[page]{
            
        } else {
            var frame = scsrollView.bounds
            frame.origin.x = frame.size.width * CGFloat(page)
            frame.origin.y = 0.0
            let newPageView = UIImageView(image: pageImages[page])
            newPageView.contentMode = .scaleAspectFit
            newPageView.frame = frame
            scsrollView.addSubview((newPageView))
            
            pageViews[page] = newPageView
        }
        
    }
    
    func purgePage(_ page: Int) {
        if(page < 0 || page >= pageImages.count) {
            return
        }
        
        if let pageView = pageViews[page] {
            pageView.removeFromSuperview()
            pageViews[page] = nil
        }
    }
    
    func loadVisiblePages(){
        let pageWidth = scsrollView.frame.size.width
        let page = Int(floor((scsrollView.contentOffset.x * 2.0 + pageWidth) / (pageWidth * 2.0)))
        
        pageControl.currentPage = page
        
        let firstPage = page-1
        let lastPage = page+1
        
        for index in 0 ..< firstPage+1 {
            purgePage(index)
        }
        
        for index in firstPage...lastPage {
            loadPage(index)
        }
        
        for index in lastPage+1 ..< pageImages.count+1 {
            purgePage(index)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        loadVisiblePages()
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
