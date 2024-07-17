//import SwiftUI
//import SwiftData
//
//struct HistoryView: View {
////    @ObservedObject private var viewModel = RMCalculator()
//    @Environment(\.modelContext) var modelContext
//    @Query(sort: [SortDescriptor(\RMData.date, order: .reverse), SortDescriptor(\RMData.exercise, order: .forward)]) var rmData: [RMData]
//    
//    init() {
//        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.boldRed]
//    }
//    
//    var body: some View {
//        NavigationStack {
//            VStack {
//                    ForEach(rmData) { data in
//                        NavigationLink(
//                            destination: ExerciseDetailView(exercise: data.exercise))
//                        {
//                            ZStack {
//                                RoundedRectangle(cornerRadius: 25)
//                                    .foregroundStyle(Color.blackWhite)
//                                    .frame(width: 337, height: 143)
//                                
//                                HStack {
//                                    VStack(alignment: .leading) {
//                                        Text("\(data.exercise)")
//                                            .foregroundStyle(Color.primary)
//                                            .fontWeight(.regular)
//                                        
//                                        Spacer()
//                                        
//                                        Text("\(data.oneRepMax) kg")
//                                            .foregroundStyle(Color.primary)
//                                            .fontWeight(.bold)
//                                            .font(.system(size: 34))
//                                    }
//                                    .padding(.vertical, 25)
//                                    
//                                    Spacer()
//                                    
//                                    VStack(alignment: .trailing) {
//                                        Text("\(data.date)")
//                                            .foregroundStyle(Color.primary)
//                                        
//                                        Spacer()
//                                        
//                                        HStack {
//                                            VStack {
//                                                Text("Weight")
//                                                    .foregroundStyle(Color.primary)
//                                                Text("\(data.weight)")
//                                                    .foregroundStyle(Color.primary)
//                                            }
//                                            
//                                            VStack {
//                                                Text("Rep")
//                                                    .foregroundStyle(Color.primary)
//                                                Text("\(data.reps)")
//                                                    .foregroundStyle(Color.primary)
//                                            }
//                                        }
//                                    }
//                                    .padding(.vertical, 29)
//                                }
//                                .padding(.horizontal, 22)
//                                
//                            }
//                            .padding(.horizontal, 28)
//                        }
//                    }
//                    .onDelete(perform: { indexes in
//                        for index in indexes {
//                            modelContext.delete(rmData[index])
//                        }
//                    })
//                }
//            .navigationBarTitle("Saved Plans")
//        }
//    }
//}
//
//
//#Preview {
//    HistoryView()
//}

import SwiftUI
import SwiftData

struct HistoryView: View {
//    @ObservedObject private var viewModel = RMCalculator()
    @Environment(\.modelContext) var modelContext
    @Query(sort: [SortDescriptor(\RMData.date, order: .reverse), SortDescriptor(\RMData.exercise, order: .forward)]) var rmData: [RMData]
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.boldRed]
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.primaryBackground
                    .ignoresSafeArea(.all)
                
                ScrollView {
                    VStack {
                        ForEach(rmData) { data in
                            NavigationLink(
                                destination: ExerciseDetailView(exercise: data.exercise))
                            {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 25)
                                        .foregroundStyle(Color.blackWhite)
                                        .frame(width: 337, height: 143)
                                    
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Text("\(data.exercise)")
                                                .foregroundStyle(Color.primary)
                                                .fontWeight(.regular)
                                            
                                            Spacer()
                                            
                                            Text("\(data.oneRepMax) kg")
                                                .foregroundStyle(Color.primary)
                                                .fontWeight(.bold)
                                                .font(.system(size: 34))
                                        }
                                        .padding(.vertical, 25)
                                        
                                        Spacer()
                                        
                                        VStack(alignment: .trailing) {
                                            Text("\(data.date)")
                                                .foregroundStyle(Color.primary)
                                            
                                            Spacer()
                                            
                                            HStack {
                                                VStack {
                                                    Text("Weight")
                                                        .foregroundStyle(Color.primary)
                                                    Text("\(data.weight)")
                                                        .foregroundStyle(Color.primary)
                                                }
                                                
                                                VStack {
                                                    Text("Rep")
                                                        .foregroundStyle(Color.primary)
                                                    Text("\(data.reps)")
                                                        .foregroundStyle(Color.primary)
                                                }
                                            }
                                        }
                                        .padding(.vertical, 29)
                                    }
                                    .padding(.horizontal, 22)
                                    
                                }
                                .padding(.horizontal, 28)
                            }
                        }
                        .onDelete(perform: { indexes in
                            for index in indexes {
                                modelContext.delete(rmData[index])
                            }
                        })
                    }
                    .navigationTitle("My Workout Plans")
                }
            }
        }
    }
}


#Preview {
    HistoryView()
}

