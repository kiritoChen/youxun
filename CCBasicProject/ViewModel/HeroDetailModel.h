//
//  HeroDetailModel.h
//  CCBasicProject
//
//  Created by chenc on 16/7/27.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Hero_R,Hero_E,Hero_W,Hero_B,Hero_Q;
@interface HeroDetailModel : NSObject
@property (nonatomic, copy) NSString *ratingAttack;
@property (nonatomic, strong) Hero_W *Hero_W;
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *healthLevel;
@property (nonatomic, copy) NSString *quoteAuthor;
@property (nonatomic, copy) NSString *criticalChanceLevel;
@property (nonatomic, copy) NSString *splashPath;
@property (nonatomic, copy) NSString *manaLevel;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *manaRegenBase;
@property (nonatomic, copy) NSString *attackLevel;
@property (nonatomic, copy) NSString *ratingDifficulty;
@property (nonatomic, strong) NSArray *hate;
@property (nonatomic, copy) NSString *healthRegenBase;
@property (nonatomic, copy) NSString *iconPath;
@property (nonatomic, copy) NSString *magicResistLevel;
@property (nonatomic, copy) NSString *healthBase;
@property (nonatomic, copy) NSString *selectSoundPath;
@property (nonatomic, strong) Hero_R *Hero_R;
@property (nonatomic, strong) Hero_Q *Hero_Q;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) Hero_E *Hero_E;
@property (nonatomic, copy) NSString *armorLevel;
@property (nonatomic, copy) NSString *manaRegenLevel;
@property (nonatomic, copy) NSString *range;
@property (nonatomic, strong) NSArray *like;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *danceVideoPath;
@property (nonatomic, copy) NSString *tags;
@property (nonatomic, copy) NSString *attackBase;
@property (nonatomic, copy) NSString *portraitPath;
@property (nonatomic, copy) NSString *armorBase;
@property (nonatomic, copy) NSString *quote;
@property (nonatomic, copy) NSString *manaBase;
@property (nonatomic, copy) NSString *opponentTips;
@property (nonatomic, strong) Hero_B *Hero_B;
@property (nonatomic, copy) NSString *criticalChanceBase;
@property (nonatomic, copy) NSString *ratingDefense;
@property (nonatomic, copy) NSString *tips;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *healthRegenLevel;
@property (nonatomic, copy) NSString *ratingMagic;
@property (nonatomic, copy) NSString *moveSpeed;
@property (nonatomic, copy) NSString *magicResistBase;
@property (nonatomic, copy) NSString *displayName;
@end

@interface Hero_R : NSObject
@property (nonatomic, copy) NSString *effect;
@property (nonatomic, copy) NSString *cost;
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *cooldown;
@property (nonatomic, copy) NSString *range;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *name;
@end

@interface Hero_E : NSObject
@property (nonatomic, copy) NSString *effect;
@property (nonatomic, copy) NSString *cost;
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *cooldown;
@property (nonatomic, copy) NSString *range;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *name;
@end

@interface Hero_W : NSObject
@property (nonatomic, copy) NSString *effect;
@property (nonatomic, copy) NSString *cost;
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *cooldown;
@property (nonatomic, copy) NSString *range;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *name;
@end

@interface Hero_B : NSObject
@property (nonatomic, copy) NSString *effect;
@property (nonatomic, copy) NSString *cost;
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *cooldown;
@property (nonatomic, copy) NSString *range;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *name;
@end

@interface Hero_Q : NSObject
@property (nonatomic, copy) NSString *effect;
@property (nonatomic, copy) NSString *cost;
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *cooldown;
@property (nonatomic, copy) NSString *range;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *name;
@end

