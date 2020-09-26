//
//  APICom.swift
//  MovieApp
//
//  Created by Melih Özkan on 26.09.2020.
//
import Foundation
class APICom: NSObject {
    
    private var Host = ""
    private var server = "https://api.themoviedb.org"
    override init() {
        super.init()
    }
   private var token = "e596a6b41b3d299f99d40bed7277125d"
    
    
    private func addToken (url: String!) -> String
    { var urltmp = url!
        if urltmp.contains("?"){
            urltmp = urltmp + "&api_key=" + self.token
        }else{
            urltmp = urltmp + "?api_key=" + self.token
        }
        return urltmp
    }
    
    func sendRequest(sendData: Data?,function:String, method:String, completion:@escaping (String?)  ->  ()) {
        let url = URL(string: self.addToken(url: self.Host + function))
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod=method
        var rp = "NoN"
        urlRequest.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.httpBody = sendData
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task =  session.dataTask(with:urlRequest, completionHandler: {(data, response, error) in
            guard let data = data, error == nil else {
                rp = error?.localizedDescription ?? "no-data"
                completion(rp)
                return
            }
            rp = String(data:data, encoding: .utf8) ?? "Encode Error - Apıcall"
            completion(rp)
        })
        
        task.resume()
    }
    
    
    
    
}
