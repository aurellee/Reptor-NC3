import SwiftUI

struct WeightDistributionView: View {
    var body: some View {
        List {
            ForEach(1..<13) { item in
                HStack(){
                    Text("\(item) reps")
                        .padding(.leading)
                    Spacer()
                    Text("\(144 - item*4) kg")
                    Spacer()
                    Text("\(103 - item*3)%")
                        .padding(.trailing)
                }
                .listRowInsets(EdgeInsets())
            }
        }
        .listStyle(.plain)
        .padding(.horizontal)
    }
}

#Preview {
    WeightDistributionView()
}
