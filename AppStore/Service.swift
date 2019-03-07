//
//  Service.swift
//  AppStore
//
//  Created by Abby Esteves on 18/02/2019.
//  Copyright © 2019 Abby Esteves. All rights reserved.
//

import UIKit

class Service {
    
    // return url async session response
    
    func urlRequest(url : URL, method : String, parameters : [String : Any]?, timeOutInterval : Double) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        //add timeout interval
        if timeOutInterval > 0 {
            request.timeoutInterval = timeOutInterval
        }
        //add headers
//        for header in self.headers {
//            request.setValue(header.value, forHTTPHeaderField: header.key)
//        }
        //
        if parameters != nil {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters!, options:JSONSerialization.WritingOptions.prettyPrinted)
            } catch {
                print(" error httpBody imagePost ", error)
            }
        }
        return request
    }
    
    func sendPost() {
        let parameters = [
            "name": "Abigail Esteves",
            "email": "abbyesteves413@gmail.com",
            "about": "Good day, \n I my name is Abby, I have a bachelor's degree in Computer Science. 4 years of total working experience since I graduated December 2015. A year in web design, 2 years in iOS app html5 and a year in iOS app native. \n \n The hybrid application we developed was a business solution for fast food chains and one of our clients were Churches Chicken, Burger King, KFC and Kudu from saudi arabia. My Job was to ensure that the clients get to view their data conveniently. During the 1 year of native development I was be able to design and developed 2 applications from UI, UX to couchbase backend service. The apps was for businesses to view their products and services, for schools to track students performances from attendance to automating new ways to remind them of their assignments. \n \n In addition, I enjoy coming up with new ways to make improvements, to help and also learn from colleagues. Looking forward to hearing from you. Have a great day.",
            "urls": ["https://www.linkedin.com/in/abbyesteves/", "https://drive.google.com/open?id=1Nz9c62V52cdXjaxlWOL2skwr3H341Rfj", "https://github.com/abbyesteves"],
            "teams": ["ios", "frontend", "design"]
        ] as [String:Any]
        
//        "name": Your real name as a (string)
//        "email": Your e-mail address (string)
//        "about": Tell us about you and why you’re right for the job (string),
//        "urls": A selection of urls, portfolios, projects, LinkedIn, GitHub, Bitbucket, Masterbranch, etc ([string-array]),
//        "teams": Let us know one or more teams you wish to apply for, from: android, ios, backend, frontend, design ([string-array]).
        
        let url = URL(string: "https://mobilejazz.com/jobs/apply")!
        let request = self.urlRequest(url : url, method: "POST", parameters: parameters, timeOutInterval: 10)
        
        URLSession.shared.dataTask(with: request) { (data, response, err) in
            guard let data = data else { return }
            do {
                let jsonRes = try JSONSerialization.jsonObject(with: data, options : .allowFragments) as AnyObject?
                print(" mobilejazz.com apply success ", jsonRes)
            } catch let jsonErr {
                print(" mobilejazz.com apply error ",jsonErr)
            }
        }.resume()
    }
    
    func dateFormat(date : String, format : String) -> String {
        let date = Date(timeIntervalSince1970: Double(date)!)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "\(format)"
        return dateFormatter.string(from: date)
    }
    
}
