//
//  CoreDataDemo.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2022/11/8.
//

import SwiftUI

struct CoreDataDemo: View {
    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        NavigationStack {
            VStack {
                List(students) { student in
                    Text(student.name ?? "Unkown")
                }
                .listStyle(.plain)
                
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
                        ChangeAppIconView()
                    } label: {
                        Image(systemName: "gearshape.2.fill")
                    }

                }
            }
        }
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
