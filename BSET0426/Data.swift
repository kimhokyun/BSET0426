//
//  Data.swift
//  BSET0426
//
//  Created by hokyun Kim on 2023/04/26.
//

import Foundation
struct Data: Codable {
    let groupMember: [GroupMember]
}

struct GroupMember: Codable {
    let group_id: String
    let group_name: String
    let member: [Member]
}

struct Member: Codable {
    let id: String
    let name: String
    let imageFile: String
}



struct ConversationResponse: Codable {
    let conversation: Conversation
}

struct Conversation: Codable {
    let keyword: String
    let response: String
}

class Data2 {
    static func fetchConversation(keyword: String, completion: @escaping (Conversation?) -> Void) {
        guard let encodedKeyword = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            // Handle error here
            return
        }
        guard let url = URL(string: "http://localhost:3300/dcx/3/conversation/\(encodedKeyword)") else {
            print("Invalid URL")
            print("http://localhost:3300/dcx/3/conversation/\(encodedKeyword)")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(ConversationResponse.self, from: data)
                completion(response.conversation)
            } catch {
                print(error)
                completion(nil)
            }
        }
        task.resume()
    }
}
