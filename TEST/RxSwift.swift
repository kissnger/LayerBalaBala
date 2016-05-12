//
//  RxSwift.swift
//  TEST
//
//  Created by Massimo on 16/4/27.
//  Copyright © 2016年 Massimo. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import Alamofire
class RViewControll: UIViewController,aaaa {
  
  @IBOutlet weak var label1:UITextField?
  @IBOutlet weak var label2:UITextField?
  @IBOutlet weak var label3:UITextField?
  @IBOutlet weak var result: UILabel!
  var cellViewModels = [ClubTableCellViewModel]()
  override func viewDidLoad() {
    
    let obs = Observable.combineLatest(label1!.rx_text, label2!.rx_text, label3!.rx_text) { textValue1, textValue2, textValue3 -> Int in
      dddddd(dsss)
      return (Int(textValue1) ?? 0) + (Int(textValue2) ?? 0) + (Int(textValue3) ?? 0)
      
      }.map { $0.description }
    obs.subscribeNext { x in
      NSLog("\(x)")
    }
    
    self.nihao()
    self.dddd()
    label1?.addTarget(self, action: #selector(nihao(_:)), forControlEvents: UIControlEvents.EditingDidBegin)
    
    let result = NSObject.make { (ma) in
      NSLog("----NSObject.make-----\(NSThread.currentThread())")
      ma.add(5).add(6)
      
    }
    
    
    NSLog("---------\(result)")
  }
  
  func nihao(tes: AnyObject) {
    NSLog("----label1--\(tes)---")
  }
  
}


func dddddd(a:()->()) {
  a()
}


func dsss()  {
  NSLog("点到我了")
}
class Manager : aaaa{
  var result : Int = 0
}

extension NSObject {
  class func make(block:((ma:Manager)->()))->Int{
    let ma = Manager()
    block(ma: ma)
    NSLog("----make-----\(NSThread.currentThread())")
    return ma.result
    
  }
}


typealias dfdfdf = (a:Int)->()
protocol aaaa {
  
  
}

extension aaaa where Self:Manager{
  func add(a:Int) -> Manager {
    NSLog("----add-----\(NSThread.currentThread())")
    result += a
    return self
  }
  
  func equle() -> Int {
    return self.result
  }
}


extension aaaa where Self : UIViewController  {
  func nihao() {
    
  }
  func dddd() {
    
  }
}




class ClubTableCellViewModel: NSObject {
  
}
class ClubModel: NSObject {
  
}



