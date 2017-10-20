//
//  ViewController.swift
//  API_REST
//
//  Created by Raul Quispe on 10/20/17.
//  Copyright © 2017 QuimaDevelopers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let notificationName = Notification.Name("endDocumentStatus")
        NotificationCenter.default.addObserver(self, selector: #selector(self.endDocumentStatus), name: notificationName, object: nil)

        let params:Dictionary <String,String> = Dictionary()

        var headers:Dictionary <String,String> = Dictionary()
        headers["Content-Type"] = "application/json"

        ApiConsume.sharedInstance.consumeDataWithNewSession(url: "EstimadorREST/estimadorPension/service/v1.3", path: Constants.API_URL, headers: headers, params: params, typeParams: TypeParam.noParams, httpMethod: HTTP_METHOD.GET, notificationName: "endDocumentStatus")


    }
    func endDocumentStatus(notification:Notification){
        NotificationCenter.default.removeObserver(self, name: notification.name, object: nil)
        DispatchQueue.main.async(execute: {

        })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

