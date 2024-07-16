import SwiftUI

struct EndurancePlanView: View {
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
                    Text("56-184 kg")
                    Spacer()
                    Text("40-60% of 140 kg")
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
                    Text("15-20 reps")
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
                    Text("2-3 Sets")
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
                    Text("30-60 seconds between sets")
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
    EndurancePlanView()
}
