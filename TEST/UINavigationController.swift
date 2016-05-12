//
//  UINavigationController.swift
//  TEST
//
//  Created by Massimo on 16/4/23.
//  Copyright © 2016年 Massimo. All rights reserved.
//

import Foundation
import UIKit
extension UINavigationController {
 
  public override func viewDidLoad() {
    Swizzle(UINavigationController.classForCoder(), origSEL: #selector(pushViewController(_:animated:)), newSEL: #selector(swizzlePushViewController(_:animated: )))
    super.viewDidLoad()
    self.interactivePopGestureRecognizer?.delegate = self
    
  }
  
  
  func swizzlePushViewController(viewController:UIViewController,animated:Bool) {
    
    //do something;
    if self.childViewControllers.count > 0 {
      viewController.hidesBottomBarWhenPushed = true
      let backButton = UIButton(type: .Custom)
      backButton.setImage(UIImage(named: "fanhui"), forState: .Normal)
      backButton.setImage(UIImage(named: "fanhui"), forState: .Highlighted)
      backButton.addTarget(self, action: #selector(onClickBack), forControlEvents: .TouchUpInside)
      backButton.sizeToFit()
      let leftItem = UIBarButtonItem(customView: backButton)
      viewController.navigationItem.leftBarButtonItem = leftItem

    }
    self.swizzlePushViewController(viewController, animated: animated)
  }
  public func onClickBack() {
    self.popViewControllerAnimated(true)
  }
  
}

extension UINavigationController:UIGestureRecognizerDelegate{
  public func gestureRecognizerShouldBegin(gestureRecognizer: UIGestureRecognizer) -> Bool {
    return self.childViewControllers.count > 1
  }
}


//静态就交换静态，实例方法就交换实例方法
func Swizzle(c:AnyClass,origSEL:Selector,newSEL:Selector){
  var origMethod = class_getInstanceMethod(c, origSEL)
  var newMethod:Method?
  if origMethod == nil {
    origMethod = class_getClassMethod(c, origSEL)
    if origMethod == nil {
      return
    }
    newMethod = class_getClassMethod(c, newSEL)
    if (newMethod == nil) {
      return;
    }
  }else{
    newMethod = class_getInstanceMethod(c, newSEL);
    if (newMethod == nil) {
      return;
    }
  }
   //自身已经有了就添加不成功，直接交换即可
  if class_addMethod(c, origSEL, method_getImplementation(newMethod!), method_getTypeEncoding(newMethod!)){
    class_replaceMethod(c, newSEL, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
  }else{
    method_exchangeImplementations(origMethod, newMethod!);
  }
  
  
}
