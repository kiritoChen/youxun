//
//  Constant.h
//  BasicProject
//
//  Created by chenc on 16/6/24.
//  Copyright © 2016年 cc. All rights reserved.
//

#ifndef Constant_h
#define Constant_h

// 友盟兔玩游戏唯一标识
#define kUMengAPPKey @"5777174d67e58e809c000c6c"

#define kBGColor [UIColor colorWithRed:9/255.0 green:112/255.0 blue:118/255.0 alpha:1]

//屏幕宽度 高度
#define kWindowW [UIScreen mainScreen].bounds.size.width
#define kWindowH [UIScreen mainScreen].bounds.size.height

//三原色的设置
#define kRGBA(R,G,B,A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

//Documents文件夹的路径
#define kDocumentPath NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject

//appdelegate的实例对象
#define kAppdelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)

//把self转化为 __weak __block的方式, 方便的在block中使用而不导致内存循环应用问题
//在宏中使用 \ 可以换行
#define WK(weakSelf) \
__block __weak __typeof(&*self)weakSelf = self;\

//实现归档和解档, 需要遵循 NSCoding 协议  和 引入 <objc/runtime.h>

#define kTeduCoding \
- (void)encodeWithCoder:(NSCoder *)aCoder{\
unsigned int outCount = 0;\
Ivar *varList = class_copyIvarList(self.class, &outCount);\
for (int i = 0; i< outCount; i++) {\
Ivar tmpIvar = varList[i];\
const char *name = ivar_getName(tmpIvar);\
NSString *propertyName = [NSString stringWithUTF8String:name];\
id obj = [self valueForKey:propertyName];\
[aCoder encodeObject:obj forKey:propertyName];\
}\
free(varList);\
}\
\
- (instancetype)initWithCoder:(NSCoder *)aDecoder{\
if (self = [super init]) {\
unsigned int outCount = 0;\
Ivar *varList = class_copyIvarList(self.class, &outCount);\
for (int i = 0; i < outCount; i++) {\
Ivar tmpVar = varList[i];\
const char *name = ivar_getName(tmpVar);\
NSString *propertyName = [NSString stringWithUTF8String:name];\
id obj = [aDecoder decodeObjectForKey:propertyName];\
[self setValue:obj forKey:propertyName];\
}\
free(varList);\
}\
return self;\
}\

//上面的是归档

//通过Storyboard ID 在对应Storyboard中获取场景对象
#define UIStoryBoardBackVC(VCID, SbName)     [[UIStoryboard storyboardWithName:SbName bundle:nil] instantiateViewControllerWithIdentifier:VCID]

//cell的分割线
#define kRemoveCellSeparator \
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{\
cell.separatorInset = UIEdgeInsetsZero;\
cell.layoutMargins = UIEdgeInsetsZero; \
cell.preservesSuperviewLayoutMargins = NO; \
}\


#endif /* Constant_h */
