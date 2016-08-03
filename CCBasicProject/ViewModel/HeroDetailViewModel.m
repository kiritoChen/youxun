//
//  HeroDetailViewModel.m
//  CCBasicProject
//
//  Created by chenc on 16/7/28.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "HeroDetailViewModel.h"

@implementation HeroDetailViewModel
- (instancetype)init{
    if (self = [super init]) {
    }
    return self;
}
- (void)getHeroDetailWithHeroName:(NSString *)enName completionHandler:(void (^)(NSError *))completionHandler{
    [SettingNetManager getHeroDetailWithenName:enName CompletionHandler:^(HeroDetailModel *model, NSError *error) {
        _detailModel = model;
        self.skillDescriptions = @[model.Hero_B.desc, model.Hero_Q.desc, model.Hero_W.desc, model.Hero_E.desc,model.Hero_R.desc];
        self.skillNames = @[model.Hero_B.name, model.Hero_Q.name, model.Hero_W.name, model.Hero_E.name,model.Hero_R.name];
        self.skillFullNames = @[[NSString stringWithFormat:@"被动: %@", self.skillNames[0]],
                            [NSString stringWithFormat:@"Q: %@", self.skillNames[1]],
                            [NSString stringWithFormat:@"W: %@", self.skillNames[2]],
                            [NSString stringWithFormat:@"E: %@", self.skillNames[3]],
                            [NSString stringWithFormat:@"R: %@", self.skillNames[4]]];
        completionHandler(error);
    }];
}
- (NSString *)cnName{
    return self.detailModel.title;
}
- (NSString *)price{
    NSString *price = self.detailModel.price;
    NSArray *arr = [price componentsSeparatedByString:@","];
    return [NSString stringWithFormat:@"金币%@,点券%@", arr[0], arr[1]];
}
- (NSString *)attribute{
    return [NSString stringWithFormat:@"攻%@ 防%@ 法%@ 难度%@", self.detailModel.ratingAttack, self.detailModel.ratingDefense, self.detailModel.ratingMagic, self.detailModel.ratingDifficulty];
}


@end
