//
//  ViewController.swift
//  PageAndScroll
//
//  Created by 林祔利 on 2023/5/8.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageViews: [UIImageView]!
    
    @IBOutlet var pageView: UIView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func changePage(_ sender: UIPageControl) {
        let point = CGPoint(x: scrollView.bounds.width * CGFloat(sender.currentPage), y: 0)
        scrollView.setContentOffset(point, animated: true)
    }
}

extension ViewController:UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / scrollView.bounds.width
        pageControl.currentPage = Int(page)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        for pageView in scrollView.subviews{
            if pageView.isKind(of: UIView.self){
                return pageView
            }
        }
        return nil
    }

}
