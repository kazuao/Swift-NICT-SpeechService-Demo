//
//  ContentView.swift
//  NICT-STT_TTS-Sample
//
//  Created by kazunori.aoki on 2022/09/09.
//

import SwiftUI

struct ContentView: View {

    @StateObject var viewModel = ViewModel()

    var body: some View {

        VStack {
            Text(viewModel.sttText)
                .font(.title)
                .padding(.bottom, 20)

            Button(action: { requestSTT() }) {
                Text("Speech to Text")
                    .font(.title.bold())
            }

            Spacer().frame(height: 40)

            Button(action: { requestTTS() }) {
                Text("Text to Speech")
                    .font(.title.bold())
            }
        }
    }

    private func requestSTT() {
        Task {
            do {
                try await viewModel.requestSTT()
            } catch {
                print("Error: ", error.localizedDescription)
            }
        }
    }

    private func requestTTS() {
        Task {
            do {
                try await viewModel.requestTTS()
            } catch {
                print("Error: ", error.localizedDescription)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
