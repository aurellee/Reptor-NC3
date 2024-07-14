import SwiftUI

struct HypertrophyPlanView: View {
    var body: some View {
        NavigationStack {
            VStack {
                // Category
                ScrollView(.horizontal){
                    HStack(spacing: 10){
                        Text("All")
                            .foregroundStyle(Color.secondary)
                            .padding(.vertical, 7)
                            .padding(.horizontal, 14)
                            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                            .cornerRadius(19)
                            .padding(.leading, 16)
                        Text("Strength")
                            .foregroundStyle(Color.secondary)
                            .padding(.vertical, 7)
                            .padding(.horizontal, 14)
                            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                            .cornerRadius(19)
                        Text("Hypertrophy")
                            .foregroundStyle(Color.boldRed)
                            .padding(.vertical, 7)
                            .padding(.horizontal, 14)
                            .background(Color.lightRed)
                            .cornerRadius(19)
                        Text("Endurance")
                            .foregroundStyle(Color.secondary)
                            .padding(.vertical, 7)
                            .padding(.horizontal, 14)
                            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                            .cornerRadius(19)
                            .padding(.trailing, 16)
                    }
                }
                .padding(.bottom)
                
                // Estimated Rep Maxes
                HStack{
                    Text("Recommended Weights")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .padding(.leading, 15)
                    Spacer()
                }
                
                Spacer()
            }
            .navigationBarTitle(Text("Workout Plan").font(.largeTitle), displayMode: .inline)
        }
    }
}

#Preview {
    HypertrophyPlanView()
}
