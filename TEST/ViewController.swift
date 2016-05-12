//
//  ViewController.swift
//  TEST
//
//  Created by Massimo on 16/3/29.
//  Copyright © 2016年 Massimo. All rights reserved.
//

import UIKit
//import Alamofire
//import CryptoSwift
class ViewController: UIViewController  {
  @IBOutlet weak var progress : UIProgressView?
  override func viewDidLoad() {
    super.viewDidLoad()
    progress?.progress = 0
  }
  
  @IBAction func start(){
    progress?.progress = 0
    let params = ["start_short_address":" Apple Store",
                  "start_lat":"39.93503",
                  "start_address":"北京市朝阳区三里屯 Apple Store 零售店",
                  "end_lng":"116.337742",
                  "end_lat":"39.992894",
                  "user_id":"701948261161897984",
                  "start_lng":"116.454214",
                  "end_address":"北京市海淀区五道口(地铁站)",
                  "end_short_address":"五道口(地铁站)",
                  "start_date":"2016-5-4"]
    let NWP_KEY_SIGNATURE = "signature"
    let NWP_KEY_UUID = "X-Uuid"
    let NWP_KEY_PLATFORM = "X-Platform"
    let NWP_KEY_VERSION = "X-Version"
    let NWP_KEY_TIME_STAMP = "timestamp"
    let PLAT_FORM_NAME = "IOS"
    let QM_APP_KEY = "Qm.inter*connect^app"
    let uuid = UIDevice.currentDevice().identifierForVendor!.UUIDString
    var dict =  NSBundle.mainBundle().infoDictionary!
    let appVersion = dict["CFBundleShortVersionString"]! as! String
    let timeStamp = Int(NSDate().timeIntervalSince1970*1000);
    let timeStampStr = "\(timeStamp)"
    
    var paramStr = ParamStr(params)
    paramStr = paramStr.stringByReplacingOccurrencesOfString(" ", withString: "+")
    let all = "\(PLAT_FORM_NAME)\(QM_APP_KEY)\(uuid)\(appVersion)\(paramStr)\(timeStamp)"
    //
    var md5 = MD5(all)
    md5 = md5.lowercaseString
    
    NSLog("\n\n=========md5签名===========\n\n\(all)\n\n=====md5=====\(md5)==========\n\n")
    
    let heads = [NWP_KEY_SIGNATURE:md5,
                 NWP_KEY_UUID:uuid,
                 NWP_KEY_PLATFORM:PLAT_FORM_NAME,
                 NWP_KEY_VERSION:appVersion,
                 NWP_KEY_TIME_STAMP:timeStampStr]
    
    NSLog("\n----heads----\n\(heads)\n\n\n--------\n\n")
    


  }
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
}


func ParamStr(params:Dictionary<String,String>) -> String {
  let Keys = NSMutableArray()
  for (key,_) in params{
    Keys.addObject(key)
  }
  //按字母表排序
  let sortedKeys = Keys.sortedArrayUsingSelector(#selector(AnyObject.localizedCaseInsensitiveCompare)) as NSArray
  var result = ""
  var tempFmt = ""
  var comma = ""
  var encodeValue:String
  //根据key顺序从字典中取得键值对,拼接出半成参数字符串
  for i in 0 ..< sortedKeys.count {
    let key = sortedKeys[i] as! String
    let value:AnyObject = params[key]!

    encodeValue = Filter(value as! String)
    
    comma = ((i == 0) ? "" : "&")
    tempFmt = "\(comma)\(key)=\(encodeValue)"
    
    result = result.stringByAppendingString(tempFmt)
  }
  
  return result;
}


func Filter(string:String) -> String {
  var result = ""
  let customAllowedSet =  NSCharacterSet(charactersInString:"=\"#%/<>?@\\^`{|}()").invertedSet
  result = string.stringByAddingPercentEncodingWithAllowedCharacters(customAllowedSet)!
  return result
  
}

func MD5(string:String)->String{
  
  
    let str = string.cStringUsingEncoding(NSUTF8StringEncoding)
    let strLen = CUnsignedInt(string.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
    let digestLen = Int(CC_MD5_DIGEST_LENGTH)
    var result = UnsafeMutablePointer<CUnsignedChar>.alloc(digestLen)
    CC_MD5(str!, strLen, result)
    let hash = NSMutableString()
    for i in 0 ..< digestLen {
      hash.appendFormat("%02x", result[i])
    }
  
    free(result)
    result = nil
    return String(format: hash as String)
  
  
}

