//
//  ViewController.swift
//  SwiftSessions
//
//  Created by Louiz on 17/03/2016.
//  Copyright © 2016 IdeaRobin. All rights reserved.
//

import UIKit

protocol TweetContentDelegate {
    func addTweet(tweet: String)
}

enum TweetBoxAvailableContraints {
    case First, Middle, Last
}
class SecondViewController: UIViewController, TweetContentDelegate {
    @IBOutlet weak var tweetBox: UIView!
    @IBOutlet weak var heightOfTweet: NSLayoutConstraint!
    @IBOutlet weak var mainChildView: UIView!
    
    var mainChildViewContraint : NSLayoutConstraint!
    var tweetBoxContraint : [NSLayoutConstraint] = []
    var tweetBoxFrame: CGRect = CGRectZero
    var tweetBoxArray : [UIView] = []
    var tweetBoxCounter = 0
    var beginConstraint : CGFloat!
    var tweetBoxHeight : CGFloat!
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetBox.hidden = true;
        beginConstraint = tweetBox.bounds.origin.y
        tweetBoxHeight = tweetBox.bounds.height
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addTweet(tweet: String) {
        initializeContainerView(tweetBox, componentName: "Main", controllerIdentifier: "TweetBoxViewController") {
            viewController in
            let tweetBoxViewController = viewController as! TweetBoxViewController
            tweetBoxViewController.tweetContent.text = tweet
           
                let newTweetBox = UIView(frame: CGRect(x: 0, y: 0, width: self.tweetBox.bounds.width, height:  self.tweetBox.bounds.height))
            
                newTweetBox.hidden = false
                newTweetBox.translatesAutoresizingMaskIntoConstraints = false

                tweetBoxViewController.view.bounds = newTweetBox.bounds
                newTweetBox.addSubview(tweetBoxViewController.view)
                self.mainChildView.addSubview(newTweetBox)
                var contraintsToReturn : [NSLayoutConstraint] = []
                 if self.tweetBoxArray.count > 0 {
                    let topConstraint = NSLayoutConstraint(item: newTweetBox , attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self.tweetBoxArray[self.tweetBoxCounter - 1], attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 120)
                    contraintsToReturn.append(topConstraint)
                 } else {
                    let topConstraint = NSLayoutConstraint(item: newTweetBox , attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.mainChildView, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 10)
                    contraintsToReturn.append(topConstraint)
                }
            
                let trailingConstraint = NSLayoutConstraint(item: newTweetBox, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: self.mainChildView, attribute: NSLayoutAttribute.TrailingMargin, multiplier: 1, constant: -20)
                
                let leadingConstraint = NSLayoutConstraint(item: newTweetBox, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self.mainChildView, attribute: NSLayoutAttribute.LeadingMargin, multiplier: 1, constant: 20)
                let centerConstraint = NSLayoutConstraint(item: newTweetBox, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.mainChildView, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0)
                
                let heightConstraint = NSLayoutConstraint(item: newTweetBox, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 110)
                
                let widthConstraint = NSLayoutConstraint(item: newTweetBox, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: self.tweetBox!.bounds.width)

                contraintsToReturn.append(leadingConstraint)
                contraintsToReturn.append(trailingConstraint)
                contraintsToReturn.append(centerConstraint)
                contraintsToReturn.append(heightConstraint)
                contraintsToReturn.append(widthConstraint)
                self.mainChildView.addConstraints(contraintsToReturn)
                NSLayoutConstraint.activateConstraints(contraintsToReturn)
                self.tweetBoxArray.append(newTweetBox)


            self.beginConstraint! += 120
            self.tweetBoxCounter++
            if self.beginConstraint > 503 {
                let horizontalConstraint = NSLayoutConstraint(item: self.mainChildView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: self.beginConstraint)
                if self.mainChildViewContraint != nil {
                    self.mainChildView.removeConstraint(self.mainChildViewContraint)
                }
                self.mainChildViewContraint = horizontalConstraint
                self.mainChildView.addConstraint(horizontalConstraint)
            }

    

            self.addChildViewController(tweetBoxViewController)
        }
    }
    
    func addTweetBoxContraint(inout item: UIView) -> [NSLayoutConstraint]
    {
        
        var contraintsToReturn : [NSLayoutConstraint] = []

        let topConstraint = NSLayoutConstraint(item: item, attribute: NSLayoutAttribute.TopMargin, relatedBy: NSLayoutRelation.Equal, toItem: self.tweetBox, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 80)
                contraintsToReturn.append(topConstraint)
        
        let trailingConstraint = NSLayoutConstraint(item: item, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: self.mainChildView, attribute: NSLayoutAttribute.TrailingMargin, multiplier: 1, constant: 20)
        
        let leadingConstraint = NSLayoutConstraint(item: item, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self.mainChildView, attribute: NSLayoutAttribute.LeadingMargin, multiplier: 1, constant: 020)
        let centerConstraint = NSLayoutConstraint(item: item, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.mainChildView, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0)
        
        let heightConstraint = NSLayoutConstraint(item: item, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 110)
        
        let widthConstraint = NSLayoutConstraint(item: item, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: self.tweetBox!.bounds.width)
        contraintsToReturn.append(leadingConstraint)
        contraintsToReturn.append(trailingConstraint)
        contraintsToReturn.append(centerConstraint)
        contraintsToReturn.append(heightConstraint)
        contraintsToReturn.append(widthConstraint)
        
        return contraintsToReturn
    }
    
    func initializeContainerView(containerView : UIView, componentName: String, controllerIdentifier: String?=nil, completionHandler: (UIViewController!) -> Void) {
        let viewControllerIdentifier = controllerIdentifier != nil ? controllerIdentifier : componentName
        
        let dashboardStoryboard = UIStoryboard(name: componentName, bundle: nil)
        let dashboardController = dashboardStoryboard.instantiateViewControllerWithIdentifier(viewControllerIdentifier!)
        
        containerView.bounds = dashboardController.view.bounds
        
        
        containerView.addSubview(dashboardController.view)
        
        completionHandler(dashboardController)
    }
    
}

