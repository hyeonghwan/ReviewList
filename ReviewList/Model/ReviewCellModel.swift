//
//  ReviewModel.swift
//  ReviewList
//
//  Created by 박형환 on 2022/09/25.
//

import Foundation


struct ReviewCellDummy{
    static var dummyReviewCellModel: [ReviewCellModel] = [ReviewCellModel(lineFlag: false,
                                                                          content: "안녕하세요"),
                                              ReviewCellModel(lineFlag: false),
                                              ReviewCellModel(lineFlag: false),
                                              ReviewCellModel(lineFlag: false),
                                              ReviewCellModel(lineFlag: false,content: "안녕하세요"),
                                              ReviewCellModel(lineFlag: false,content: "노래하며 같이 이성은 새 미인을 것은 끓는 것이다. 속에 보이는 착목한는 따뜻한 위하여, 약동하다. 없으면 얼음에 열락의 그들에게 그들의 것이다. 원대하고, 대중을 물방아 행복스럽고 얼마나 능히 굳세게 내려온 아름다우냐? 살 심장은 든 소리다.이것은 바로 불러 것이다. 그들에게 트고, 길을 들어 청춘은 힘있다. 인간에 미인을"),
                                              ReviewCellModel(lineFlag: false),
                                             ]
    
}

struct ReviewCellModel {
    var lineFlag: Bool
    var heart: Bool = false
    var content: String = "A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart. I am alone, and feel the charm of existence in this spot, which was created for the bliss of souls like mine. I am so happy, my dear friend, so absorbed in the exquisite sense of mere tranquil existence, that I neglect my talents. I should be incapable of drawing a single stroke at the present moment; and yet I feel that I never was a greater artist than now. When, while the lovely valley teems with vapour around me, and the meridian sun strikes the upper surface of the impenetrable foliage of my trees, and but a few stray gleams steal into the inner sanctuary, I throw myself down among the tall grass by the trickling stream; and, as I lie close to the earth, a thousand unknown plants are noticed by me: when I hear the buzz of the little world among the stalks, and grow familiar with the countless indescribable forms of the insects and flies, then I feel the presence of the Almighty, who formed us in his own image, and the breath"
    var reviewCellTitleData = ReviewCellTitleModel()
    
    init( lineFlag: Bool, content: String ) {
        self.lineFlag = lineFlag
        self.content = content
    }
    init(lineFlag: Bool) {
        self.lineFlag = lineFlag
    }
    
    struct ReviewCellTitleModel{
        var storeTitleImage: String =  "store\(Int.random(in: (1...3)))"
        var storeTitleName: String = ["이자카야","카레츠레","한뚝빼기","노벨밥상"].randomElement()!
        var storeTitleRegion: String = ["강남점","빡코딩점","xxx점"].randomElement()!
        var starRating: String = String(format: "%.1f", Float.random(in: (1...5)))
        var date: String = "2022.09.30"
    }
   
}


