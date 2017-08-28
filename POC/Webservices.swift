//
//  Webservices.swift
//  Test
//
//  Created by Nanda Ballabh on 23/08/17.
//  Copyright © 2017 My Communication. All rights reserved.
//

import UIKit

open class Webservices: NSObject {
    
   public static let sharedInstance = Webservices()

    @discardableResult open func faveoDashboardServiceRequest(_ _closure:((NSError?,NSDictionary?) -> Void)? = nil) -> URLSessionDataTask {
        let urlString : String = "https://rhicluat.religare.com/relinterfacerestful/religare/restful/faveoDashboardService"
        let url = URL(string: urlString)
        let json : [String:Any] = ["dashboardInput": ["userId":"20572094","password" : "MTIzNA=="],"masterMetaDataIO":["applicationId": "FAVEO","clientKey": 16148,"token": "token","sessionId": "sessionid","serviceName": "faveoDashboardService","methodName": "faveoDashboardService","requestType": 1,"browser": "chrome","clientIP": "10.216.20.20"]]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("807415", forHTTPHeaderField: "appId")
        request.setValue("1492507516844", forHTTPHeaderField: "timestamp")
        request.setValue("lah+w6mfcl1rJEX0l4upNNVYUVS3EOWaOkhkVaiqRvk=", forHTTPHeaderField: "signature")
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                print(error!)
                return
            }
            guard let responseData = data else {
                print("Did not recieve data")
                return
            }
            
            do {
                guard let todo = try JSONSerialization.jsonObject(with: responseData, options: []) as? NSDictionary else {
                    print("No data found")
                    return
                }
                _closure!(nil,todo)
                print("ToDo Description:", todo)
                
                guard let todoTitle = todo["title"] as? String else {
                    print("Could not get todo title from JSON")
                    return
                }
                print("The title is: " + todoTitle)
            }
                
            catch  {
                print("error trying to convert data to JSON")
                return
            }
        }
        task.resume()
        return task
        
    }

    @discardableResult public func commaonApiCall(url: String, jsonData : NSData, _ _closure:((NSError?,NSDictionary?) -> Void)? = nil) -> URLSessionDataTask {
        let urlString : String = url
        let url = URL(string: urlString)
       // let json : [String:Any] = request
       // let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = jsonData as Data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("807415", forHTTPHeaderField: "appId")
        request.setValue("1492507516844", forHTTPHeaderField: "timestamp")
        request.setValue("lah+w6mfcl1rJEX0l4upNNVYUVS3EOWaOkhkVaiqRvk=", forHTTPHeaderField: "signature")
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                print(error!)
                return
            }
            guard let responseData = data else {
                print("Did not recieve data")
                return
            }
            
            do {
                guard let todo = try JSONSerialization.jsonObject(with: responseData, options: []) as? NSDictionary else {
                    print("No data found")
                    return
                }
                _closure!(nil,todo)
                print("ToDo Description:", todo)
                
                guard let todoTitle = todo["title"] as? String else {
                    print("Could not get todo title from JSON")
                    return
                }
                print("The title is: " + todoTitle)
            }
                
            catch  {
                print("error trying to convert data to JSON")
                return
            }
        }
        task.resume()
        return task
    }

}
