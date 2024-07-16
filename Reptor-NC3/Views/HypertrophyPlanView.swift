import SwiftUI

struct HypertrophyPlanView: View {
    var body: some View {
        NavigationStack {
            VStack {
                // Recommended Weights
                HStack{
                    Text("Recommended Weights")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .padding(.leading, 15)
                    Spacer()
                }
                
                HStack{
                    Text("84-112 kg")
                    Spacer()
                    Text("60-80% of 140 kg")
                }
                .padding(.horizontal)
                
                Rectangle()
                    .frame(height: 20)
                    .foregroundStyle(Color.blackWhite)
                
                // Recommended Reps
                HStack{
                    Text("Recommended Reps")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .padding(.leading, 15)
                    Spacer()
                }
                
                HStack{
                    Text("8-12 reps")
                    Spacer()
                }
                .padding(.horizontal)
                
                Rectangle()
                    .frame(height: 20)
                    .foregroundStyle(Color.blackWhite)
                
                // Recommended Sets
                HStack{
                    Text("Recommended Sets")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .padding(.leading, 15)
                    Spacer()
                }
                
                HStack{
                    Text("3-4 Sets")
                    Spacer()
                }
                .padding(.horizontal)
                
                Rectangle()
                    .frame(height: 20)
                    .foregroundStyle(Color.blackWhite)
                
                // Recommended Rest
                HStack{
                    Text("Recommended Rest")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .padding(.leading, 15)
                    Spacer()
                }
                
                HStack{
                    Text("1-2 minutes between sets")
                    Spacer()
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding()
//            .navigationBarTitle(Text("Workout Plan").font(.largeTitle), displayMode: .inline)
        }
    }
}

#Preview {
    HypertrophyPlanView()
}
