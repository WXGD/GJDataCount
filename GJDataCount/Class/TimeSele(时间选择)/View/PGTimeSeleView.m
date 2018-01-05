//
//  PGTimeSeleView.m
//  GJDataCount
//
//  Created by apple on 2017/12/16.
//  Copyright © 2017年 apple. All rights reserved.
//

/** 获取屏幕 宽度、高度 */
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
/** 屏幕宽高 */
#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height - 64

#import "PGTimeSeleView.h"

@interface PGTimeSeleView ()<UIPickerViewDelegate, UIPickerViewDataSource> {
    /** 弹框高度 */
    NSInteger viewH;
    /** 弹框y */
    NSInteger viewY;
    /** 日期字符 */
    NSString *dataStr;
    /** 日期字符 */
    NSString *timeStr;
}

/** 背景view */
@property (strong, nonatomic) UIView *backView;
/** 标题view */
@property (strong, nonatomic) UIView *titleView;
/** 取消btn */
@property (strong, nonatomic) UIButton *cancelBtn;
/** 确定btn */
@property (strong, nonatomic) UIButton *confirmBtn;
/** 标题文字 */
@property (strong, nonatomic) UILabel *titleLabel;
/** 分割线view */
@property (strong, nonatomic) UIView *lineView;
/** 内容view */
@property (strong, nonatomic) UIPickerView *contentView;

/** 日期array */
@property (strong, nonatomic) NSArray *dataAry;
/** 时间array */
@property (strong, nonatomic) NSArray *timeAry;
/** 当前选择 */
@property (copy, nonatomic) NSString *contentStr;

@end

@implementation PGTimeSeleView

- (instancetype)init {
    self = [super init];
    if (self) {
        // 尺寸数据
        viewH = 244;
        viewY = [UIScreen mainScreen].bounds.size.height - 244;
        // 选择数据
        self.timeAry = @[@"全天", @"上午", @"下午", @"晚上"];
        self.dataAry = [self latelyEightTime];
        // 默认选择
        dataStr = [self.dataAry firstObject];
        timeStr = [self.timeAry firstObject];
        self.contentStr = [NSString stringWithFormat:@"%@%@", dataStr, timeStr];
        // self尺寸
        self.frame = [UIScreen mainScreen].bounds;
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.3f];
        [self seleObjectLayoutView];
    }
    return self;
}

#pragma makr - 按钮点击
// 取消
- (void)cancelBtnAction:(UIButton *)button {
    [self dismissAnimate];
}

// 确定
- (void)confirmBtnAction:(UIButton *)button {
    [self dismissAnimate];
    if (_confirmBlock) {
        _confirmBlock(self.contentStr);
    }
}


#pragma makr - 创建控件
- (void)seleObjectLayoutView {
    /** 背景view */
    self.backView = [[UIView alloc] init];
    [self addSubview:self.backView];
    /** 标题view */
    self.titleView = [[UIView alloc] init];
    self.titleView.backgroundColor = WhiteColor;
    [self.backView addSubview:self.titleView];
    /** 取消btn */
    self.cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.cancelBtn.normalTitle = @"取消";
    self.cancelBtn.normalTitleColor = ThemeColor;
    [self.cancelBtn addTarget:self action:@selector(cancelBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.titleView addSubview:self.cancelBtn];
    /** 确定btn */
    self.confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.confirmBtn.normalTitle = @"确定";
    self.confirmBtn.normalTitleColor = ThemeColor;
    [self.confirmBtn addTarget:self action:@selector(confirmBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.titleView addSubview:self.confirmBtn];
    /** 标题文字 */
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.text = @"预约时间";
    self.titleLabel.textColor = ThemeColor;
    [self.titleView addSubview:self.titleLabel];
    /** 分割线view */
    self.lineView = [[UIView alloc] init];
    self.lineView.backgroundColor = GrayLineColor;
    [self.backView addSubview:self.lineView];
    /** 内容view */
    self.contentView = [[UIPickerView alloc] init];
    self.contentView.backgroundColor = WhiteColor;
    self.contentView.delegate = self;
    self.contentView.dataSource = self;
    self.contentView.showsSelectionIndicator = YES;
    [self.backView addSubview:self.contentView];
}



#pragma makr - 布局方法
- (void)layoutSubviews {
    [super layoutSubviews];
    @weakify(self)
    /** 内容view */
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.bottom.equalTo(self.backView.mas_bottom);
        make.left.equalTo(self.backView.mas_left);
        make.right.equalTo(self.backView.mas_right);
        make.height.mas_equalTo(@200);
    }];
    /** 分割线view */
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.bottom.equalTo(self.contentView.mas_top);
        make.left.equalTo(self.backView.mas_left);
        make.right.equalTo(self.backView.mas_right);
        make.height.mas_equalTo(@0.5);
    }];
    /** 标题view */
    [self.titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.bottom.equalTo(self.lineView.mas_top);
        make.left.equalTo(self.backView.mas_left);
        make.right.equalTo(self.backView.mas_right);
        make.height.mas_equalTo(@44);
    }];
    /** 取消btn */
    [self.cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.top.equalTo(self.titleView.mas_top);
        make.left.equalTo(self.titleView.mas_left).offset(14);
        make.bottom.equalTo(self.titleView.mas_bottom);
    }];
    /** 确定btn */
    [self.confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.top.equalTo(self.titleView.mas_top);
        make.right.equalTo(self.titleView.mas_right).offset(-14);
        make.bottom.equalTo(self.titleView.mas_bottom);
    }];
    /** 标题文字 */
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.centerX.equalTo(self.titleView.mas_centerX);
        make.centerY.equalTo(self.titleView.mas_centerY);
    }];
}
/** 动画显示 */
- (void)showAnimate {
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:self];
    // 背景view
    self.backView.frame = CGRectMake(0, SCREEN_HEIGHT, ScreenW, viewH);
    // 动画展示
    [UIView animateWithDuration:.7f animations:^{
        self.backView.frame = CGRectMake(0, viewY, ScreenW, viewH);
    } completion:nil];
}
/** 动画销毁 */
- (void)dismissAnimate {
    [UIView animateWithDuration:0.3f animations:^{
        self.backView.frame = CGRectMake(0, SCREEN_HEIGHT, ScreenW, viewH);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

/** 销毁 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self dismissAnimate];
}


#pragma mark - picker代理方法
// 返回多少列
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}
// 返回每列的行数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return self.dataAry.count;
    }else if (component == 1) {
        return self.timeAry.count;
    }
    return 0;
}

// 内容显示
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    UILabel *myView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 180, 30)];
    if (component == 0) {
        myView.text = [self.dataAry objectAtIndex:row];
    }else if (component == 1) {
        myView.text = [self.timeAry objectAtIndex:row];
    }
    myView.textAlignment = NSTextAlignmentCenter;
    myView.font = [UIFont systemFontOfSize:12];
    return myView;
}

// 选中行
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == 0) {
        [self.contentView selectRow:0 inComponent:1 animated:NO];
        if (row == 1) { // 今天
            // 选择时间段(0:上午,1下午:,2晚上)
            [self getTheTimeBucket:row];
            // 保存时间
            timeStr = [self.timeAry objectAtIndex:row];
        }
        // 保存日期
        dataStr = [self.dataAry objectAtIndex:row];
    }else if (component == 1) {
        // 判断日期
        if ([dataStr isEqualToString:[self.dataAry firstObject]]) { // 随时可看
            // 锁定全天选项，不许选择其他
            [self.contentView selectRow:0 inComponent:1 animated:NO];
            // 保存时间
            timeStr = [self.timeAry objectAtIndex:row];
        }else if ([dataStr isEqualToString:[self.dataAry objectAtIndex:1]]) { // 今天
            // 选择时间段(0:上午,1下午:,2晚上)
            [self getTheTimeBucket:row];
            // 保存时间
            timeStr = [self.timeAry objectAtIndex:row];
        }else { // 其他时间
            // 保存时间
            timeStr = [self.timeAry objectAtIndex:row];
        }
    }
    self.contentStr = [NSString stringWithFormat:@"%@%@", dataStr, timeStr];
}



#pragma mark - 封装方法
// 获取未来八天时间 数组
- (NSMutableArray *)latelyEightTime {
    NSMutableArray *eightArr = [[NSMutableArray alloc] init];
    [eightArr addObject:@"随时可看"];
    for (int i = 0; i < 8; i ++) {
        // 从现在开始的24小时
        NSTimeInterval secondsPerDay = i*24*60*60;
        NSDate *curDate = [NSDate dateWithTimeIntervalSinceNow:secondsPerDay];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        // 设置区域
        dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
        [dateFormatter setDateFormat:@"M月d日"];
        NSString *dateStr = [dateFormatter stringFromDate:curDate];//几月几号
        NSDateFormatter *weekFormatter = [[NSDateFormatter alloc] init];
        [weekFormatter setDateFormat:@"EEEE"];//星期几 @"HH:mm 'on' EEEE MMMM d"];
        NSString *weekStr = [weekFormatter stringFromDate:curDate];
        //转换英文为中文
        NSString *chinaStr = [self cTransformFromE:weekStr];
        //组合时间
        NSString *strTime = [NSString stringWithFormat:@"%@ 星期%@",dateStr,chinaStr];
        [eightArr addObject:strTime];
    }
    return eightArr;
}

// 转换英文为中文
- (NSString *)cTransformFromE:(NSString *)theWeek {
    NSString *chinaStr;
    if(theWeek){
        if([theWeek isEqualToString:@"Monday"]) {
            chinaStr = @"一";
        }else if([theWeek isEqualToString:@"Tuesday"]) {
            chinaStr = @"二";
        }else if([theWeek isEqualToString:@"Wednesday"]) {
            chinaStr = @"三";
        }else if([theWeek isEqualToString:@"Thursday"]) {
            chinaStr = @"四";
        }else if([theWeek isEqualToString:@"Friday"]) {
            chinaStr = @"五";
        }else if([theWeek isEqualToString:@"Saturday"]) {
            chinaStr = @"六";
        }else if([theWeek isEqualToString:@"Sunday"]) {
            chinaStr = @"七";
        }
    }
    return chinaStr;
}


// 获取时间段
- (NSInteger)getTheTimeBucket:(NSInteger)row {
    NSDate * currentDate = [NSDate date];
    if ([currentDate compare:[self getCustomDateWithHour:0]] == NSOrderedDescending && [currentDate compare:[self getCustomDateWithHour:11]] == NSOrderedAscending) {
        // 上午
        return 0;
    }if ([currentDate compare:[self getCustomDateWithHour:11]] == NSOrderedDescending && [currentDate compare:[self getCustomDateWithHour:18]] == NSOrderedAscending) {
        // 自动选择下午选项
        if (row == 0) { // 选择全天
            // 自动跳转到下午
            [self.contentView selectRow:2 inComponent:1 animated:NO];
        }else if (row == 1) {// 选择上午
            // 自动跳转到下午
            [self.contentView selectRow:2 inComponent:1 animated:NO];
        }
        // 下午
        return 1;
    }else {
        // 自动选择晚上选项
        [self.contentView selectRow:3 inComponent:1 animated:NO];
        // 晚上
        return 2;
    }
}
// 将时间点转化成日历形式
- (NSDate *)getCustomDateWithHour:(NSInteger)hour {
    //获取当前时间
    NSDate * destinationDateNow = [NSDate date];
    NSCalendar *currentCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *currentComps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    currentComps = [currentCalendar components:unitFlags fromDate:destinationDateNow];
    //设置当前的时间点
    NSDateComponents *resultComps = [[NSDateComponents alloc] init];
    [resultComps setYear:[currentComps year]];
    [resultComps setMonth:[currentComps month]];
    [resultComps setDay:[currentComps day]];
    [resultComps setHour:hour];
    NSCalendar *resultCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    return [resultCalendar dateFromComponents:resultComps];
}

@end







