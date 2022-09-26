//
//  TTSEntity.swift
//  NICT-STT_TTS-Sample
//
//  Created by kazunori.aoki on 2022/09/09.
//

import Foundation

struct TTSRequestEntity: Codable {
    var text: String
    var engine: String
    var lang: String
}
