//
//  CoreDataDemo.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2022/11/8.
//

import SwiftUI
import IsScrolling
import AVFoundation

struct CoreDataDemo: View {
    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
    @Environment(\.managedObjectContext) var moc
    @State var isScrolling = false
    @AppStorage("darkModeEnabled") private var darkModeEnabled = false
    @AppStorage("systemThemeEnabled") private var systemThemeEnabled  = false
    @StateObject private var model = DataModel()
    
    var body: some View {
        VStack {
            HStack {
                CameraView(model: model)
//                if let thumbnailImage = model.thumbnailImage {
//                    thumbnailImage
//                        .scaledToFit()
//                        .cornerRadius(10)
//                        .padding()
//                        .frame(width: 120)
//                    //                    }
//                }
                if let lastPhoto = model.camera.lastPhoto {
                    Image(uiImage: lastPhoto)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .cornerRadius(10)
                        .padding()
                }
            }
            Text("Is Scrolling: \(isScrolling.description)")
                .font(.footnote)
                .foregroundStyle(.gray)
            List(students) { student in
                Text(student.name ?? "Unkown")
                    .scrollSensor()
            }
            .listStyle(.plain)
            .scrollStatusMonitor($isScrolling, monitorMode: .common)
            
            Button("Add a random student") {
                addARandomStudent()
            }
            .buttonStyle(GrowingButton())
            .padding(.bottom)
        }
        .navigationTitle("Core Data")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    ChangeAppIconView(darkModeEnabled: $darkModeEnabled, systemThemeEnabled: $systemThemeEnabled)
                } label: {
                    Image(systemName: "gearshape.2.fill")
                }

            }
        }
//        .onAppear {
//            AVCaptureDevice.requestAccess(for: AVMediaType.video) { response in
//                   if response {
//                       print("Responese: \(response)")
//                   } else {
//                       print("No Responese")
//                   }
//               }
//        }
    }
    
    private func addARandomStudent() {
        let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
        let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]
        
        let chosenFirstName = firstNames.randomElement()!
        let chosenLastName = lastNames.randomElement()!
        
        // more code to come
        let student = Student(context: moc)
        student.id = UUID()
        student.name = "\(chosenFirstName) \(chosenLastName)"
        
        try? moc.save()
    }
}

struct CoreDataDemo_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataDemo()
            .environment(\.managedObjectContext, DataController().container.viewContext)
    }
}
