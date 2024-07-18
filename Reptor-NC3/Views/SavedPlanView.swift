import SwiftUI
import SwiftData

struct SavedPlanView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: [SortDescriptor(\RMData.datetime, order: .reverse)]) var rmData: [RMData]
    @StateObject private var savedPlanViewModel = SavedPlanViewModel()
    
    var exercises: [String] = []
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.boldRed]
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.primaryBackground
                    .ignoresSafeArea(.all)
                
                ScrollView {
                    VStack (spacing: 16) {
                        Spacer().frame(height: 10)
                        ForEach(savedPlanViewModel.uniqueExercises(rmData).prefix(3)) { data in
                            NavigationLink(
                                destination: ExerciseDetailView(exercise: data.exercise)
                                    .toolbar(.hidden, for: .tabBar))
                            {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 25)
                                        .foregroundStyle(Color.listFill)
                                        .frame(width: 358, height: 143)
                                    
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
                                                        .foregroundStyle(Color.secondary)
                                                    Text("\(data.weight)")
                                                        .foregroundStyle(Color.primary)
                                                }
                                                
                                                VStack {
                                                    Text("Rep")
                                                        .foregroundStyle(Color.secondary)
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
                    .navigationTitle("Saved Plans")
                }
            }
        }
    }
}


#Preview {
    SavedPlanView()
}

