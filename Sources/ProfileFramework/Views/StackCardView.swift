//
//  File.swift
//  
//
//  Created by Matthew Garlington on 5/29/22.
//


import SwiftUI
import ComposableArchitecture

struct StackCardView: View {
    @EnvironmentObject var homeData: StackCardViewModel
    var post: Post
    // Gesture Properties... fsdafs
    @State var offset: CGFloat = 0
    @State var heightOffset: CGFloat = 0
    @GestureState var isDragging: Bool = false
    @State var endSwipe: Bool = false
    
    public let store: Store<ProfileState, ProfileAction>

    public init(store: Store<ProfileState, ProfileAction>, post: Post) {
        self.store = store
        self.post = post
    }
    
    var body: some View {
        
        WithViewStore(self.store) { (viewStore: ViewStore<ProfileState, ProfileAction>) in
        
        GeometryReader{proxy in
            let size = proxy.size
            
            let index = CGFloat(homeData.getIndex(post: post))
            // Showing Next two cards at top like a Stack...
            let topOffset = (index <= 2 ? index : 2) * 15
            
            ZStack{
                
                PostCard(store: store)
                    .scaleEffect(viewStore.state.longPress ? 0.85 : 1)
                // Reducing width too...
                    .frame(width: size.width - topOffset, height: size.height)
                    .offset(y: -topOffset)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
        }
        .offset(x: offset)
        .rotationEffect(.init(degrees: getRotation(angle: 8)))
        .contentShape(Rectangle().trim(from: 0, to: endSwipe ? 0 : 1))
        .gesture(
        
            DragGesture()
                .updating($isDragging, body: { value, out, _ in
                    out = true
                })
                .onChanged({ value in
                    
                    let translation = value.translation.width
                    offset = (isDragging ? translation : .zero)
                    let heightTranslation = value.translation.height
                    heightOffset = (isDragging ? heightTranslation : .zero)
                })
                .onEnded({ value in
                    
                    let width = getRect().width - 50
                    let height = getRect().height - 50
                    let translation = value.translation.width
                    let heightTranslation = value.translation.height
                    
                    let checkingStatus = (translation > 0 ? translation : -translation)
                    let checkingHeightStatus = (heightTranslation > 0 ? heightTranslation : -heightTranslation)
                    
                    
                    withAnimation{
                        if checkingHeightStatus > (height / 2) {
                            offset = (heightTranslation > 0 ? height : -height * 2)
                            endSwipeActions()
                            
                            if heightTranslation > 0 {
                                upSwipe()
                            } else if heightTranslation < 0{
                                downSwipe()
                            }
                        }
                        if checkingStatus > (width / 2){
                            // remove Card...
                            offset = (translation > 0 ? width : -width) * 2
                            endSwipeActions()
                            
                            if translation > 0{
                                rightSwipe()
                            } else if translation < 0 {
                                leftSwipe()
                            }
                        }
                        else{
                            // reset..
                            offset = .zero
                        }
                    }
                })
        )
        // Receiving Notifications Posted....
        .onReceive(NotificationCenter.default.publisher(for: Notification.Name("ACTIONFROMBUTTON"), object: nil)) { data in
            
            guard let info = data.userInfo else{
                return
            }
            
            let id = info["id"] as? String ?? ""
            let rightSwipe = info["rightSwipe"] as? Bool ?? false
            let leftSwipe = info["leftSwipe"] as? Bool ?? false
            let upSwipe = info["upSwipe"] as? Bool ?? false
            let downSwipe = info["downSwipe"] as? Bool ?? false
            let width = getRect().width - 50
            let height = getRect().height - 50
            
            if post.id == id{
                
                // removing card...
                withAnimation{
                    offset = (rightSwipe ? width : -width) * 2
                    heightOffset = (upSwipe ? height : -height) * 2
                    endSwipeActions()
                    
                    if rightSwipe{
                        self.rightSwipe()
                    }
                    else if leftSwipe {
                        self.leftSwipe()
                    } else if upSwipe {
                        self.upSwipe()
                    } else if downSwipe {
                        self.downSwipe()
                    }
                }
            }
        }
    }
    
    // Rotation...
    func getRotation(angle: Double)->Double{
        
        let rotation = (offset / (getRect().width - 50)) * angle
        
        return rotation
    }
    
    // Rotation...
    func getHeightRotation(angle: Double)->Double{
        
        let rotation = (offset / (getRect().height - 50)) * angle
        
        return rotation
    }
    
    func endSwipeActions(){
        withAnimation(.none){endSwipe = true}
        
        // After the card is moved away removing the card from array to preserve the memory...
        
        // The delay time based on your animation duration...
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            if let _ = homeData.displaying_posts?.first{
                
               let _ = withAnimation{
                    homeData.displaying_posts?.removeFirst()
                }
            }
        }
    }
    
    func leftSwipe(){
        // DO ACTIONS HERE...
        print("Left Swiped")
    }
    
    func rightSwipe(){
        // DO ACTIONS HERE...
        print("Right Swiped")
    }
    func upSwipe() {
        // Do actions for Swiping up
        print("Swipe Up")
    }
    
    func downSwipe() {
        print("Down Swipe")
    }
}

struct StackCardView_Previews: PreviewProvider {
    static let mockStore = Store(
        initialState: ProfileState(),
        reducer:  profileReducer,
        environment: .cancelRequest
    )
    static var previews: some View {
        StackCardView(store: mockStore, post: Post(id: "", name: "", post: "", profilePic: ""))
            .environmentObject(StackCardViewModel())
    }
}

