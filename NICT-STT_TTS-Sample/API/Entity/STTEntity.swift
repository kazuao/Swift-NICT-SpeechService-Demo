//
//  STTEntity.swift
//  NICT-STT_TTS-Sample
//
//  Created by kazunori.aoki on 2022/09/09.
//

import Foundation

struct STTEntity: Codable {
    var type: String
    var session_id: String
    var status: String
    var response: [Res]

    struct Res: Codable {
        var result: String
        var words: [String]
        var determined: Bool
        var time: Int
    }
}
