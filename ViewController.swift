//
//  ViewController.swift
//  SBLoader
//
//  Created by Aryan Kashyap on 2015-08-18.
//  Copyright (c) 2015 Aryan Kashyap. All rights reserved.
//

import UIKit



var arrowImage : UIImageView!

class ViewController: UIViewController, HolderViewDelegate {
  
    
  var holderView = HolderView(frame: CGRectZero)
   override func viewDidLoad() {
    super.viewDidLoad()
    
  }

  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    addHolderView()
   /*let imageName = "downArrow"
   let image = UIImage(named: imageName)
    let imageView = UIImageView(image: image!)
    imageView.frame = CGRect(x: 10, y: 50, width: 276, height: 143)
    view.addSubview(imageView)
   */
}
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  func addHolderView() {
    let boxSize: CGFloat = 100.0
    holderView.frame = CGRect(x: view.bounds.width / 2 - boxSize / 2,
                              y: view.bounds.height / 2 - boxSize / 2,
                              width: boxSize,
                              height: boxSize)
    holderView.parentFrame = view.frame
    holderView.delegate = self
    view.addSubview(holderView)
    holderView.addOval()
  }
  
  func animateLabel() {

    //1
    holderView.removeFromSuperview()
    view.backgroundColor = Colors.blue
    
    //2
    var label : UILabel = UILabel(frame: view.frame)
    label.textColor = UIColor.whiteColor()
    label.numberOfLines = 0
    label.font = UIFont(name : "HelveticaNeue-Thin", size : 20.0)
    label.textAlignment = NSTextAlignment.Center
    label.text = "Hi My Name is Aryan Kashyap I am 12 Year Old Living in Milton Keynes , England. I started Developing apps when i was 10. I Totally Love Apple And its Design And Everything "
    label.transform = CGAffineTransformScale(label.transform , 0.25 , 0.25)
    view.addSubview(label)
    
    
    //3
    UIView.animateWithDuration(0.4, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.1, options: UIViewAnimationOptions.CurveEaseInOut,
        animations: ({
            label.transform = CGAffineTransformScale(label.transform, 4.0, 4.0)
        }), completion: { finished in
            self.addButton()
    })
}
    

  
  func addButton() {
    let button = UIButton()
    button.frame = CGRectMake(0.0, 0.0, view.bounds.width, view.bounds.height)
    button.addTarget(self, action: "buttonPressed:", forControlEvents: .TouchUpInside)
    view.addSubview(button)
  }
  
  func buttonPressed(sender: UIButton!) {
    view.backgroundColor = Colors.white
    view.subviews.map({ $0.removeFromSuperview() })
    holderView = HolderView(frame: CGRectZero)
    addHolderView()
  }
}

