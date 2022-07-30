//
//  AuthorList.swift
//  MyFirstSwiftProject
//
//  Created by Mykhailo Kravchenko on 30.07.2022.
//

import Foundation

import SwiftUI

struct AuthorList: View {
    @State private var authors = ["Ivan Dorn", "Morg", "Basta", "Lorak"]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(authors, id: \.self) { author in
                    Text(author)
                }
                .onDelete(perform: delete)
                .onMove(perform: move)
            }
            .navigationBarItems(trailing: EditButton())
        }
    }
    
    func delete(at: IndexSet) {
        authors.remove(atOffsets: at)
    }
    
    func move(from: IndexSet, to: Int) {
        authors.move(fromOffsets: from, toOffset: to)
    }
}


struct AuthorList_Previews: PreviewProvider {
    static var previews: some View {
        AuthorList()
    }
}
