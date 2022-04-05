//
//  Music.swift
//  MyMusicPlayer
//
//  Created by Christianto Vinsen on 05/04/22.
//

import Foundation
import UIKit

struct Music {
    var image: UIImage?
    var title: String?
    var singer: String?
    var lyrics: String?
    var filename: String?
    var filetype: String?
    var startTime: Int
    var endTime: Int
    var isFavorite: Bool
    
    func formattedTime(time: Int) -> String {
        return "\(String(format: "%02d", time / 60)):\(String(format: "%02d", time % 60))"
    }
}

