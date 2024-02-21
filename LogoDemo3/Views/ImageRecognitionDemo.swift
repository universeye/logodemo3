//
//  ImageRecognitionDemo.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2024/2/17.
//

import SwiftUI
import Vision

struct ImageRecognitionDemo: View {
    @State private var textt = "no"
    
    var body: some View {
        VStack {
            Text(textt)
                .bold()
                .rotationEffect(.degrees(-40))
        }
        .padding()
        .onAppear {
            self.recognizeImage()
        }
    }
    
    private func recognizeImage() {
        // converting image into CGImage
        guard let cgImage = UIImage(named: "IMG_3597")!.cgImage else {return}
        
        // creating request with cgImage
        let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        
        // Vision provides its text-recognition capabilities through VNRecognizeTextRequest, an image-based request type that finds and extracts text in images.
        let request = VNRecognizeTextRequest { request, error in
             guard let observations = request.results as? [VNRecognizedTextObservation],
             error == nil else {return}
             let text = observations.compactMap({
             $0.topCandidates(1).first?.string
             }).joined(separator: ", ")
             print(text) // text we get from image
            textt = text
        }
        
        request.recognitionLevel = VNRequestTextRecognitionLevel.accurate
        request.recognitionLanguages = ["zh", "en"]
        do {
            try handler.perform([request])
        } catch {
            print("error: \(error.localizedDescription)")
        }
        
        //Just add .fast at the end
//        request.recognitionLevel = VNRequestTextRecognitionLevel.fast
        
        // just add the Language code
//        request.recognitionLanguages = ["Language code you need"]
//        request.recognitionLevel = VNRequestTextRecognitionLevel.accurate
//        try handler.perform([request]
    }
}

#Preview {
    ImageRecognitionDemo()
}
