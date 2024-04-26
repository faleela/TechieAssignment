//
//  MemorizationService.swift
//  PaginationApp
//
//  Created by localuser on 26/04/24.
//

import Foundation

class MemorizationService {
    private var cachedDetail: [Int: String] = [:]
    
    func getAdditionalDetail(for itemid: Int) -> String? {
        if let cachedData = cachedDetail[itemid] {
            return cachedData
        } else {
            return nil
        }
    }
    
    func addDetailtoCache(item: Post) -> String? {
        if let body =  getAdditionalDetail(for: item.id) {
            return body
        } else {
            let postbody = item.body
            let totalword = postbody.components(separatedBy: " ")
            let shuffle = totalword.map { word in
                String(word.shuffled())
            }
            cachedDetail[item.id] = shuffle.joined(separator: " ")
            return cachedDetail[item.id]
        }

    }
}
