//
//  ViewController.swift
//  gcsExperiment
//
//  Created by Micah Chiang on 4/1/16.
//  Copyright © 2016 Micah Chiang. All rights reserved.
//

class ViewController: UIViewController, GCSVideoViewDelegate, UIGestureRecognizerDelegate{
    
    let kMargin: CGFloat = 16
    let kVideoViewHeight: CGFloat = 250
    var scrollView:UIScrollView!
    
    var stereoVidView: GCSVideoView!
    var isPaused: Bool!
    var videoFileURL: String!
    //    var titleLabel: UILabel?
    //    var subtitleLabel: UILabel?
    //    var preambleLabel: UILabel?
    //    var postambleLabel: UILabel?
    //    var attributionTextView: UITextView!
    //graph setup
    
    
    //restarts video on tap at end of playing.
    
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
//        videoView = UIView()
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        self.view.backgroundColor = UIColor.whiteColor()
                scrollView = UIScrollView.init(frame: self.view.bounds)
                scrollView.autoresizingMask = UIViewAutoresizing.FlexibleWidth
                scrollView.autoresizingMask = UIViewAutoresizing.FlexibleHeight
                self.view.addSubview(scrollView)
        
        //        titleLabel!.font = UIFont(name: titleLabel!.font.fontName, size:20)
        //        titleLabel!.text = "Gorillas"
        //        scrollView.addSubview(titleLabel!)
        //
        //        subtitleLabel!.font = UIFont(name: subtitleLabel!.font.fontName, size: 20)
        //        subtitleLabel!.text = "MOAR GORILAZ"
        //        scrollView.addSubview(subtitleLabel!)
        //
        //        preambleLabel!.font = UIFont(name: preambleLabel!.font.fontName, size: 20)
        //        preambleLabel!.text = "I LIKE BANANAZ"
        //        scrollView.addSubview(preambleLabel!)
                stereoVidView = GCSVideoView(frame: CGRectMake(16, 32, self.view.bounds.size.width - 32, 200))
                stereoVidView.delegate = self
        
                stereoVidView.enableFullscreenButton = true
                scrollView.addSubview(stereoVidView)
        
        //        postambleLabel!.font = UIFont(name: postambleLabel!.font.fontName, size: 20)
        //        postambleLabel!.text = "GORILAZ LIKEZ BANANAZ ALOTZ"
        //        scrollView.addSubview(postambleLabel!)
        isPaused = false
        
        //        UIApplication.sharedApplication().statusBarOrientation = UIInterfaceOrientation.LandscapeLeft
        //        let value = UIInterfaceOrientation.LandscapeLeft.rawValue
        //        UIDevice.currentDevice().setValue(value, forKey: "orientation")
        //        let dirPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        //        let path = NSURL(fileURLWithPath: dirPaths+"/"+"\(videoFileURL)")
        //        print(path)
        //
        //        let fileURL = path.URLByAppendingPathComponent(videoFileURL)
        let videoPath:String = NSBundle.mainBundle().pathForResource("congo", ofType: "mp4")!
        print(videoPath)
                stereoVidView.loadFromUrl(NSURL.fileURLWithPath(videoPath))
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        //        self.setFrameForView(titleLabel, belowView: nil, margin: kMargin)
        //        self.setFrameForView(subtitleLabel, belowView: titleLabel, margin: kMargin)
        //        self.setFrameForView(preambleLabel, belowView: subtitleLabel, margin: kMargin)
        //        self.setFrameForView(attributionTextView, belowView: postambleLabel, margin: kMargin)
        
        //        videoView.frame = CGRectMake(kMargin, CGRectGetMaxY(self.view.bounds)+kMargin, CGRectGetWidth(self.view.bounds)-2*kMargin, kVideoViewHeight)
        //        scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.bounds), CGRectGetMaxY(self.view.bounds)+kMargin)
    }
    
    //GCSVideoViewDelegate
    func widgetViewDidTap(widgetView: GCSWidgetView!) {
        if isPaused == true {
            stereoVidView.resume()
        }
        else {
            stereoVidView.pause()
        }
        isPaused = !isPaused
    }
    
    func videoView(videoView: GCSVideoView!, didUpdatePosition position: NSTimeInterval) {
        if position == videoView.duration() {
            isPaused = true
            stereoVidView.seekTo(0)
        }
    }
    
    //    func setFrameForView(view: UIView, belowView topView: UIView?, margin: CGFloat) {
    //        var size: CGSize = view.sizeThatFits(CGSizeMake(CGRectGetWidth(self.view.bounds) - 2 * kMargin, CGFloat.max))
    //        if let topView1 = topView {
    //             view.frame = CGRectMake(kMargin, CGRectGetMaxY(topView!.frame) + margin, size.width, size.height)
    //        }
    //    }
    
}


