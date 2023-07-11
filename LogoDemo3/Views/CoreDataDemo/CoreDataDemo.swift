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
        VStack {
            List(students) { student in
                Text(student.name ?? "Unkown")
            }
            Button("Add") {
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
            .buttonStyle(GrowingButton())
        }
    }
}

struct CoreDataDemo_Previews: PreviewProvider {
    
    static var previews: some View {
        CoreDataDemo()
            .environment(\.managedObjectContext, DataController().container.viewContext)
    }
}
