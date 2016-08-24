//  main.m
//  ocday01
//
//  Created by 691 on 16/8/19.
//  Copyright © 2016年 691. All rights reserved.
#import <Foundation/Foundation.h>
#import <string.h>
//////////////////////////声明

typedef enum
{   black,
    white,
    gold
} IColor;
@interface Iphone : NSObject
{   @public
    IColor _color;//属性不可以在定义的时候初始化
// 写在类声明的大括号中的变量，我们称之为成员变量（属性，实例变量）
//成员变量（属性）不能离开类，只能通过对象来访问，不能在定义的同时初始化。
//    存储在堆（当前对象对应的堆空间），数据不会自动释放，只能手动释放
}

+(NSNumber*)sum :(NSNumber*)value1 :(NSNumber*)value2;
- (int)sendMessageWithNumber :(NSNumber*) number andContent:(NSString *)content;
-(void)about;
+(NSString*)colorWithNumber:(IColor)number;

@end

////////////////////////////实现
@implementation Iphone
+(NSNumber*)sum :(NSNumber*)value1 :(NSNumber*)value2
//理论上讲类方法和对象方法可以相互调用
//类方法不可以直接访问属性（成员变量，实例变量），不可以直接调用对象方法，但可以间接创建对象进行调用对象方法（2B的表现，企业中不这样用，内存的原因可能）
{ return [NSNumber numberWithFloat: ([value1 floatValue]+[value2 floatValue])];
}
+(NSString*)colorWithNumber:(IColor)number{
    NSString*name;
    switch (number) {
        case 0:
            name= @"黑色";
            break;
        case 1:
            name =@" 白色";
            break;
        case 2:
            name= @"金色";
            break;
    }
    return name;}

- (int)sendMessageWithNumber :(NSNumber*) number andContent:(NSString *)content;
{    NSLog(@"给%@发信息,内容为%@ " ,number ,content);
    return 1;
}
-(void)about{
    NSString*name= [Iphone colorWithNumber:_color];
    NSLog(@"颜色为%@",name);

}
@end

//写在函数和大括号外的变量，成文全局变量，从定义的那一行到文件末尾，可以在定义的同时初始化，
//存储在静态区，程序一启动便会分配存储空间，直到程序结束后才会释放

int main(int argc, const char * argv[]) {
//    写在函数或代码块中的变量称为局部变量，从定义的那一行开始一直到大括号或return
//    局部变量可以在定义的同时初始化
//    存储在栈，系统会自动释放（只要离开作用域）
    Iphone *iphone = [Iphone new];
//    三步，初始化对象，分配空间，保存地址
//    类本身是一个结构体，我们用一个指向结构体的指针iphone，来保存对象de地址，可以通过指针操作结构图的方式操作对象
    iphone->_color=white;
//    第一个对象放到主函数，此行放到前面不会编译的
    NSNumber* c = [NSNumber numberWithInt:151];

    [iphone sendMessageWithNumber:c andContent:@"haha"];
    NSNumber* a = [NSNumber numberWithFloat:10.01f];
    NSNumber* b = [NSNumber numberWithFloat:11.2f];
    NSNumber* result = [Iphone sum:a  :b];
    [iphone about];
    NSLog(@"%@", result);
    NSString* str =[NSString stringWithFormat:@"高%i,宽为%f",1,1.00];
    NSLog(@"%@",str);
    NSString*chuan = @"离";
    NSUInteger len=[chuan length];//计算的个数，不包括\n,不是占用的字节数
    NSLog(@"len= %lu",len);
    return 0;
}
