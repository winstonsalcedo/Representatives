//
//  RepresentativesController.swift
//  Representatives
//
//  Created by winston salcedo on 5/16/19.
//  Copyright © 2019 Evolve Technologies. All rights reserved.
//

import UIKit

class RepresentativesController {
    
    //baseURL
    static let baseURL = URL(string: "http://whoismyrepresentative.com/getall_reps_bystate.php?")
    // var url = baseURL?.appendingPathComponent("state")
    static func searchRepresentativesFor(state: String, completion: @escaping ([Representative])-> Void){
        //unwrap the URL
        guard let url = baseURL else { completion([]); return}
        //append the API search components
        // url.appendPathExtension(".json")
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        
        let searchQuery = URLQueryItem(name: "state", value: state)
        //need to find out hoe to pass an extension using URLQuery
        let extensionQuery = URLQueryItem(name: "output", value: "json" )
        components?.queryItems = [searchQuery, extensionQuery]
        
        guard let finalURL = components?.url else { completion([]); return }
        
        print(finalURL)
        
        //dataTask
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                print("Something is preventing us from querying the data \(error.localizedDescription)")
            }
            guard let data = data else { completion([]); return }
            
            let jsonDecoder = JSONDecoder()
            do {
                let topLevelResult = try jsonDecoder.decode(TopLevelResult.self, from: data)
                let Representative = topLevelResult.results
                print(Representative)
                completion(Representative)
            }catch {
                print("the following error was found \(error) : \(error.localizedDescription)")
                completion([])
                return
            }
            }.resume()
    }
}

