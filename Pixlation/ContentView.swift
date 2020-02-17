//
//  ContentView.swift
//  Pixlation
//
//  Created by Chelsie Eiden on 2/12/20.
//  Copyright © 2020 Chelsie Eiden. All rights reserved.
//

import SwiftUI

struct CaptureImageView {
    @Binding var isShown: Bool
    @Binding var image: Image?
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(isShown: $isShown, image: $image)
    }
}

extension CaptureImageView: UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<CaptureImageView>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .camera
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController,
                                context: UIViewControllerRepresentableContext<CaptureImageView>) {
        
    }
}

struct ContentView: View {
    @State var image: Image? = nil
    @State var showCaptureImageView: Bool = false
    
    var body: some View {
        VStack {
            TabView {
                //Photos Tab Content
                ZStack {
                    VStack {
                        Button(action: {
                            self.showCaptureImageView.toggle()
                        }) {
                            Text("Take a photo")
                        }
                        image?.resizable()
//                          .frame(width: 250, height: 250)
//                          .clipShape(Circle())
//                          .overlay(Circle().stroke(Color.white, lineWidth: 4))
//                          .shadow(radius: 10)
                    }
                    if (showCaptureImageView) {
                        CaptureImageView(isShown: $showCaptureImageView, image: $image)
                    }
                }//End photos tab content
                    //Style photos tab button
                    .tabItem {
                        Image(systemName: "1.circle")
                        Text("Photos")
                    }.tag(0)
                //Start flashcards tab content
                Text("Second View")
                    //Style flashcards tab button
                    .tabItem {
                        Image(systemName: "2.circle")
                        Text("Flashcards")
                    }.tag(1)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
