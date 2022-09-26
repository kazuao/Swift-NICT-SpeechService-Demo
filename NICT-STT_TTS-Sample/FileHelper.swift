//
//  FileHelper.swift
//  NICT-STT_TTS-Sample
//
//  Created by kazunori.aoki on 2022/09/09.
//

import Foundation

struct FileHelper {

    static var audioFile: Data? {
        return NSData(contentsOf: soundFileURL()) as Data?
    }

    static func soundFileURL() -> URL {
        return Bundle.main.url(forResource: "audio", withExtension: "raw")!
    }
}
